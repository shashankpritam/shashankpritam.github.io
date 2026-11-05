#import "../chrome.typ": *

#let pic(src, alt, w, h, caption) = e("figure", attrs: (class: "frame"))[
  #e("img", attrs: (src: src, alt: alt, loading: "lazy", width: str(w), height: str(h)))
  #e("figcaption")[#caption]
]

#page("pictures", title: "Pictures")[
  #section[Some random pictures][
    #e("div")[
      #pic("/pics/mrturt.jpg", "MrTurt", 1512, 2016)[MrTurt: The Wise and Ancient One]
      #pic("/pics/sneak.jpg", "Sneak", 2016, 1512)[Sneak: Sneaky]
      #pic("/pics/uni.jpg", "University", 2016, 1512)[NDSU]
    ]
  ]
]
