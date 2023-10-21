#!/bin/bash

echo "changed";
rsync -avh ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/MyFirstVault/[!_]*  ~/Documents/2023/quartz/content/;
