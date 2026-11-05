#import "../chrome.typ": *
#let bazykin = "https://biology.emory.edu/people/bios/faculty/bazykin-georgii.html"

#page("index")[
  #section[About][
    Hello!

    I am currently a Postdoctoral Fellow in the #link(bazykin)[Bazykin Lab] at Emory University, Atlanta, where my research focuses on epidemiology and population genetics.

    I completed my PhD in May 2026 in the Biological Sciences department at North Dakota State University (NDSU). My dissertation focused on "Transposable Element Invasion Dynamics and piRNA Cluster Evolution in _Drosophila_".

    Before starting my PhD, I did my BS-MS at IISER Pune, where I studied mostly maths and biology. My master's thesis was "Prediction of Polyproline Type II Helix Receptors". Although I see myself as a generalist computational biologist, my primary methods are modeling, simulation, and methodology development. I have interest in statistics and machine learning as well. Recently I have been working with transformers in the context of tooling as well as sequence-based evolution.
  ]
  #section[News][
    #e("ul", attrs: (class: "news"))[
      #for (d, t) in (
        ("2026", [Joined the #link(bazykin)[Bazykin Lab] at Emory as a postdoc.]),
        ("May 2026", [PhD, North Dakota State University.]),
        ("October 2025", [Preprint: #link("/publications.html")[Recent horizontal transfer of TEs in _Drosophila_].]),
        ("2025", [#link("/publications.html")[Insertion bias into piRNA clusters] published in BMC Biology.]),
      ) { e("li")[#e("span", attrs: (class: "when"))[#d]#t] }
    ]
  ]
]
