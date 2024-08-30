#!/usr/bin/env bash


QUOTE=$(curl --request GET -s https://api.kanye.rest/ | jq .quote) 
WC=$(echo $QUOTE | wc -m)
WC=$(( WC / 8 ))
echo $QUOTE | lolcat
echo "--yeetzy"
