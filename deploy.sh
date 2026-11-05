#!/bin/sh
# Build the site here and push public/ to the gh-pages branch, which GitHub Pages serves as is.
# ./deploy.sh          build and publish
# ./deploy.sh serve    build and preview at http://localhost:8000
set -e
cd "$(dirname "$0")"
emacs --batch --load publish.el >/dev/null 2>&1
touch public/.nojekyll
if [ "$1" = serve ]; then exec python3 -m http.server 8000 -d public; fi
src=$(git rev-parse --short HEAD)
tmp=$(mktemp -d)
git worktree add -q --detach "$tmp"
(
  cd "$tmp"
  git checkout -q --orphan gh-pages-new
  git rm -rqf . >/dev/null 2>&1 || true
  cp -R "$OLDPWD/public/." .
  git add -A
  git commit -qm "site from $src"
  git push -qf origin HEAD:gh-pages 2>/dev/null
)
git worktree remove --force "$tmp"
git branch -qD gh-pages-new 2>/dev/null || true
echo "published $src to gh-pages"
