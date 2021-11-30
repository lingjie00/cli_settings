if status is-interactive
    # Commands to run in interactive sessions can go here
end

# enable vi key-bindings
fish_vi_key_bindings

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /Users/lingjie/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

