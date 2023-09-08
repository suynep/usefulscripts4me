#!/bin/bash

file=$(echo $1 | cut -d '.' -f 1)


c99 -Wall -o $file $1 -lm
