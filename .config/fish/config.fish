if status is-interactive
    # Commands to run in interactive sessions can go here
end

# conda
switch (uname)
    case Darwin
        eval /Users/lingjie/miniconda3/bin/conda "shell.fish" "hook" $argv | source
    case Linux
        eval /home/ling/miniconda3/bin/conda "shell.fish" "hook" $argv | source
end

# vim mode
fish_vi_key_bindings
