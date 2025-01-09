# evaluate homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

function git_base --description "Go to base of git repo"
    cd (git rev-parse --show-toplevel)
end


function find_files --description "Find and open files in current directory"
    fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"
end

function open_files --description "Find and open files in current directory"
    open $(fzf --preview "bat --color=always --style=numbers --line-range=:500 {}")
end

function edit_files --description "Find and edit files in current directory"
    nvim $(fzf --preview "bat --color=always --style=numbers --line-range=:500 {}")
end

alias icat="kitten icat"

alias ls="eza"

alias ll="eza -h -l --no-user --no-permissions --grid"

alias tree="eza --tree"

zoxide init fish | source

fzf --fish | source

set -x EDITOR nvim

fish_vi_key_bindings
