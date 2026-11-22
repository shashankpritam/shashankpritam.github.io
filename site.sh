#!/bin/sh
# ./site.sh           build into docs/
# ./site.sh serve     serve docs/ on http://127.0.0.1:3000 and rebuild on save
# ./site.sh publish   build, fold everything into the one commit, replace it on GitHub
#
# Nothing here deletes a file. A build is made in a temporary folder, checked,
# and copied over docs/, so a failed build leaves docs/ as it was. A file in
# docs/ that the site no longer builds is named, and removing it is yours.
set -eu
cd "$(dirname "$0")"

# Print each argument on its own line and give up.
stop() {
  printf '%s\n' "$@" >&2
  exit 1
}

# typst_site compile|watch FOLDER
typst_site() {
  typst "$1" --features bundle,html --format bundle site.typ "$2" 2>&1
}

# Typst warns that html and bundle are experimental; drop those lines and the
# blank ones around them.
quiet() {
  grep -iv 'hint\|experimental\|^$' || true
}

# only_in A B: the files under A with no file of the same path under B.
only_in() {
  (cd "$1" && find . -type f ! -name .DS_Store) | while read -r file; do
    [ -f "$2/$file" ] || echo "  ${file#./}"
  done
}

build() {
  new=$(mktemp -d "${TMPDIR:-/tmp}/site.XXXXXX")
  if ! log=$(typst_site compile "$new"); then
    stop "$log"
  fi
  printf '%s\n' "$log" | quiet

  # site.typ names every page and static file by hand; stop if one was left out.
  for source in pages/*.typ; do
    page=$(basename "$source" .typ).html
    [ -f "$new/$page" ] || stop "not built: $page (include $source in site.typ)"
  done
  unshipped=$(only_in static "$new")
  [ -z "$unshipped" ] || stop "in static/ but not named in site.typ:" "$unshipped"

  mkdir -p docs
  cp -R "$new/." docs/

  stale=$(only_in docs "$new")
  [ -z "$stale" ] || stop "in docs/ but no longer built; remove them and run again:" "$stale"
}

# The repo keeps a single commit: amend it, then replace the one on GitHub.
# The lease refuses to overwrite anything there this machine has not seen.
publish() {
  git add -A
  git commit -q --amend --no-edit
  git push --force-with-lease origin main
}

case "${1:-build}" in
  build)   build ;;
  serve)   typst_site watch docs | quiet ;;
  publish) build && publish ;;
  *)       stop "usage: ./site.sh [serve|publish]" ;;
esac
