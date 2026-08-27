#!/usr/bin/env bash

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Array of dotfiles to link
files=(".zshrc" ".tmux.conf" ".gitconfig" ".gitignore_global" ".vimrc")

echo "Setting up dotfiles symlinks..."

for file in "${files[@]}"; do
    if [ -f "$DOTFILES_DIR/$file" ]; then
        ln -sf "$DOTFILES_DIR/$file" "$HOME/$file"
        echo "Linked: $file -> $HOME/$file"
    else
        echo "Warning: $file not found in $DOTFILES_DIR"
    fi
done

# Ensure target directories exist
mkdir -p "$HOME/.copilot"
mkdir -p "$HOME/MD_PhD/phd_notes"

# Link global Copilot instructions
if [ -f "$DOTFILES_DIR/agent-config/copilot-instructions.md" ]; then
    ln -sfn "$DOTFILES_DIR/agent-config/copilot-instructions.md" "$HOME/.copilot/copilot-instructions.md"
    echo "Linked: copilot-instructions.md -> $HOME/.copilot/copilot-instructions.md"
else
    echo "Warning: agent-config/copilot-instructions.md not found"
fi

# Link project-specific CLAUDE.md
if [ -f "$DOTFILES_DIR/agent-config/CLAUDE.md" ]; then
    ln -sfn "$DOTFILES_DIR/agent-config/CLAUDE.md" "$HOME/MD_PhD/phd_notes/CLAUDE.md"
    echo "Linked: CLAUDE.md -> $HOME/MD_PhD/phd_notes/CLAUDE.md"
else
    echo "Warning: agent-config/CLAUDE.md not found"
fi

echo "Installation complete!"
