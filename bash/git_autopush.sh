#!/usr/bin/bash

# author    when        what
# abeb      2025-04-09  initial commit

git_autopush() {
    # takes the repository path as first parameter
    echo "$1: Running git status..."

    cd "$1"
    
    if [ $(git status --porcelain | wc -l) -eq 0 ]; then
        echo "$1: Found no changes since the last commit ("$(git log -1 --format=%s)")"
        return
    fi

    date=$(date +%Y-%m-%d\ %H:%M:%S)
    commit_msg="* Auto commit @$date"
    echo "Created commit: '$commit_msg'"

    git add . > /dev/null 2>&1 &
    # git commit -m "* Auto commit @$(date +%Y-%m-%d\ %H:%M:%S)" > /dev/null 2>&1 &
    git commit -m "$commit_msg" #> /dev/null 2>&1 &
    #git push --force > /dev/null 2>&1 &
    git push 
    
    echo "$1: Pushed commit: $commit_msg"
}

# list all repos to autopush
git_autopush ~/vent
#git_autopush /mnt/c/Users/twist/Documents/Obsidian/main/Media

# check if param was provided and autopush that repo
for arg in "$@"
do
    git_autopush "$arg"
done
