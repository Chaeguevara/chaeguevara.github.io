#!/bin/bash

echo "changed";
rm -rf ~/Documents/2023/quartz/content/*;
cp -R ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/MyFirstVault/[!_]*  ~/Documents/2023/quartz/content/;
