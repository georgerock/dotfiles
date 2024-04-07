#!/bin/bash

if [ "$(uname)" == "Linux" ]; then

    if [ "$(which zsh)" ]; then
        echo "Zsh already installed, skipping..."
    else
        echo "Installing Zsh..."; \
        sudo dnf install zsh -y; \
        sudo chsh -s $(which zsh)
    fi

    # Packages
    sudo dnf install -y zoxide bat eza fzf ripgrep neovim tmux highlight zsh stow btop gh

    # Zsh plugins and theme
    git clone https://github.com/olets/zsh-abbr ~/.zsh/zsh-abbr
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

    # Starship
    curl -sS https://starship.rs/install.sh | sh

    # tmux
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

    # Node version manager
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

    # Deno
    curl -fsSL https://deno.land/install.sh | sh

    # Rust
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

    stow .

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

    # Packages
    brew install zoxide bat eza fzf ripgrep neovim tmux highlight stow btop gh

    # Nerd Font
    brew tap shaunsingh/SFMono-Nerd-Font-Ligaturized
    brew install --cask font-sf-mono-nerd-font-ligaturized
    
    # Zsh plugins and theme
    git clone https://github.com/olets/zsh-abbr ~/.zsh/zsh-abbr
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

    # Starship
    curl -sS https://starship.rs/install.sh | sh

    # Node version manager
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

    # Deno
    curl -fsSL https://deno.land/install.sh | sh

    # Rust
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

    # tmux
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

    stow .
fi
