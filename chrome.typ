// The chrome every page shares: head, header with the page bar, footer.
#let e = html.elem

#let pages = (
  ("index", "Home"), ("publications", "Publications"),
  ("pictures", "Pictures"), ("notebook", "Notebook"))

#let elsewhere = (
  ("GitHub", "https://github.com/shashankpritam"),
  ("ORCID", "https://orcid.org/0009-0009-4228-7883"),
  ("Google Scholar", "https://scholar.google.com/citations?user=E5oKLgkAAAAJ&hl=en"),
  ("Bluesky", "https://bsky.app/profile/shashankpritam.bsky.social"),
  ("sifa.id", "https://sifa.id/p/shashankpritam.bsky.social"))

#let csp = "default-src 'self'; img-src 'self' data:; style-src 'self' 'unsafe-inline' https://fonts.googleapis.com; font-src https://fonts.gstatic.com; script-src 'self'; object-src 'none'; base-uri 'none'; form-action 'self'"

// A top-level block of a page: an h2 over its body. `id` makes it a link target and puts it in the row under the bar.
#let section(title, id: none, cls: none, body) = {
  let a = (:)
  if cls != none { a.insert("class", cls) }
  e("section", attrs: a)[
    #e("h2", attrs: if id == none { (:) } else { (id: id) })[#title]
    #body
  ]
}

// One page. `toc` lists (id, title) pairs for the "On this page" row.
#let page(here, title: "Shashank Pritam", toc: (), body) = document(here + ".html", title: title)[
  #e("html", attrs: (lang: "en"))[
    #e("head")[
      #e("meta", attrs: (charset: "utf-8"))
      #e("meta", attrs: (name: "viewport", content: "width=device-width, initial-scale=1"))
      #e("meta", attrs: (http-equiv: "Content-Security-Policy", content: csp))
      #e("meta", attrs: (name: "description", content: "Shashank Pritam, computational biologist working on population genetics, epidemiology, and evolutionary dynamics."))
      #e("title")[#title]
      #e("link", attrs: (rel: "icon", type: "image/svg+xml", href: "/favicon.svg"))
      #e("link", attrs: (rel: "stylesheet", href: "https://fonts.googleapis.com/css2?family=Geist:wght@400..700&family=Geist+Mono:wght@400..600&display=swap"))
      #e("link", attrs: (rel: "stylesheet", href: "/css/style.css"))
      #e("script", attrs: (src: "/theme.js"))[]
    ]
    #e("body")[
      #e("header", attrs: (id: "preamble"))[
        #e("a", attrs: (class: "skip", href: "#content"))[Skip to text]
        #e("div", attrs: (class: "wrap brand"))[
          #e("h1")[Shashank Pritam]
          #e("span", attrs: (class: "muted"))[Computational biologist]
          #e("div", attrs: (id: "theme-pick", role: "group", aria-label: "Theme", hidden: ""))[]
        ]
        #e("nav", attrs: (class: "bar", aria-label: "Pages"))[
          #e("div", attrs: (class: "wrap"))[
            #for (p, label) in pages {
              let a = (href: "/" + p + ".html")
              if p == here { a.insert("aria-current", "page") }
              e("a", attrs: a)[#label]
            }
          ]
        ]
        #if toc.len() > 0 {
          e("nav", attrs: (class: "wrap toc", aria-label: "On this page"))[
            #for (id, t) in toc { e("a", attrs: (href: "#" + id))[#t] }
          ]
        }
      ]
      #e("main", attrs: (id: "content"))[#body]
      #e("footer", attrs: (id: "postamble"))[
        #e("div", attrs: (class: "wrap"))[
          #e("nav", attrs: (class: "else", aria-label: "Elsewhere"))[
            #e("h2")[Elsewhere]
            #e("p")[#for (n, u) in elsewhere { e("a", attrs: (rel: "me", href: u))[#n] }]
            #e("h2")[Say hello]
            #e("p")[#link("https://cal.com/shashankpritam")[Book a chat]]
          ]
          #e("p", attrs: (class: "stamp"))[Last modified #e("span", attrs: (class: "t"))[#datetime.today().display("[weekday repr:short] [month repr:short] [day] [year]")]]
          #e("div", attrs: (class: "badges"))[
            #e("span", attrs: (class: "b org"))[#e("span", attrs: (class: "r"))[MADE WITH#linebreak()TYPST]]
            #e("span", attrs: (class: "b any"))[#e("span", attrs: (class: "r"))[BEST VIEWED WITH#linebreak()ANY BROWSER]]
          ]
        ]
      ]
    ]
  ]
]
