#!/bin/bash


mkdir $1 && cd $1 && touch main.py

echo -e "#!/usr/bin/env python3
\n
import pygame as pg
from sys import exit

WIDTH, HEIGHT = 800, 900
\n

class Game:
    def __init__(self):
        pg.init()
        self.screen = pg.display.set_mode((WIDTH, HEIGHT))
        self.clock = pg.time.Clock()
\n

    def run(self):
        while True:
            for event in pg.event.get():
                if event.type == pg.QUIT:
                    pg.quit()
                    exit()

        
            pg.display.update()
            self.clock.tick(60)

if __name__ == \"__main__\":
    Game().run()" >> main.py
