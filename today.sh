#!/bin/bash

# SCRIPT FOR MANAGING MY AGENDAS --> THIS SCRIPT ESSENTIALLY CREATES A FILE WITH TODAY'S DATE and `.md` FORMAT

DATE=$(date '+%Y-%m-%d')
FILENAME=$DATE.md

touch $FILENAME
echo $FILENAME
