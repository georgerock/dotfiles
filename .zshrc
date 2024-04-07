# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob nomatch notify
unsetopt autocd beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/george/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-abbr/zsh-abbr.zsh

#Aliases
alias cats='highlight -O ansi --force'
alias vim='nvim'
alias vi='nvim'
alias vimdiff='nvim -d'

eval "$(zoxide init --cmd cd zsh)"

# nvm

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

export DENO_INSTALL="/home/george/.deno"
export PATH="$DENO_INSTALL/bin:$PATH:$HOME/.cargo/env"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

eval "$(pyenv virtualenv-init -)"

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

# ~/.zshrc

eval "$(starship init zsh)"
