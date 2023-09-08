#!/bin/bash


read -p "Steps: " step

for i in $(seq 1 "$step");
do
	xdotool key XF86MonBrightnessDown
done
