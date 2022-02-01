if status is-interactive
    # Commands to run in interactive sessions can go here
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
switch (uname)
    case Darwin
        eval /Users/lingjie/miniconda3/bin/conda "shell.fish" "hook" $argv | source
    case Linux
        eval /home/ling/miniconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<
