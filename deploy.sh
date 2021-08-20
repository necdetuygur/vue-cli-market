#!/usr/bin/env sh

set -e

npm run build

cd dist

git init
git add -A
git commit -m 'New Deployment'
git push -f git@github.com:necdetuygur/vue-cli-market.git master:gh-pages

cd -