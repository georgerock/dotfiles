# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob nomatch notify
setopt share_history
setopt hist_ignore_space
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

unsetopt autocd beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/george/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source ~/.zsh/fzf-tab/fzf-tab.plugin.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-abbr/zsh-abbr.zsh

#Aliases
alias cats='highlight -O ansi --force'
alias vim='nvim'
alias vi='nvim'
alias vimdiff='nvim -d'
alias grep="rg"

eval "$(zoxide init --cmd cd zsh)"

# nvm

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

export DENO_INSTALL="/home/george/.deno"
export POETRY_HOME="~/.poetry"
export PATH="/Users/cosmageorge/.poetry/bin:$DENO_INSTALL/bin:$PATH:$HOME/.cargo/env:$HOME/.local/bin/poetry"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# fzf
source <(fzf --zsh)

# exa
alias ls='eza'
alias ll='eza -alh'
alias tree='eza --tree'

# bat
alias cat='bat'

# cargo
export PATH="$HOME/.cargo.:$PATH"

# AWS
alias awslocal="aws --no-cli-pager --endpoint-url=http://localhost:4566"
# pnpm
export PNPM_HOME="/home/george/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# ~/.zshrc
eval "$(starship init zsh)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"

# Created by `pipx` on 2024-10-16 11:27:58
export PATH="$PATH:/Users/cosmageorge/.local/bin"
