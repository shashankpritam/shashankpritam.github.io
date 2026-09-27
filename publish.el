;;; publish.el --- org-publish build script for shashankpritam.github.io

(require 'org)
(require 'ox-html)
(require 'ox-publish)

;; Work relative to this file's directory so CI and local builds agree
(setq default-directory
      (file-name-directory (or load-file-name buffer-file-name)))

;; Ensure ~/.local/bin (D2 install location) is on PATH
(let ((local-bin (expand-file-name "~/.local/bin")))
  (when (file-directory-p local-bin)
    (setenv "PATH" (concat local-bin ":" (getenv "PATH")))
    (add-to-list 'exec-path local-bin)))


;; ---- D2 babel integration ----
;; Evaluates #+BEGIN_SRC d2 blocks and returns inline SVG.
;; #+BEGIN_SRC d2math wraps content in a D2 latex shape automatically.

(defun sp/d2-compile (body &rest extra-args)
  "Compile D2 source BODY to SVG string, or nil on failure.
EXTRA-ARGS are additional arguments passed to the d2 binary."
  (let* ((tmp-in  (make-temp-file "d2-" nil ".d2"))
         (tmp-out (make-temp-file "d2-" nil ".svg")))
    (unwind-protect
        (progn
          (write-region body nil tmp-in)
          (when (= 0 (apply #'call-process "d2" nil nil nil
                            (append extra-args (list tmp-in tmp-out))))
            (with-temp-buffer
              (insert-file-contents tmp-out)
              ;; Strip XML declaration — invalid when embedded in HTML
              (goto-char (point-min))
              (when (looking-at "<\\?xml[^?]*\\?>\\s-*")
                (replace-match ""))
              (buffer-string))))
      (ignore-errors (delete-file tmp-in))
      (ignore-errors (delete-file tmp-out)))))

(defun org-babel-execute:d2 (body _params)
  "org-babel handler for d2 source blocks."
  (let ((svg (or (sp/d2-compile body)
                 (error "D2 compilation failed — is d2 on PATH?"))))
    (format "<div class=\"d2diagram\">%s</div>" svg)))

(defun sp/svg-set-em-size (svg height-em)
  "Set width/height on the outer SVG in em units derived from its viewBox.
This avoids browser ambiguity when only one CSS dimension is set,
which causes preserveAspectRatio=meet to scale against the wrong axis."
  (if (string-match "viewBox=\"0 0 \\([0-9.]+\\) \\([0-9.]+\\)\"" svg)
      (let* ((vw (string-to-number (match-string 1 svg)))
             (vh (string-to-number (match-string 2 svg)))
             (attrs (format "width=\"%.4fem\" height=\"%.4fem\" "
                            (* height-em (/ vw vh)) height-em)))
        ;; Splice attrs after the very first "<svg " only
        (if (string-match "<svg " svg)
            (concat (substring svg 0 (match-end 0))
                    attrs
                    (substring svg (match-end 0)))
          svg))
    svg))

(defun org-babel-execute:d2math (body _params)
  "org-babel handler for d2math blocks: wraps BODY as a D2 latex shape."
  (let* ((d2-src (format "\"\": |latex\n  %s\n|" (string-trim body)))
         (svg (or (sp/d2-compile d2-src "--pad" "8")
                  (error "D2 math compilation failed — is d2 on PATH?")))
         (sized (sp/svg-set-em-size svg 2.5)))
    (format "<span class=\"d2math\">%s</span>" sized)))

;; Register d2/d2math as babel languages without external ob-*.el files
(provide 'ob-d2)
(provide 'ob-d2math)
(setq org-export-use-babel t)
(setq org-confirm-babel-evaluate nil)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((d2     . t)
   (d2math . t)))

;; Tell org-babel these languages return raw HTML (set after load)
(setq org-babel-default-header-args:d2
      '((:results . "html") (:exports . "results")))
(setq org-babel-default-header-args:d2math
      '((:results . "html") (:exports . "results")))

;; ---- HTML snippets ----

(defvar sp/html-head
  "<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<meta http-equiv='Content-Security-Policy' content=\"default-src 'self'; img-src 'self' data:; style-src 'self' 'unsafe-inline' https://fonts.googleapis.com; font-src https://fonts.gstatic.com; script-src 'none'; object-src 'none'; base-uri 'none'; form-action 'self'\">
<meta name='description' content='Shashank Pritam — computational biologist working on population genetics, epidemiology, and evolutionary dynamics.'>
<link rel='icon' type='image/svg+xml' href='/favicon.svg'>
<link rel='stylesheet' href='/css/style.css'>")

(defvar sp/pages
  '(("index" . "Home") ("publications" . "Publications")
    ("pictures" . "Pictures") ("notebook" . "Notebook")))

(defvar sp/elsewhere
  '(("GitHub" . "https://github.com/shashankpritam")
    ("ORCID" . "https://orcid.org/0009-0009-4228-7883")
    ("Google Scholar" . "https://scholar.google.com/citations?user=E5oKLgkAAAAJ&amp;hl=en")
    ("Bluesky" . "https://bsky.app/profile/shashankpritam.bsky.social")
    ("sifa.id" . "https://sifa.id/p/shashankpritam.bsky.social")))

(defun sp/sections (file)
  "Top-level headings of FILE that carry a CUSTOM_ID, as (ID . TITLE)."
  (with-temp-buffer
    (insert-file-contents file)
    (delay-mode-hooks (org-mode))
    (delq nil (org-map-entries
               (lambda () (when-let* ((id (org-entry-get nil "CUSTOM_ID")))
                            (cons id (org-get-heading t t t t))))
               "LEVEL=1"))))

(defun sp/preamble (plist)
  "Top bar and sidebar; the current page is marked and lists its sections."
  (let* ((file (plist-get plist :input-file))
         (here (file-name-base file))
         (link (lambda (cls href label) (format "<a%s href='%s'>%s</a>" cls href label))))
    (concat
     "<div class='top'><b>Shashank Pritam</b>"
     "<small>Postdoctoral Fellow &middot; Bazykin Lab &middot; Emory University</small></div>\n"
     "<nav class='side'>\n"
     (mapconcat
      (lambda (p)
        (let ((on (string= (car p) here)))
          (concat (funcall link (if on " class='on'" "") (format "/%s.html" (car p)) (cdr p))
                  (when on
                    (mapconcat (lambda (s) (funcall link " class='sub'" (concat "#" (car s)) (cdr s)))
                               (sp/sections file))))))
      sp/pages "\n")
     "\n<h4>Elsewhere</h4>\n"
     (mapconcat (lambda (e) (funcall link " rel='me'" (cdr e) (car e))) sp/elsewhere "\n")
     "\n<h4>Say hello</h4>\n"
     (funcall link "" "https://cal.com/shashankpritam" "Book a chat")
     "\n</nav>")))

(defvar sp/footer
  (concat "<div class='foot'>Last modified: " (format-time-string "%a %b %d %Y") "
<div class='badges'>
<span class='b' style='background:#7f5ab6;color:#fff'><span class='l' style='background:#4b2c7f'>GNU</span><span class='r'>EMACS<br>POWERED</span></span>
<span class='b' style='background:#77aa99'><span class='r'>MADE WITH<br>ORG-MODE</span></span>
<span class='b' style='background:#000;color:#0f0'><span class='r'>NO JAVASCRIPT<br>INSIDE</span></span>
<span class='b' style='background:#ffc'><span class='r'>BEST VIEWED WITH<br>ANY BROWSER</span></span>
</div></div>"))

;; ---- Project definition ----

(setq org-publish-project-alist
      `(("sp-pages"
         :base-directory       "org/"
         :base-extension       "org"
         :publishing-directory "public/"
         :recursive            nil
         :publishing-function  org-html-publish-to-html

         ;; HTML settings
         :html-doctype                    "html5"
         :html-html5-fancy                t
         :html-container                  "section"
         :html-head                       ,sp/html-head
         :html-preamble                   sp/preamble
         :html-postamble                  ,sp/footer
         :html-head-include-default-style nil
         :html-head-include-scripts       nil
         :html-validation-link            nil
         :html-toplevel-hlevel            2
         :html-table-attributes           nil

         ;; Export settings
         :with-title          nil
         :with-latex          nil
         :with-author         nil
         :with-creator        nil
         :with-date           nil
         :with-toc            nil
         :section-numbers     nil
         :time-stamp-file     nil
         :headline-levels     4)

        ("sp-static"
         :base-directory       "static/"
         :base-extension       "css\\|jpg\\|jpeg\\|png\\|gif\\|svg\\|ico\\|webp\\|woff2\\|woff\\|pdf\\|mp4\\|webm\\|mp3\\|ogg"
         :publishing-directory "public/"
         :recursive            t
         :publishing-function  org-publish-attachment)

        ("sp" :components ("sp-pages" "sp-static"))))

;; Force full rebuild (ignore timestamps)
(org-publish "sp" t)
