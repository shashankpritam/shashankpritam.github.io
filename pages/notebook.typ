#import "../chrome.typ": *

#let parts = (("about", "About this site"), ("books", "Books"), ("bookmarks", "Bookmarks"), ("software", "Software I like"))
#let sec(i, body) = section(parts.at(i).at(1), id: parts.at(i).at(0), body)

#page("notebook", title: "Notebook", toc: parts)[
  #sec(0)[
    I use this webpage as a public notebook and bookmarks.

    If you have any questions, or just want to chat about science, tech, or anything else, please feel free to schedule a meeting with me #link("https://cal.com/shashankpritam")[here].
  ]
  #sec(1)[
    Below is a curated list of books and resources I'm currently enjoying (not updated frequently, but I do try to keep it relevant).

    / Biology & Evolution: _A Planet of Viruses: Third Edition_, Carl Zimmer
    / Programming: _Understanding the Odin Programming Language_, Karl Zylinski \
      _Parallel and High Performance Computing_, Robert Robey and Yuliana Zamora
    / Physics: _Modern Particle Physics_, Mark Thomson
  ]
  #sec(2)[
    / Biology & Genetics: #link("https://plato.stanford.edu/entries/population-genetics/")[Quick Pop Gen]
    / Mathematics: #link("https://www.probabilitycourse.com/")[Probability Course]
    / Programming: #link("https://www.asceticprogrammer.info/book")[The Ascetic Programmer], #link("https://grugbrain.dev")[The Grug Brained Developer]
    / Bioinformatics: #link("https://www.biostars.org")[Biostars], #link("https://www.seqanswers.com")[SeqAnswers], #link("https://bioinformatics.stackexchange.com")[Bioinformatics Stack Exchange]
  ]
  #sec(3)[
    / Languages: #link("https://www.python.org")[Python], #link("https://odin-lang.org")[Odin], #link("https://www.r-project.org")[R], #link("https://www.gnu.org/software/bash/")[Bash]
    / Editors: #link("https://helix-editor.com")[Helix], #link("https://code.visualstudio.com")[VS Code]
    / Terminals: #link("https://ghostty.org")[Ghostty], #link("https://help.gnome.org/users/gnome-terminal/")[GNOME Terminal], #link("https://www.termius.com")[Termius]
    / Version control: #link("https://git-scm.com")[Git] via #link("https://github.com")[GitHub], #link("https://tangled.org")[Tangled]
    / Command line: #link("https://github.com/BurntSushi/ripgrep")[ripgrep], #link("https://github.com/sharkdp/bat")[bat], #link("https://github.com/junegunn/fzf")[fzf], #link("https://yazi-rs.github.io")[yazi], #link("https://zellij.dev")[zellij], #link("https://github.com/sharkdp/fd")[fd], #link("https://ffmpeg.org")[ffmpeg], #link("https://github.com/yt-dlp/yt-dlp")[yt-dlp], #link("https://joeyh.name/code/moreutils/")[sponge], #link("https://lynx.browser.org")[lynx], #link("https://github.com/charmbracelet/glow")[glow], #link("https://github.com/dalance/pretzo")[pretzo], #link("https://sqlite.org")[SQLite]
    / Writing: #link("https://typst.app")[Typst], #link("https://orgmode.org")[Org-mode], #link("https://asciidoc.org")[AsciiDoc], #link("https://www.latex-project.org")[LaTeX]
    / Diagrams: #link("https://d2lang.com")[D2]
    / References: #link("https://www.zotero.org")[Zotero], #link("https://zbib.org")[zbib.org], #link("https://calibre-ebook.com")[Calibre]
    / Web: #link("https://kagi.com")[Kagi], #link("https://justgetflux.com")[f.lux]
  ]
]
