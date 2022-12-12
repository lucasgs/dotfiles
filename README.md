# dotfiles

My *nix configuration files

https://en.wikipedia.org/wiki/Hidden_file_and_hidden_directory#Unix_and_Unix-like_environments

## Installing

You will need git and GNU stow

Clone the repository

```bash
git clone https://github.com/lucasgs/dotfiles.git
```

Run installer 

```bash
./install
```

or Run `stow` to symlink everything or just select what you want

```bash
stow */ # Everything
```

```bash
stow nvim  # Just the zsh config
```
```bash
stow nvim tmux  # Several at once
```
