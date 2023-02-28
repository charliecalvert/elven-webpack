#! /bin/bash
if [ $# -eq 0 ]; then
    >&2 echo "No arguments provided"
    exit 1
fi

# Uncomment the next lines to set the default license
# npm config set init-license "MIT"

NAME=$1
if [ -d "$NAME" ]; then
    echo "Directory $NAME exists." 
else
    echo "Directory $NAME does not exist."
    mkdir $NAME
    cd $NAME
    mkdir src
    mkdir dist
    cp ../assets/index.html ./index.html
    cp ../assets/index.js ./src/index.js
    cp ../assets/style.css ./src/style.css
    cp ../assets/index.scss ./src/index.scss
    cp ../assets/core.scss ./src/core.scss
    cp ../assets/webpack.config.js ./webpack.config.js
    cp ../assets/.gitignore ./.gitignore
    npm init -y
    npm install webpack webpack-dev-server html-webpack-plugin webpack-cli sass --save-dev
    npm install normalize.css
    sass src/index.scss dist/style.css
    sed -i 's/"scripts": {/"scripts": {\n    "build": "webpack",/' package.json
    sed -i 's/"scripts": {/"scripts": {\n    "start": "webpack-dev-server --open",/' package.json
fi

