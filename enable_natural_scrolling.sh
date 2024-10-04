#!/bin/bash

id=$(xinput list | grep -v Elantech | grep Touchpad | awk '{print $6}' | cut -d = -f2)

id1=$(xinput list-props $id | grep -v Default | grep 'Natural Scrolling' | awk '{print $5}' | cut -d '(' -f2 | cut -d ')' -f1)

xinput set-prop $id $id1 1

# echo -e "$id \n$id1"
