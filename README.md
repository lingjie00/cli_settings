# CLI settings

This repo stores the following CLI settings I use:

1. Neovim (text editor)
2. zsh (bash)
3. Tmux
4. Yabai (window management for MacOS)

## Neovim

I have switched from Vim to Neovim to display
errors inline and to have some Neovim specific
Plugins, including Neovim built-in LSPs.

I started switching to Vim and full terminal based
workflow from May 2021. In Nov 2021 I have managed
to switch to nearly 100% of my workflow to
Vim/Neovim. I use
(Vimium)[https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb?hl=en]
for browsing. The only time I will still need my
mouse is to navigate PDF documents.

For data science related work, I have discovered a
plugin called [Jupyter
Ascending](https://github.com/untitled-ai/jupyter_ascending.vim).
This package allows auto-sync between Jupyter
notebook and Python script which finally balances
the need to experiment with data in notebooks and
having the best practice in software development.

I have various key mapping designed for some
common tasks in specific languages.
I mainly use 1) Python 2) R 3) Latex, so most of
the mapping are based on these 3 languages.

Read more about Neovim from their (official
page)[https://neovim.io/]

## zsh

I replace Bash with Zsh for the additional
customizations Zsh provides.
I have some plugins installed for Zsh, but the
main one is simply (Oh My Zsh)[https://ohmyz.sh/]

Since most of my workflow is in Neovim and Tmux
now, the most usage for Zsh will be to prompt
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

I use a home server to perform heavy duty work.
Using Tmux allows me perform my workflow with a
single SSH and allows me to continue my work after
resuming server back from sleep.

## Yabai

Unlike Linux which has a decent window management
system. MacOS's default window management is
confusing with windows popping everywhere. I use
[yabai](https://github.com/koekeishiya/yabai) to
control my spaces.
