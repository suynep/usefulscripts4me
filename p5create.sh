#!/bin/bash

DIRECTORY="$HOME/js-files"

if [ ! -d $DIRECTORY ]; then
	mkdir $DIRECTORY
	cd $DIRECTORY
	wget https://github.com/processing/p5.js/releases/download/v1.9.0/p5.js
	echo -e "<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title> --Title-- </title>
    <link rel="stylesheet" href="style.css">
    <script src="assets/p5.js"></script>
  </head>
  <body>
	<script src="script.js"></script>
  </body>
</html>" > index.html
fi

mkdir -p $1/assets/
cp $DIRECTORY/p5.js $1/assets/ # note that $1 is a folder
cd $1 && touch script.js && cp $DIRECTORY/index.html .

workingdir=$(pwd)

# Below SHIT is done just to match the `Title` of the Html to the current Project Name
match='--Title--'
insert=$1
FILE='index.html'

sed -i "s/$match/$insert/" $FILE

ANOTHERFILE="$workingdir/script.js"

echo -e "function setup() {\n\tcreateCanvas(400, 400);\n}\n\nfunction draw() {\n\tbackground(50);\n}" > $ANOTHERFILE
