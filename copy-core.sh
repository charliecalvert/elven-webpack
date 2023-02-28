#! /bin/bash

if [ $# -eq 0 ]; then
    >&2 echo "No arguments provided"
    exit 1
fi

echo "Copying core files"   
ASSETS=./assets/
cp ${ASSETS}index.html ${1}/index.html
cp ${ASSETS}.gitignore ${1}/.gitignore

cp ${ASSETS}index.js ${1}/src/index.js
cp ${ASSETS}second.js ${1}/src/second.js
cp ${ASSETS}style.css ${1}/src/style.css
cp ${ASSETS}index.scss ${1}/src/index.scss
cp ${ASSETS}core.scss ${1}/src/core.scss
