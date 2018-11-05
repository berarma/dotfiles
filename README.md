# berarma/dotfiles

This home directory is managed with Git. The Git control files are stored in a subdirectory.
There's an alias ```config``` as a convenience for using Git with the required options.

The idea is taken from:
 - https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
 - https://news.ycombinator.com/item?id=11070797

# Examples:

- Check home directory status: ```config status```
- Check home directory status ignoring untracked files: ```config status -uno```
- Add files: ```config add .tmuxinator```
- Commit changes: ```config commit```
- Branch out: ```config checkout -b local```

## Installation

**WARNING: This repository is for personal use only. Don't install it without
first understanding what it will do. Use at your own risk.**

Using wget:

```
bash <(wget -q -O - https://raw.githubusercontent.com/berarma/dotfiles/master/.local/bin/install_dotfiles)
```

Using curl:

```
bash <(curl -s https://raw.githubusercontent.com/berarma/dotfiles/master/.local/bin/install_dotfiles)
```

The Git files and some tools have been downloaded, but your configuration files
haven't changed yet.

Use the ```config``` command to handle your home directory as a Git working
directory. You'll want to checkout files or add yours to the repository. You
can use a branch for local changes. Be careful not to overwrite any
configuration files that are important to you.
