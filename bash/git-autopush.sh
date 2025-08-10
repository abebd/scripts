#!/usr/bin/bash

# author    when        what
# abeb      2025-04-09  initial commit

git-autopush() {
    # takes the repository path as first parameter
    echo "Checking repo at: $1"

    cd $1
    
    if [ $(git status --porcelain | wc -l) -eq 0 ]; then
        return
    fi

    date=$(date +%Y-%m-%d\ %H:%M:%S)

    echo "Created commit: $date"

    git add . > /dev/null 2>&1 &
    # git commit -m "* Auto commit @$(date +%Y-%m-%d\ %H:%M:%S)" > /dev/null 2>&1 &
    git commit -m "* Auto commit @$date" #> /dev/null 2>&1 &
    #git push --force > /dev/null 2>&1 &
    git push 
}

# list all repos to autopush
git-autopush ~/vent

#git-autopush /mnt/c/Users/twist/Documents/Obsidian/main/Media

