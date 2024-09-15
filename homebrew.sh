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
    eza zoxide fzf bat npm python git-lfs

# initiate lfs
git lfs install


############
# Mac only #
############
if [[ "$(uname)" == "Darwin" ]]; then
    # brew install koekeishiya/formulae/yabai
    # brew install yabai
    brew install skhd
    brew install --cask karabiner-elements alfred numi drawio cyberduck shortcat\
    hiddenbar kitty obsidian docker visual-studio-code zotero
    
    # MacOS needs to append fish shell before changing shell
    sudo echo $(which fish) >> /etc/shells

fi

# change shell
chsh -s $(which fish)
