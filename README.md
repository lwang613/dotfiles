# 💻 My Dotfiles

My personal dotfiles and configuration files for macOS, including custom setups for Zsh, Tmux, and Git.

## 🛠️ What's Included

- **Zsh (`.zshrc`):** Custom aliases for Git, Tmux, Conda, and bioinformatics (`tsv` viewing), plus a custom colored terminal prompt.
- **Tmux (`.tmux.conf`):** Custom keybindings (`Ctrl+a` prefix), vertical/horizontal split shortcuts, mouse support, silenced bells, and a custom status bar.
- **Git (`.gitconfig`):** Standard git configurations.

## 🚀 Installation

To set up this environment on a new machine, simply clone the repository and run the automated installation script. This will safely symlink all configuration files to your home directory.

```bash
git clone [https://github.com/YOUR-USERNAME/dotfiles.git](https://github.com/YOUR-USERNAME/dotfiles.git) ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh
