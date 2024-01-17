#!/bin/bash

DIRECTORY="$HOME/js-files"

if [ ! -d $DIRECTORY ]; then
	mkdir $DIRECTORY
	cd $DIRECTORY
	wget https://github.com/processing/p5.js/releases/download/v1.9.0/p5.js
fi

mkdir -p $1/assets/
cp $DIRECTORY/p5.js $1/assets/ # note that $1 is a folder
cd $1 && touch index.html script.js

