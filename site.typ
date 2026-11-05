// The whole site as one Typst bundle: each page file adds a #document, static/ goes out as assets.
#include "pages/index.typ"
#include "pages/publications.typ"
#include "pages/pictures.typ"
#include "pages/notebook.typ"

#for f in ("css/style.css", "favicon.svg", "pics/uni.jpg", "pics/sneak.jpg", "pics/mrturt.jpg") {
  asset(f, read("static/" + f, encoding: none))
}
#asset(".nojekyll", bytes(()))
