# dotfiles

My Debian GNU/Linux dot files.

## Installation

The home directory is a Git work directory. First clone the repository:

```
git clone --bare https://github.com/berarma/dotfiles .myconf
```

Setup the alias for handling the configurations:

```
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
```

Use the ```config``` command to handle your home directory as a Git work directory.
Be careful not to overwrite any configuration files that are important to you.

Install vim-plug:

```
wget -O .config/nvim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
