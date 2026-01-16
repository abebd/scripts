#!/usr/bin/env bash
WALL_DIR="$HOME/Pictures/Wallpapers"

# This uses chafa for a high-quality preview in the fzf window
selected=$(ls "$WALL_DIR" | fzf \
    --preview "chafa --size 60x60 '$WALL_DIR/{}'" \
    --preview-window=right:60%:wrap)

if [ -n "$selected" ]; then
    feh --bg-fill "$WALL_DIR/$selected"
fi
