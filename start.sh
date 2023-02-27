#! /bin/bash
if [ $# -eq 0 ]; then
    >&2 echo "No arguments provided"
    exit 1
fi

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
    sed 's/"scripts": {/"scripts": {\n    "build": "webpack"/' package.json
    npm init -y
    npm install webpack webpack-cli sass --save-dev
    npm install normalize.css
    sass src/index.scss dist/style.css
fi

