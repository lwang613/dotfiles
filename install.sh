#!/usr/bin/env bash

DOTFILES_DIR="$HOME/dotfiles"

# Array of dotfiles to link
files=(".zshrc" ".tmux.conf" ".gitconfig")

echo "Setting up dotfiles symlinks..."

for file in "${files[@]}"; do
    if [ -f "$DOTFILES_DIR/$file" ]; then
        # Force symlink creation (-sf overwrites existing files/links)
        ln -sf "$DOTFILES_DIR/$file" "$HOME/$file"
        echo "Linked: $file -> $HOME/$file"
    else
        echo "Warning: $file not found in $DOTFILES_DIR"
    fi
done

echo "Installation complete!"
