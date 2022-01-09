#!/usr/bin/env bash

# brew install --cask iterm2
# brew install --cask google-cloud-sdk
# brew install --cask sublime-text
# brew install --cask graphiql

brew update

declare -a formulae=(
    "bat" # https://github.com/sharkdp/bat
    "diff-so-fancy" # https://github.com/so-fancy/diff-so-fancy
    "graphviz"
    "jenv"
    "markdownlint-cli"
    "pyenv"
    "pyenv-virtualenv"
    )

for formula in "${formulae[@]}"; do
    check=$(brew ls --versions ${FORMULA})
    if [ -n "${check}" ]; then
        echo "Formula ${formula} is already installed: ${check}"
    else
        echo "Formula ${formula} is not installed, installing it..."
        brew install ${formula}
    fi
done

declare -a casks=(
    "iterm2"
    "google-cloud-sdk"
    "sublime-text"
    "graphiql"
)

for cask in "${casks[@]}"; do
    check=$(brew ls --versions --cask ${cask})
    if [ -n "${check}" ]; then
        echo "Cask ${cask} is already installed: ${check}"
    else
        echo "Cask ${cask} is not installed, installing it..."
        brew install ${cask}
    fi
done

# brew autoupdate start
