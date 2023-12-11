#!/bin/bash


# This script `removes` the laptop's built-in keybd (helps me use moi MaxFit61 ez)

ID=$(xinput list | grep AT | awk '{print $7}' | cut -d '=' -f 2)

xinput float $ID
