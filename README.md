# Table of Contents

<!-- vim-markdown-toc GFM -->

* [CLI settings](#cli-settings)
* [Setup](#setup)
    * [symbolic links](#symbolic-links)
    * [Python and R workflow](#python-and-r-workflow)
* [Config](#config)
    * [Neovim](#neovim)
    * [Fish shell](#fish-shell)
    * [miniconda, and fixes](#miniconda-and-fixes)
    * [Tmux](#tmux)
    * [Yabai](#yabai)
* [Saving SSH settings](#saving-ssh-settings)
    * [Add SSH host](#add-ssh-host)
    * [Add private key](#add-private-key)
* [Common commands](#common-commands)

<!-- vim-markdown-toc -->

# CLI settings

This repo stores the following CLI settings I use:

1. Neovim (text editor)
2. fish shell
3. Tmux
4. Yabai (window management for macOS)

# Setup

## symbolic links

For a new machine, all the configs done can be done by git
clone and symbolic linking the files.

```bash
# git clone
git clone https://github.com/lingjie00/cli_settings .dotfiles

# symbolic link
./install
```

## Python and R workflow

I use Neovim for script editing.
Therefore, there is no specific configurations for script 
files (.py and .R)

However, there are occasions visualizations or
experimentation are required. In these cases, a notebook
style of editing is preferred.

For Python, I use Jupyter notebook. Jupyter notebook runs a
local host at port (default) 8888, which I forward to local
machine using SSH.

For R, if you install the GUI RStudio then it is very
troublesome to forward the GUI using X11. The simple
solution would be to install
[Rstudio server](https://www.rstudio.com/products/rstudio/download-server/)
which will work similarity as Jupyter Lab.

# Config

## Neovim

I have switched from Vim to Neovim to display
errors inline and to have some Neovim specific
Plugins, including Neovim built-in LSPs.

I started switching to Vim and full terminal based
workflow from May 2021. In Nov 2021 I have managed
to switch to nearly 100% of my workflow to
Vim/Neovim. I use
[ Vimium ]( https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb?hl=en )
for browsing. The only time I will still need my
mouse is to navigate PDF documents.

For data science related work, I use [ Jupytext ]( https://github.com/mwouts/jupytext )
which sync between Jupyter
notebook and Python script, balances
the need to experiment with data in notebooks and
having the best practice in software development.

Read more about Neovim from their [ official
page ]( https://neovim.io/ )

## Fish shell

I have transit from Bash to Zsh to fish shell now.
Fish shell is much more responsive than zsh.

Since most of my workflow is in Neovim and Tmux
now, the most usage for terminal will be to prompt
files and commands.

## miniconda, and fixes

I use miniconda for my local Python environment
handling. 
Miniconda is a light-weight version of the full
conda installation.

Just beware, if you are upgrading from bash to zsh after installing conda, you might lose the settings.
Luckily, the fix is easy thanks to [this](https://stackoverflow.com/questions/40370467/anaconda-not-found-in-zsh)

```
/(your conda installation path)/bin/conda init zsh
```

## Tmux

[Tmux](https://github.com/tmux/tmux) is a
"terminal multiplexer". The biggest benefit of
Tmux is the ability to launch multiple terminals
within a single screen. I usually split my screen
into 1) Neovim 2) Script Terminal (Python, R) 3)
checking files (with `ls`) and launch another
window within Tmux to launch jupyter server.

I use a home server to perform heavy-duty work.
Using Tmux allows me to perform my workflow with a
single SSH and allows me to continue my work after
resuming server back from sleep.

## Yabai

Unlike Linux which has a decent window management
system. MacOS's default window management is
confusing with windows popping everywhere. I use
[yabai](https://github.com/koekeishiya/yabai) to
control my spaces.

# Saving SSH settings

If you use SSH frequently, then perhaps you also
face the problem of constantly needing to enter the IP
address and password for the server. There are ways to
simplify the workflow


## Add SSH host

Add in `~/.ssh/config`

```
Host example_host
    User name
    HostName 111.111.111.111
    IdentityFile ~/.ssh/host.pub
    Port 22
```

## Add private key

1. Generate SSH key in host

```
ssh-keygen
```

2. Copy key to server

Remember to copy the SSH over with e.g. `scp`

```
ssh-copy-id -i ~./ssh/host.pub user@host
```

# Common commands

There are some common commands in (n)Vim for different file types

Note:

- for bigger projects a MakeFile is recommended
- `%:p` display the file path
- `%:p:h` displays the folder path file is in

```bash
#########
# LaTex #
#########
# generate output
pdflatex -output-directory '%:p:h'  '%:p'
# clear temp files
rm '%:p:r.aux' '%:p:r.log' '%:p:r.out'

#####
# R #
#####
# R: run the current script
Rscript '%:p'
# Rmd: compile the Rmd file
Rscript -e "rmarkdown::render('%:p')"

############
# MarkDown #
############
# compile to pdf using pandoc
pandoc '%:p' -o '%:p:r.pdf'

##########
# Python #
##########
# run the current script
python3 '%:p'
# run jupyter ascending sync (a bit buggy now)
python3 -m jupyter_ascending.requests.sync --filename '%:p'

#######
# C++ #
#######
# compile
g++ '%' -o '%:r'

########
# Json #
########
# reformat json files with python json.tool
python -m json.tool

########
# Java #
########
# compile
javac %
```
