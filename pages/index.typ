#import "../chrome.typ": *

// A link to a profile of mine; rel="me" lets other sites verify it is the same person.
#let me(name, url) =e("a", attrs: (rel: "me", href: url))[#name]

#page("index", "Shashank Pritam", role: [computational biologist])[
  #section[ABOUT][
    Hello! I am a #link("https://biology.emory.edu/people/research-fellows.html")[Postdoctoral Fellow] in the #link("https://biology.emory.edu/people/bios/faculty/bazykin-georgii.html")[Bazykin Lab] at Emory University, Atlanta. I work on the population genetics and genomics of mobile genetic elements, from transposons to viruses.

    My PhD, completed in May 2026 in Biological Sciences at North Dakota State University, modelled how transposable elements invade a genome and how piRNA clusters evolve in _Drosophila_. Before that I did my BS-MS at IISER Pune, where I studied mostly maths and biology.

    I see myself as a generalist. I build simulations, inference methods and sequence models for genomes that evolve, lately with transformers.
  ]
  #section[LINKS][
    #e("p", attrs: (class: "links"))[#(
      me("GitHub", "https://github.com/shashankpritam"),
      me("ORCID", links.orcid),
      me("Google Scholar", links.scholar),
      me("Bluesky", "https://bsky.app/profile/shashankpritam.bsky.social"),
      me("sifa.id", "https://sifa.id/p/shashankpritam.bsky.social"),
      link("https://cal.com/shashankpritam")[Book a chat],
    ).join(", ")]
  ]
]
