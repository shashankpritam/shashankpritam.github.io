// What every page shares: the HTML head, the nav, and the few building blocks
// the files in pages/ are written with.

// e("p")[text] writes <p>text</p>; attrs: (class: "x") sets its attributes.
#let e = html.elem

#let author = "Shashank Pritam"
#let site = "https://shashankpritam.com/"
#let about = "Shashank Pritam, computational biologist working on the population genetics and genomics of mobile genetic elements."

// Nav order, as (file name, label). A new page also needs its pages/NAME.typ
// and an include in site.typ.
#let pages = (
  ("index", "home"),
  ("publications", "publications"),
  ("cv", "cv"),
  ("uses", "uses"),
)

// Profile addresses used on more than one page.
#let links = (
  scholar: "https://scholar.google.com/citations?user=E5oKLgkAAAAJ&hl=en",
  orcid: "https://orcid.org/0009-0009-4228-7883",
)

// Only this site's own files: no script, no inline style, nothing from other hosts.
#let csp = (
  "default-src 'self'",
  "img-src 'self' data:",
  "style-src 'self'",
  "font-src 'self'",
  "script-src 'none'",
  "object-src 'none'",
  "base-uri 'none'",
  "form-action 'self'",
).join("; ")


// Building blocks for a page's body.

// A heading with its body. Heading capitals are typed by hand; the indent is CSS.
#let section(title, body) = e("section")[
  #e("h2")[#title]
  #body
]

// A line with a smaller one under it.
#let entry(main, sub) = [#main#e("small")[#sub]]

// A two-column list. Each argument is a pair: what goes on the left, then the
// entry. `class: "wide"` widens the left column.
#let rows(class: none, ..pairs) = {
  let attrs = if class == none { (:) } else { (class: class) }
  e("dl", attrs: attrs)[
    #for (left, right) in pairs.pos() {
      e("dt")[#left]
      e("dd")[#right]
    }
  ]
}


// The frame around a page's body.

#let meta(..attrs) = e("meta", attrs: attrs.named())

#let page-head(here, title, desc) = {
  let address = site + if here == "index" { "" } else { here + ".html" }
  e("head")[
    #meta(charset: "utf-8")
    #meta(name: "viewport", content: "width=device-width, initial-scale=1")
    #meta(http-equiv: "Content-Security-Policy", content: csp)
    #meta(name: "description", content: desc)
    #meta(name: "color-scheme", content: "light dark")
    #meta(property: "og:type", content: "website")
    #meta(property: "og:title", content: title)
    #meta(property: "og:description", content: desc)
    #meta(property: "og:url", content: address)
    // The picture on the card an app shows when the address is shared; drawn by card.typ.
    #meta(property: "og:image", content: site + "card.png")
    #meta(property: "og:image:width", content: "1200")
    #meta(property: "og:image:height", content: "630")
    #meta(property: "og:image:alt", content: about)
    #meta(name: "twitter:card", content: "summary_large_image")
    #e("title")[#title]
    #for weight in ("Regular", "Bold") {
      e("link", attrs: (
        rel: "preload",
        href: "/fonts/NordwandMono-" + weight + ".woff2",
        "as": "font",
        type: "font/woff2",
        crossorigin: "anonymous",
      ))
    }
    // Prefetch the other pages, except from the 404 page, where a stray
    // visit should fetch nothing more.
    #for (name, _) in pages {
      if name != here and here != "404" {
        e("link", attrs: (rel: "prefetch", href: "/" + name + ".html"))
      }
    }
    #e("link", attrs: (rel: "icon", type: "image/svg+xml", href: "/favicon.svg"))
    #e("link", attrs: (rel: "stylesheet", href: "/css/style.css"))
  ]
}

// The link to the page being read is marked for screen readers and the CSS.
#let page-nav(here) = e("nav", attrs: (aria-label: "Pages"))[
  #for (name, label) in pages {
    let attrs = (href: "/" + name + ".html")
    if name == here { attrs.insert("aria-current", "page") }
    e("a", attrs: attrs)[#label]
  }
]

// page("cv", "CV")[body] writes cv.html.
//   here     the file name without .html, as in `pages`
//   heading  a string: the h1 and, off the home page, the start of the title
//   desc     the description for search engines and link previews
//   role     an optional line under the h1
#let page(here, heading, desc: about, role: none, body) = {
  let title = if here == "index" { author } else { heading + ": " + author }
  document(here + ".html", title: title)[
    #e("html", attrs: (lang: "en"))[
      #page-head(here, title, desc)
      #e("body")[
        #e("a", attrs: (class: "skip", href: "#content"))[Skip to main content]
        #e("div", attrs: (class: "page"))[
          #page-nav(here)
          #e("main", attrs: (id: "content"))[
            #e("h1")[#heading]
            #if role != none { e("p", attrs: (class: "role"))[#role] }
            #body
          ]
        ]
      ]
    ]
  ]
}
