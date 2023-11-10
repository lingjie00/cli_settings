#! /usr/bin/bash
MAC=$1

echo "Instaling homebrew packages"

brew install neovim docker docker-compose pandoc miniconda\
    ripgrep fd fish fisher gh tldr tmux tree tree-sitter w3m

brew install --cask drawio cyberduck

############
# Mac only #
############
if [[ $MAC =~ ^[Yy].* ]]; then
    brew install yabai skhd
    brew install --cask karabiner-elements alfred numi
fi
