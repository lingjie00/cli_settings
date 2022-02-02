if status is-interactive
    # Commands to run in interactive sessions can go here
end

# conda
switch (uname)
    case Darwin
        eval /Users/lingjie/miniconda3/bin/conda "shell.fish" "hook" $argv | source
        fish_add_path /Users/lingjie/Documents/scripts
        set -x JDTLS_HOME ~/.local/share/nvim/lsp_servers/jdtls
    case Linux
        eval /home/ling/miniconda3/bin/conda "shell.fish" "hook" $argv | source
end

# vim mode
fish_vi_key_bindings

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

