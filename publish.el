;;; publish.el --- org-publish build script for shashankpritam.github.io  -*- lexical-binding: t; -*-

(require 'org)
(require 'ox-html)
(require 'ox-publish)

;; Work relative to this file's directory so CI and local builds agree
(setq default-directory
      (file-name-directory (or load-file-name buffer-file-name)))

;; ---- HTML snippets ----

(defvar sp/html-head
  "<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<meta http-equiv='Content-Security-Policy' content=\"default-src 'self'; img-src 'self' data:; style-src 'self' 'unsafe-inline' https://fonts.googleapis.com; font-src https://fonts.gstatic.com; script-src 'self'; object-src 'none'; base-uri 'none'; form-action 'self'\">
<meta name='description' content='Shashank Pritam — computational biologist working on population genetics, epidemiology, and evolutionary dynamics.'>
<link rel='icon' type='image/svg+xml' href='/favicon.svg'>
<link rel='stylesheet' href='https://fonts.googleapis.com/css2?family=Geist:wght@400..700&amp;family=Geist+Mono:wght@400..600&amp;display=swap'>
<link rel='stylesheet' href='/css/style.css'>
<script src='/theme.js'></script>")

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

(defun sp/link (cls href label)
  (format "<a%s href='%s'>%s</a>" cls href label))

(defun sp/preamble (plist)
  "Skip link, name, the page bar, and the current page's sections."
  (let* ((file (plist-get plist :input-file))
         (here (file-name-base file))
         (secs (sp/sections file)))
    (concat
     "<a class='skip' href='#content'>Skip to text</a>\n"
     "<div class='wrap brand'><h1>Shashank Pritam</h1><span class='muted'>Computational biologist</span><button type='button' id='theme-cycle' hidden><span></span></button></div>\n"
     "<nav class='bar' aria-label='Pages'><div class='wrap'>\n"
     (mapconcat
      (lambda (p)
        (sp/link (if (string= (car p) here) " aria-current='page'" "")
                 (format "/%s.html" (car p)) (cdr p)))
      sp/pages "\n")
     "\n</div></nav>"
     (when secs
       (concat "\n<nav class='wrap toc' aria-label='On this page'>"
               (mapconcat (lambda (s) (sp/link "" (concat "#" (car s)) (cdr s))) secs "\n")
               "</nav>")))))

(defvar sp/footer
  ;; The outward links come after the page, so a phone reaches the text first.
  (concat "<div class='wrap'>\n<nav class='else' aria-label='Elsewhere'>\n<h2>Elsewhere</h2>\n<p>"
          (mapconcat (lambda (e) (sp/link " rel='me'" (cdr e) (car e))) sp/elsewhere "\n")
          "</p>\n<h2>Say hello</h2>\n<p>"
          (sp/link "" "https://cal.com/shashankpritam" "Book a chat")
          "</p>\n</nav>\n<p class='stamp'>Last modified <span class='t'>" (format-time-string "%a %b %d %Y") "</span></p>
<div class='badges'>
<span class='b emacs'><span class='l'>GNU</span><span class='r'>EMACS<br>POWERED</span></span>
<span class='b org'><span class='r'>MADE WITH<br>ORG-MODE</span></span>
<span class='b any'><span class='r'>BEST VIEWED WITH<br>ANY BROWSER</span></span>
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
         :html-divs                       ((preamble "header" "preamble")
                                           (content "main" "content")
                                           (postamble "footer" "postamble"))
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
         :base-extension       "css\\|js\\|jpg\\|jpeg\\|png\\|gif\\|svg\\|ico\\|webp\\|woff2\\|woff\\|pdf\\|mp4\\|webm\\|mp3\\|ogg"
         :publishing-directory "public/"
         :recursive            t
         :publishing-function  org-publish-attachment)

        ("sp" :components ("sp-pages" "sp-static"))))

;; Force full rebuild (ignore timestamps)
(org-publish "sp" t)
