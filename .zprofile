#!/bin/sh
# env vars to set on login, zsh settings in ~/config/zsh/.zshrc
# add `export ZDOTDIR="$HOME/.config/zsh"` to /etc/zsh/zshenv in order to place this file at .config/zsh/.zprofile

# follow XDG base dir specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# bootstrap .zshrc to ~/.config/zsh/.zshrc, any other zsh config files can also reside here
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# 1. Add the main scripts directory
export PATH="$XDG_CONFIG_HOME/scripts:$PATH"

# 2. Loop through direct subdirectories and add them
for dir in "$XDG_CONFIG_HOME/scripts"/*/; do
    # Check if it's a valid directory (handles the case where the folder is empty)
    if [ -d "$dir" ]; then
        # Remove the trailing slash and add to PATH
        export PATH="${dir%/}:$PATH"
    fi
done


