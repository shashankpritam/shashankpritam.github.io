#import "../chrome.typ": *

// Every paper, from papers.toml, which the CVs read too.
#let papers = toml("../papers.toml").publications

// "Shashank Pritam" becomes "S. Pritam".
#let short(name) = {
  let words = name.split(" ")
  words.first().first() + ". " + words.slice(1).join(" ")
}

// One row per paper: the year, the linked title, then the citation.
// A paper's fields are listed in README.txt; title may hold Typst markup.
#let paper(p) = {
  let url = if "doi" in p { "https://doi.org/" + p.doi } else { p.at("url", default: none) }
  let title = eval(p.title, mode: "markup")
  // Authors and venue always print; the rest only where the paper has them.
  let citation = (
    [#p.authors.map(short).join(", ").],
    [#p.venue.],
    if "status" in p [#p.status.],
    if "code" in p [#link(p.code)[Code].],
    if "fulltext" in p [#link(p.fulltext)[Free full text].],
  ).filter(part => part != none)
  (p.year, entry(if url == none { title } else { link(url, title) }, citation.join(" ")))
}

#page("publications", "Publications", desc: "Preprints, articles and reviews by Shashank Pritam.")[
  #for (kind, heading) in (("preprint", "PREPRINTS"), ("article", "ARTICLES"), ("review", "REVIEWS")) {
    section(heading, rows(..papers.filter(p => p.kind == kind).map(paper)))
  }
  #section[FULL LIST][
    #e("p", attrs: (class: "links"))[#link(links.scholar)[Google Scholar], #link(links.orcid)[ORCID]]
  ]
]
