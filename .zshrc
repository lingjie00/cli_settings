# tip to add ssh without password
# ssh-keygen
# without filename and passphrase
# ssh-copy-id userid@hostname
# ssh userid@hostname
#
# system specific ZSH settings
case "$OSTYPE" in
    darwin*)
        # mac
        # conda init
        __conda_setup="$('/Users/lingjie/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
        if [ $? -eq 0 ]; then
            eval "$__conda_setup"
        else
            if [ -f "/Users/lingjie/miniconda3/etc/profile.d/conda.sh" ]; then
                . "/Users/lingjie/miniconda3/etc/profile.d/conda.sh"
            else
                export PATH="/Users/lingjie/miniconda3/bin:$PATH"
            fi
        fi
        unset __conda_setup
    ;;
    linux*)
        # ubuntu
        # conda init
        __conda_setup="$('/home/ling/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
        if [ $? -eq 0 ]; then
            eval "$__conda_setup"
        else
            if [ -f "/home/ling/miniconda3/etc/profile.d/conda.sh" ]; then
                . "/home/ling/miniconda3/etc/profile.d/conda.sh"
            else
                export PATH="/home/ling/miniconda3/bin:$PATH"
            fi
        fi
        unset __conda_setup
esac

# install ZSH if not installed
if [ -f "~/.oh-my-zsh" ]; then
    sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
# path to ZSH setting
export ZSH=~/.oh-my-zsh

# download plugins
if [ -f "$ZSH_CUSTOM/plugins/zsh-vi-mode" ]; then
    git clone https://github.com/jeffreytse/zsh-vi-mode \
  $ZSH_CUSTOM/plugins/zsh-vi-mode
fi

if [ -f "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions \
  $ZSH_CUSTOM/plugins/zsh-autosuggestions
fi

if [ -f "$ZSH_CUSTOM/plugins/zsh-z" ]; then
    git clone https://github.com/agkozak/zsh-z \
  $ZSH_CUSTOM/plugins/zsh-z
fi


[[ -z $TMUX ]] || conda deactivate; conda activate base

# theme
ZSH_THEME="robbyrussell"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# load plugins
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git 
    zsh-vi-mode
    zsh-autosuggestions
    zsh-z
)

source $ZSH/oh-my-zsh.sh


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

# add in scripts folder if using mac
if [[ "$OSTYPE" == "darwin"* ]]; then
    export PATH=$PATH:/Users/lingjie/Documents/scripts
fi
export JDTLS_HOME=~/.local/share/nvim/lsp_servers/jdtls

#export PROMPT='%(!.%{%F{yellow}%}.)$USER@%{$fg[white]%}%M ${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'
export PROMPT='%(!.%{%F{yellow}%}.)${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
