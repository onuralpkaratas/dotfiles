# dotfiles

My all personal dotfiles for a new machine.

## Install all brew dependencies

```sh
brew bundle
```

## Copy dotfiles to the appropriate places

```sh
make
```

## Setup vim-plug

```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## Open vim and install all plugins

```vim
:PlugInstall
```
