#!/usr/bin/env python3

import random
import requests
import os
from termcolor import colored

FILE_PATH = os.path.join(os.path.expanduser('~'), ".kanye-beast.txt")

if not os.path.isfile(FILE_PATH):
    API_EP = "https://api.kanye.rest/"
    with open(FILE_PATH, "w+") as f:
        for i in range(100):
            req = requests.get(API_EP).json()
            f.write(req["quote"] + "\n")

with open(FILE_PATH, "r") as f:
    global quotes
    quotes = f.readlines()

colors = ["black", "red", "green", "yellow", "blue", "magenta", "cyan", "white",
        "light_grey", "dark_grey", "light_red", "light_green", "light_yellow", "light_blue",
        "light_magenta", "light_cyan"]
    
names = ["Kanye Omari West", "Ye","Yeezus","Saint Pablo","Yeezy","Louis Vuitton Don"]

choice = random.choice(quotes)
length = len(choice) + 2

print("*" * length)
print(colored(choice, random.choice(colors)) + f"-- {random.choice(names)}")
print("*" * length)

