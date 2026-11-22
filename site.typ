// A page that is not included here is never built.
#include "pages/index.typ"
#include "pages/publications.typ"
#include "pages/cv.typ"
#include "pages/uses.typ"
#include "pages/404.typ"

// Same for static/: only the files named in this list reach docs/.
#let shipped = (
  "css/style.css",
  "favicon.svg",
  "card.png",
  "fonts/NordwandMono-Regular.woff2",
  "fonts/NordwandMono-Bold.woff2",
  "fonts/OFL.txt",
  "CNAME",
)
#for file in shipped {
  asset(file, read("static/" + file, encoding: none))
}

// An empty file that keeps Pages from running Jekyll over docs/.
#asset(".nojekyll", bytes(()))
