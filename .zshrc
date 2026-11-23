# --- ENVIROMENT & PATHS ---
# Načtení Homebrew do systému
eval "$(/opt/homebrew/bin/brew shellenv)"

# --- STARSHIP PROMPT ---
# Spuštění vzhledu příkazové řádky
eval "$(starship init zsh)"

# --- PLUGINS ---
# Automatické doplňování textu a barvení syntaxe z Homebrew
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# --- ALIASES ---
# Lepší a hezčí náhrady za staré příkazy
alias ls='lsd'
alias ll='lsd -l'
alias la='lsd -a'
alias lla='lsd -la'
alias cat='bat'
alias update='brew update && brew cleanup'
alias pc="ssh rejmi@10.0.0.145"
alias aider="aider --model ollama/qwen2.5-coder:7b --openai-api-base http://10.0.0.145:11434/v1"
# --- MODERNÍ NÁSTROJE ---
eval "$(zoxide init zsh --cmd cd)"   # cd se učí, kam chodíš: `cd proj` skočí rovnou
source <(fzf --zsh)                  # Ctrl+T soubory, Alt+C složky (Ctrl+R řeší Warp)
export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border=rounded --color=bg+:#2a2440,fg+:#e4e1f5,hl:#c792ff,hl+:#ff79c6,pointer:#ff79c6,prompt:#7aa8ff,border:#5c5778"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=numbers --line-range :200 {}'"
export BAT_THEME="Dracula"
export EDITOR="nvim"

# --- HISTORIE ---
HISTSIZE=50000 SAVEHIST=50000
setopt HIST_IGNORE_ALL_DUPS HIST_IGNORE_SPACE SHARE_HISTORY

# --- DALŠÍ ALIASY ---
alias lt='lsd --tree --depth 2'
alias ..='cd ..'
alias ...='cd ../..'
alias g='git'
alias gs='git status -sb'
alias gl='git log --oneline --graph --decorate -20'
alias gd='git diff'
alias v='nvim'
alias help='tldr'
mkcd() { mkdir -p "$1" && cd "$1"; }

# Ukáže systémové info a logo Applu při každém otevření
fastfetch

# Added by Antigravity IDE
export PATH="$HOME/.antigravity-ide/antigravity-ide/bin:$PATH"

# opencode
export PATH=$HOME/.opencode/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Unity CLI
. "$HOME/.unity/env"
