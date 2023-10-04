#!/bin/bash

echo "changed";
rm -rf ~/Documents/2023/quartz/content/*;
rsync -avh ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/MyFirstVault/[!_]*  ~/Documents/2023/quartz/content/;
