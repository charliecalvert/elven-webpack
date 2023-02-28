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
    mkdir $NAME/src
    mkdir $NAME/dist
    ./copy-core.sh $NAME
    cd $NAME
    
    cp ../assets/webpack-two-mods.config.js ./webpack.config.js
    
    npm init -y
    npm install webpack webpack-dev-server html-webpack-plugin webpack-cli sass --save-dev
    npm install normalize.css
    sass src/index.scss dist/style.css
    sed -i 's/"scripts": {/"scripts": {\n    "build": "webpack",/' package.json
    sed -i 's/"scripts": {/"scripts": {\n    "start": "webpack-dev-server --open",/' package.json
fi
