#!/bin/bash

# Install rice tool if not present
if ! [ -x "$(command -v rice)" ]; then
  go get github.com/GeertJohan/go.rice/rice
fi

# Clean the dist folder and build the assets
rm -rf assets/dist
npm run build
mkdir -p assets/dist/filemanager 
mv assets/dist/static assets/dist/filemanager

#cd  assets/dist/filemanager/static/js/codemirror/mode/
#mv shell sh
#mv sh/shell.js  sh/sh.js

rm -rf assets/dist/filemanager/static/js/codemirror/mode/

# Embed the assets using rice
rice embed-go
