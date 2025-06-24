# Vim

## Installation
See more:
- [VIM как IDE для разработки на Python](https://habr.com/ru/articles/224979/)
- [Vim, как Ide для python](https://habr.com/ru/sandbox/68836/)
- [VIM: зачем, если есть IDE, и как?](https://habr.com/ru/articles/303554/)
- [Настраиваем Vim для работы с Python кодом](https://habr.com/ru/articles/196550/)

To install vim-nox (a version of Vim with python support):
```bash
sudo apt update
sudo apt install vim-nox -y
```

## Plugins

Modern vim includes native plugin manager (you don't need to install `Vundle` or ).  
To autoload on a start, reaplace your plugins to folder: `/home/user/.vim/pack/vimplugs/start`

### Vsal stle ad color schemes: vim-airline, vim-airline-themes

[vim-airline]([https://habr.com/ru/articles/196550/](https://github.com/vim-airline/vim-airline))


### NEDRTree

File manager and navigation panel.

### Python-mode plugin

To use vim as IDE for Python install `rope` module:
```bash
apt install python3-rope
```
### TagBar

Installation `ctags` required:
```bash
apt install exuberant-ctags
```

## Configure

With a customized `/home/user/.vimrc` file you can increase your Vim powers tenfold.
See [my configuration](.vimrc).  vim-colorschemes
