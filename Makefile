.PHONY: all mac linux clean stow-%

STOW := stow
TARGET := $(HOME)

# Shared packages (installed on every platform)
SHARED := herdr emacs yazi ghostty wezterm alacritty kitty nvim tmux zsh starship bin all

# macOS-only packages
MAC_ONLY := aerospace

# Linux-only packages
LINUX_ONLY := x i3

mac: $(addprefix stow-,$(SHARED) $(MAC_ONLY))

linux: $(addprefix stow-,$(SHARED) $(LINUX_ONLY))

# clean: unstow every package (shared + mac + linux) from $HOME
clean: $(addprefix unstow-,$(SHARED) $(MAC_ONLY) $(LINUX_ONLY))

# unstow-<package>: remove a package's symlinks from $HOME
unstow-%:
	$(STOW) -D --target $(TARGET) $*

# stow-<package>: restow a single package into $HOME
stow-%:
	$(STOW) -D $*
	$(STOW) --target $(TARGET) $*
