# CLI settings
My CLI settings.

This repo stores the following settings that I use:
1. VIM
2. zsh
3. miniconda fixes

## VIM
Vim is fun, saves me tons of time moving between keyboard and mouse.

Vim is more fun when I have some handy add ons.

```
https://github.com/junegunn/vim-plug

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## zsh
zsh is good, more fun than bash. Remember to install Oh My Zsh, makes zsh even better.

```
https://github.com/ohmyzsh/ohmyzsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

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

