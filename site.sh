#!/bin/sh
# ./site.sh          build the site into docs/
# ./site.sh serve    build, serve at http://127.0.0.1:3000 and rebuild on save
set -e
cd "$(dirname "$0")"
if [ "$1" = serve ]; then exec typst watch --features bundle,html --format bundle site.typ docs 2>&1 | grep -v hint; fi
typst compile --features bundle,html --format bundle site.typ docs 2>&1 | grep -iv "hint\|experimental" || true
