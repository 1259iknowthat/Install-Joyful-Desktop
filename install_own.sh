#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
printf ${RED}"Just run this if you want to use my own dotfiles\nContinue?\n"${NC}
read a
sudo apt install fonts-symbola
rsync -avxHAXP --exclude-from=- own/. ~/ << "EXCLUDE"
own
EXCLUDE
