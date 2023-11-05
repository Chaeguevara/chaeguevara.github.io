#!/bin/bash

echo "changed";
rsync  -avh --exclude={'Excalidraw','_*'} ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/MyFirstVault/  ~/Documents/2023/quartz/content/;
