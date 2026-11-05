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

#let csp = "default-src 'self'; img-src 'self' data:; style-src 'self' 'unsafe-inline' https://fonts.googleapis.com; font-src https://fonts.gstatic.com; script-src 'none'; object-src 'none'; base-uri 'none'; form-action 'self'"

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
    ]
    #e("body")[
      #e("a", attrs: (class: "skip", href: "#content"))[Skip to main content]
      #e("header", attrs: (class: "top"))[
        #e("div", attrs: (class: "in"))[
          #e("a", attrs: (class: "name", href: "/index.html"))[Shashank Pritam]
          #e("nav", attrs: (class: "pages", aria-label: "Pages"))[
            #for (p, label) in pages {
              let a = (href: "/" + p + ".html")
              if p == here { a.insert("aria-current", "page") }
              e("a", attrs: a)[#label]
            }
          ]
          #e("input", attrs: (type: "checkbox", id: "flip", aria-label: "Switch between light and dark"))#e("label", attrs: (class: "flip", "for": "flip", title: "Switch between light and dark"))[#e("span")[]]
        ]
      ]
      #e("div", attrs: (class: "shell"))[
        #e("aside", attrs: (class: "profile", aria-label: "Profile"))[
          #e("p", attrs: (class: "role"))[Postdoctoral Fellow]
          #e("p")[Bazykin Lab, Emory University, Atlanta]
          #e("ul")[
            #for (n, u) in elsewhere { e("li")[#e("a", attrs: (rel: "me", href: u))[#n]] }
            #e("li")[#link("https://cal.com/shashankpritam")[Book a chat]]
          ]
          #if toc.len() > 0 {
            e("nav", attrs: (class: "toc", aria-label: "On this page"))[
              #e("p", attrs: (class: "label"))[On this page]
              #e("ul")[#for (id, t) in toc { e("li")[#e("a", attrs: (href: "#" + id))[#t]] }]
            ]
          }
        ]
        #e("main", attrs: (id: "content"))[#body]
      ]
    ]
  ]
]
