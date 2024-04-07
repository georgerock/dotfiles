#!/bin/bash

if [ "$(uname)" == "Linux" ]; then

    if [ "$(which zsh)" ]; then
        echo "Zsh already installed, skipping..."
    else
        echo "Installing Zsh..."; \
        sudo dnf install zsh -y; \
        sudo chsh -s $(which zsh)
    fi

    sudo dnf install -y git zoxide bat eza fzf ripgrep neovim tmux highlight zsh-syntax-highlighting zsh-autosuggestions 

elif [ "$(uname)" == "Darwin" ]; then
    if [ "$(which brew)" ]; then
        echo "Brew already installed, skipping..."
    else
        echo "Installing Brew..."; \
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    if [ "$(which zsh)" ]; then
        echo "Zsh already installed, skipping..."
    else
        echo "Installing Zsh..."; \
        brew install zsh; \
        sudo chsh -s $(which zsh)
    fi

    brew install git zoxide bat eza fzf ripgrep neovim tmux highlight zsh-syntax-highlighting zsh-autosuggestions
fi
