# Dotfiles

The dotfiles are managed in their own directories and symbolic links are created
by [GNU stow](https://www.gnu.org/software/stow/).

## Installation

```bash
## on debian
apt-get install stow git
```

## Install dotfiles

```bash
git clone git@github.com:sgibb/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow --target ~ stow ## setup stow
stow bash tmux vim
```

Or use:

```bash
git clone git@github.com:sgibb/dotfiles.git ~/dotfiles
cd ~/dotfiles
./bootstrap.sh
```

## Uninstall dotfiles

```bash
cd ~/dotfiles
stow -D bash tmux vim # ...
```
