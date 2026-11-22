// The picture on the card an app shows when the site's address is shared (og:image).
// Not part of the site build. After a change, redraw it with
//   typst compile --ppi 144 card.typ static/card.png
// which gives 1200 by 630 pixels and needs Nordwand Mono installed on this machine.
#set page(width: 600pt, height: 315pt, margin: (x: 56pt, top: 64pt, bottom: 44pt), fill: rgb("#F6F8FA"))
#set text(font: "Nordwand Mono", size: 15pt, fill: rgb("#1B2530"), ligatures: false)
#set par(leading: 0.75em)
#let muted = rgb("#55626F")

#text(size: 34pt, weight: "bold")[Shashank Pritam]
#v(-10pt)
#text(size: 17pt, fill: muted)[computational biologist]
#v(14pt)
#line(length: 100%, stroke: 1pt + rgb("#DCE2E8"))
#v(10pt)
Population genetics and genomics of mobile genetic elements, from transposons to viruses.
#v(1fr)
#text(fill: rgb("#27597F"))[shashankpritam.com]
