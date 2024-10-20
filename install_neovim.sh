#!/bin/bash
# require: curl, jq, tar

# Installing neovim and its dependencies
NEOVIM_TARBALL=https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz

RG_VERSION=$(curl -sL https://api.github.com/repos/BurntSushi/ripgrep/releases/latest | jq -r ".tag_name")
RG_FOLDERNAME=ripgrep-$RG_VERSION"-x86_64-unknown-linux-musl"
RG_TARBALL=https://github.com/BurntSushi/ripgrep/releases/download/$RG_VERSION/$RG_FOLDERNAME".tar.gz"

echo $NEOVIM_TARBALL
curl -o /tmp/nvim-linux64.tar.gz -L $NEOVIM_TARBALL
tar xzvf /tmp/nvim-linux64.tar.gz -C $HOME
ln -s $HOME/nvim-linux64/bin/nvim /usr/local/bin

echo $RG_TARBALL
curl -o /tmp/rg-linux64.tar.gz -L $RG_TARBALL
tar xzvf /tmp/rg-linux64.tar.gz -C $HOME
ln -s $HOME/"$RG_FOLDERNAME"/rg /usr/local/bin
