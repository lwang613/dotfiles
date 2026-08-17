# ------------------------------
# Prompt
# ------------------------------
PROMPT='%n:%~ %# '

# ------------------------------
# Node Version Manager (nvm)
# ------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"

# ------------------------------
# pyenv (Python version manager)
# ------------------------------
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi
export PATH="$HOME/.local/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/lucaswang/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/lucaswang/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/lucaswang/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/lucaswang/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba shell init' !!
export MAMBA_EXE='/Users/lucaswang/miniforge3/bin/mamba';
export MAMBA_ROOT_PREFIX='/Users/lucaswang/miniforge3';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias mamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<

# FZF (Fuzzy Finder): Loads zsh keybindings (Ctrl+T, Ctrl+R, Alt+C) and auto-completion.
# Process substitution <(...) executes 'fzf --zsh' dynamically without temporary files.
source <(fzf --zsh)

# GitHub Copilot CLI: Evaluates shell integration code to enable 'gh copilot' aliases
# (e.g., 'ghcs' for shell command suggestions, 'ghce' for git explanation).
alias copilot="gh copilot"

# Git
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gd="git diff"
alias gl="git log --oneline --graph --all"

# Conda
alias ca="conda activate"
alias cdna="conda deactivate"

# Bioinformatics / Data
alias tsv="column -t -s $'\t'"

# Tmux
alias ta="tmux attach -t"
alias tls="tmux ls"
alias tn="tmux new -s"
PROMPT="%F{green}%n@%m%f:%F{cyan}%~%f$ "
