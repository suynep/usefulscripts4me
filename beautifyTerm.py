#!/usr/bin/env python3

from bs4 import BeautifulSoup
import requests
import os

r = requests.get("https://textfaces.com/s/animal")
data = r.text

soup = BeautifulSoup(data)

requiredData = []


for link in soup.find_all('pre'):
    try:
        randomContainerForError = (link['data-t'])
        requiredData.append([randomContainerForError, link.string])
    except:
        continue


if not os.path.isfile(os.path.expanduser('~') + '/.emoticons.txt'):
    with open(os.path.expanduser('~') + '/.emoticons.txt', 'w') as fp:
        for group in requiredData:
            fp.write(group[0] + '; ' + group[1] + '\n')
