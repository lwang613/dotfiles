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

# Link global Claude instructions (~/.claude/CLAUDE.md)
if [ -f "$DOTFILES_DIR/agent-config/CLAUDE.md" ]; then
    ln -sfn "$DOTFILES_DIR/agent-config/CLAUDE.md" "$HOME/.claude/CLAUDE.md"
    echo "Linked: CLAUDE.md -> $HOME/.claude/CLAUDE.md"
else
    echo "Warning: agent-config/CLAUDE.md not found"
fi

# Link global Copilot instructions (~/.copilot/copilot-instructions.md)
if [ -f "$DOTFILES_DIR/agent-config/copilot-instructions.md" ]; then
    ln -sfn "$DOTFILES_DIR/agent-config/copilot-instructions.md" "$HOME/.copilot/copilot-instructions.md"
    echo "Linked: copilot-instructions.md -> $HOME/.copilot/copilot-instructions.md"
else
    echo "Warning: agent-config/copilot-instructions.md not found"
fi

# Link global Codex instructions (~/.codex/AGENTS.md)
if [ -f "$DOTFILES_DIR/agent-config/AGENTS.md" ]; then
    ln -sfn "$DOTFILES_DIR/agent-config/AGENTS.md" "$HOME/.codex/AGENTS.md"
    echo "Linked: AGENTS.md -> $HOME/.codex/AGENTS.md"
fi

echo "Installation complete!"
