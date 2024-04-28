#! /usr/bin/bash
if ! command -v brew &> /dev/null
then
    echo "Installing homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi


echo "Instaling homebrew packages"

brew install neovim docker docker-compose pandoc\
    ripgrep fd fish fisher gh tldr tmux tree tree-sitter w3m\
    eza zoxide fzf bat

############
# Mac only #
############
if [[ "$(uname)" == "Darwin" ]]; then
    brew install yabai skhd
    brew install --cask karabiner-elements alfred numi drawio cyberduck

fi
