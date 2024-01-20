#!/bin/bash

LINE_NUMBER=$(cat $HOME/.emoticons.txt | wc -l)


CHOSENLINES=()

for i in $(seq 1 5); do
	RANDOM_LINE=$((1 + $RANDOM % $LINE_NUMBER))
	CHOSENLINES+=$(sed -n "${RANDOM_LINE}p" $HOME/emoticons.txt | cut -d ';' -f 2)
done

echo $CHOSENLINES | lolcat
