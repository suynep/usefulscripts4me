#!/bin/bash

mkdir $1 && cd $1 && touch index.html script.js stylesheet.css &&
		echo -e "<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>
<body>
  
</body>
</html>" >> index.html
