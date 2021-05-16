# CLI settings
My CLI settings.

This repo stores the following settings that I use:
1. VIM
2. zsh
3. miniconda fixes

The setting file will also install package and plugin that are missing.

## VIM
Vim is fun, saves me tons of time moving between keyboard and mouse.

## zsh
zsh is good, more fun than bash. Remember to install Oh My Zsh, makes zsh even better.

[oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)

Another must have is tmux, makes my SSH life so much smoother

```
https://github.com/tmux/tmux
```

## miniconda, and fixes

Just beware, if you are upgrading from bash to zsh after installing conda, you might lose the settings.
Luckily, the fix is easy thanks to [this](https://stackoverflow.com/questions/40370467/anaconda-not-found-in-zsh)

```
/(your conda installation path)/bin/conda init zsh
```

