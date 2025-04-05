#! /bin/bash
if ! command -v brew &> /dev/null
then
    echo "Installing homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Evaluate homebrew"
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "Installing homebrew packages"

brew install neovim docker docker-compose pandoc\
    ripgrep fd fish fisher gh tldr tmux tree tree-sitter w3m\
    eza zoxide fzf bat git-lfs duckdb youplot

# initiate lfs
git lfs install


############
# Mac only #
############
if [[ "$(uname)" == "Darwin" ]]; then
    # brew install koekeishiya/formulae/yabai
    brew install koekeishiya/formulae/skhd
    brew install --cask karabiner-elements
    brew install --cask alfred
    brew install --cask numi
    brew install --cask drawio
    brew install --cask cyberduck
    brew install --cask shortcat
    brew install --cask kitty
    brew install --cask obsidian
    brew install --cask docker
    brew install --cask visual-studio-code
    brew install --cask zotero
    brew install --cask rectangle
    brew install --cask jordanbaird-ice
    brew install --cask miniforge
    brew install --cask pdf-expert
    brew install --cask microsoft-edge
    
    # MacOS needs to append fish shell before changing shell
    sudo echo $(which fish) >> /etc/shells

fi

# change shell
chsh -s $(which fish)

echo "Log out user to effective shell change."
