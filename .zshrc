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
        # install ZSH if not installed
        if [ -f "/Users/lingjie/.oh-my-zsh" ]; then
            sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        fi
        # path to ZSH setting
        export ZSH="/Users/lingjie/.oh-my-zsh"
        # check nodejs
        if [ ! -x "$(command -v node)"  ]; then
            brew install nodejs
        fi
        # Install coc
        if [ -f "/Users/lingjie/.config/coc" ]; then
            # Install coc.nvim
            # for vim8
            mkdir -p ~/.vim/pack/coc/start
            cd ~/.vim/pack/coc/start
            curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz | tar xzfv -

            # Install COC extensions
            # https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions
            mkdir -p ~/.config/coc/extensions
            cd ~/.config/coc/extensions
            if [ ! -f package.json ]
            then
                echo '{"dependencies":{}}'> package.json
            fi
            # Change extension names to the extensions you need
            npm install coc-json coc-python coc-pydocstring coc-r-lsp coc-snippets coc-vimlsp --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
            cd
        fi
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
        # install ZSH if not installed
        if [ -f "/home/ling/.oh-my-zsh" ]; then
            sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        fi
        # path to ZSH setting
        export ZSH="/home/ling/.oh-my-zsh"
        # check nodejs
        if [ ! -x "$(command -v node)" ]; then
            sudo apt-get install nodejs
        fi
        # Install coc
        if [ -f "/home/ling/.config/coc" ]; then
            # Install coc.nvim
            # for vim8
            mkdir -p ~/.vim/pack/coc/start
            cd ~/.vim/pack/coc/start
            curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz | tar xzfv -

            # Install COC extensions
            # https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions
            mkdir -p ~/.config/coc/extensions
            cd ~/.config/coc/extensions
            if [ ! -f package.json ]
            then
                echo '{"dependencies":{}}'> package.json
            fi
            # Change extension names to the extensions you need
            npm install coc-json coc-python coc-pydocstring coc-r-lsp coc-snippets coc-vimlsp --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
            cd
        fi
esac


# download vim plugin
if [ -f "$ZSH/custom/plugins/zsh-vi-mode" ]; then
    git clone https://github.com/jeffreytse/zsh-vi-mode \
  $ZSH/custom/plugins/zsh-vi-mode
fi

if [ -f "$ZSH/custom/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions \
  $ZSH/custom/plugins/zsh-autosuggestions
fi


[[ -z $TMUX ]] || conda deactivate; conda activate base

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git 
    zsh-vi-mode
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

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
export PROMPT='%(!.%{%F{yellow}%}.)$USER@%{$fg[white]%}%M ${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'