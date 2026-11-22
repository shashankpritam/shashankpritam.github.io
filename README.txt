shashankpritam.com

BUILD AND PUBLISH

    Needs Typst 0.15. Its HTML and bundle export are still marked
    experimental, which is why site.sh filters the warnings out.

        ./site.sh
        ./site.sh serve
        ./site.sh publish

    The first writes the site into docs/. The second also serves it at
    http://127.0.0.1:3000 and rebuilds when I save. The third builds,
    folds everything into the repo's one commit and replaces it on
    GitHub, so the history stays a single commit.

    GitHub Pages serves main:/docs as is. There is no Actions workflow,
    so nothing builds on their side. .nojekyll keeps Pages from running
    Jekyll over docs/, and static/CNAME holds shashankpritam.com.

ADDING A PAPER

    Every paper is one record in papers.toml: kind, year,
    authors, title, venue, and a doi or url. kind picks its section on
    Publications. status, code and fulltext are optional and print
    after the citation. My CVs read the same file; cv is a paper's
    place on them.

ADDING A PAGE

    Three edits:

        pages/NAME.typ   copy 404.typ or uses.typ and change it
        chrome.typ       add ("NAME", "label") to the pages list, which
                         sets the order of the nav
        site.typ         add an include for the new file

    site.typ also names every file under static/ that should ship. The
    build stops with a message if a page or a static file was left out.

HOW A PAGE IS PUT TOGETHER

    Each page calls page() from chrome.typ, which writes the head (meta
    tags, the CSP, font preloads, stylesheet), the nav and the title
    line. Inside it, section() is a capitalised heading with its body,
    and entry() is a line with a smaller one under it. Lists of dated
    or labelled things are definition lists; on a phone the left
    column moves above its entry.

FONT

    Everything is set in Nordwand Mono by Tanguy Vivier, SIL OFL 1.1;
    the licence text is static/fonts/OFL.txt. Only regular and bold
    exist here, and the browser slants the regular where a page asks
    for italic. Both are Latin subsets of release 1.6.0, about 15 kB
    each, and both are preloaded.

    The full files come from the WOFF2 zip on the font's releases page,
    github.com/tywr/Nordwand-Mono/releases. I cut a subset like this,
    and the same with Bold for the other file:

        uvx --from fonttools --with brotli pyftsubset \
          NordwandMono-Regular.woff2 \
          --unicodes="U+0020-007E,U+00A0-00FF,U+2010-2014,U+2018-201D,U+2026" \
          --layout-features='kern,liga' --flavor=woff2 \
          --output-file=static/fonts/NordwandMono-Regular.woff2

    That covers ASCII, Latin-1, the dashes, curly quotes and the
    ellipsis. Anything outside it falls back to the system monospace.

COLOUR

    The light palette is at the top of static/css/style.css, with a dark
    one next to it that applies when the device asks for dark
    (prefers-color-scheme). There is no switch.

NO JAVASCRIPT

    There is none. The CSP meta tag in chrome.typ allows nothing but
    this site's own files and sets script-src 'none', so an image, font
    or stylesheet from another host would be blocked too, and so would
    an inline style. Whatever a page needs goes under static/.
