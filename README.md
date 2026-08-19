# dotfiles

My *nix configuration files

https://en.wikipedia.org/wiki/Hidden_file_and_hidden_directory#Unix_and_Unix-like_environments

## Installing

You will need git and GNU stow

Clone the repository

```bash
git clone https://github.com/lucasgs/dotfiles.git
```

Run the installer for your platform

```bash
make mac     # macOS
make linux   # Linux
```

or Run `stow` to symlink everything or just select what you want

```bash
stow */ # Everything
```

```bash
stow nvim  # Just the nvim config
```
```bash
stow nvim tmux  # Several at once
```
