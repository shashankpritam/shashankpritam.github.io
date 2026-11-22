#import "../chrome.typ": *

#let wide = rows.with(class: "wide")

#page("uses", "Uses", desc: "What Shashank Pritam uses and reads: tools, languages and books.")[
  #section[READING][
    #wide(
      ([Biology], [_A Planet of Viruses: Third Edition_, Carl Zimmer]),
      ([Programming], [_Understanding the Odin Programming Language_, Karl Zylinski #e("br") _Parallel and High Performance Computing_, Robert Robey and Yuliana Zamora]),
      ([Physics], [_Modern Particle Physics_, Mark Thomson]),
      ([Essays], [#link("https://grugbrain.dev")[The Grug Brained Developer], #link("https://asceticprogrammer.info/book")[The Ascetic Programmer]]),
    )
  ]
  #section[TOOLS][
    #wide(
      ([Editor], [#link("https://kakoune.org")[Kakoune]]),
      ([Terminal], [#link("https://www.superlogical.com/")[Rex]]),
      ([Languages], [#link("https://www.python.org")[Python], #link("https://odin-lang.org")[Odin], #link("https://www.r-project.org")[R], #link("https://www.gnu.org/software/bash/")[Bash]]),
      ([Writing], [#link("https://typst.app")[Typst]]),
      ([Font], [#link("https://tywr.github.io/Nordwand-Mono/")[Nordwand Mono]]),
      ([Command line], [#link("https://github.com/BurntSushi/ripgrep")[ripgrep], #link("https://github.com/sharkdp/fd")[fd], #link("https://github.com/junegunn/fzf")[fzf], #link("https://sqlite.org")[SQLite]]),
      ([Figures], [#link("http://www.gnuplot.info")[gnuplot]]),
    )
  ]
]
