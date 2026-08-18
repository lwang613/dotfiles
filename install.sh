#!/usr/bin/env bash

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Array of dotfiles to link
files=(".zshrc" ".tmux.conf" ".gitconfig" ".gitignore_global")

echo "Setting up dotfiles symlinks..."

for file in "${files[@]}"; do
    if [ -f "$DOTFILES_DIR/$file" ]; then
        ln -sf "$DOTFILES_DIR/$file" "$HOME/$file"
        echo "Linked: $file -> $HOME/$file"
    else
        echo "Warning: $file not found in $DOTFILES_DIR"
    fi
done

echo "Installation complete!"
