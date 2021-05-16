# CLI settings
My CLI settings. Works with mac and Linux

Using the following tools:
1. zsh
2. tmux
3. vim

## VIM
Vim is fun, saves me tons of time moving between keyboard and mouse.

Vim is more fun when I have some handy add ons.

[vim-plug](https://github.com/junegunn/vim-plug)
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## zsh
zsh is good, more fun than bash. Remember to install Oh My Zsh, makes zsh even better.

[oh-my-zsh](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)
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
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

# Plugin

zsh-vi-mode

```
git clone https://github.com/jeffreytse/zsh-vi-mode \
  $ZSH/custom/plugins/zsh-vi-mode
```

zsh-autosuggestions

```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
