#!/bin/bash

ID=$(xinput list | grep AT | awk '{print $7}' | cut -d '=' -f 2)

xinput float $ID
