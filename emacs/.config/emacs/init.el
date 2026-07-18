;; (org-babel-load-file
;;  (expand-file-name
;;   "config.org"
;;   user-emacs-directory))

; (add-to-list 'load-path '"~/.config/emacs/modules")

(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file t)

(setq backup-directory-alist '((".*" . "~/.config/emacs/backups/")))

(scroll-bar-mode -1)             ; Disable ugly scrollbars
(tool-bar-mode -1)               ; Disable the graphical toolbar
(tooltip-mode -1)                ; Disable tooltips
(set-fringe-mode 10)             ; Give some breathing room on the sides
(menu-bar-mode -1)               ; Disable the menu bar

(global-display-line-numbers-mode t) ; Show line numbers
(column-number-mode t)                ; Show column number in the modeline

;; Disable line numbers for specific modes where they don't make sense
(dolist (mode '(org-mode-hook
                term-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(setq inhibit-startup-message t) ; Lose the default welcome screen
(setq initial-scratch-message nil)
(setq visible-bell nil)
(setq mouse-drag-copy-region t)
(setq bookmark-save-flag 1)

;; Map macOS keys properly
; (setq mac-command-modifier 'meta)       ; Cmd acts as Meta (Alt)
; (setq mac-option-modifier 'none)        ; Opt stays normal for typing symbols like Option+7
; (setq ordinary-keyboard-patch t)

;; Smooth scrolling overrides (stops Emacs from jumping half a page)
(setq scroll-conservatively 101)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)

;; Make "yes or no" prompts just "y or n"
(fset 'yes-or-no-p 'y-or-n-p)

(set-face-attribute 'default nil :family "Hack Nerd Font" :height 140)
;(set-face-attribute 'default nil :family "JetBrains Mono" :height 140)

;; Packages
;; Initialize package repositories
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Initialize use-package (built into Emacs 29+)
;; This ensures packages are automatically installed if they aren't on your system
(require 'use-package)
(setq use-package-always-ensure t)

;(load-theme 'modus-operandi)
;(load-theme 'modus-vivendi)
;(load-theme 'modus-vivendi-tinted)

(use-package kanagawa-themes
  :config
  (load-theme 'kanagawa-wave t))

;; Evil mode
(use-package evil
  :config
  (evil-mode 1))

;; Which-Key: Pops up a panel showing available keybindings when you stall mid-shortcut
(use-package which-key
  :init (which-key-mode)
  :diminish
  :config
  (setq which-key-idle-delay 0.3))

(use-package vertico
  :config
  (vertico-mode 1))

(use-package marginalia
  :config
  (marginalia-mode 1))

(use-package savehist
  :config
  (savehist-mode 1))

(use-package orderless
  :config
  (setq completion-styles '(orderless basic))
  (setq completion-category-defaults nil))

(use-package delsel
  :config
  (delete-selection-mode 1))

(use-package vterm)

;; Company: A clean, modern inline auto-completion popup menu
(use-package company
  :defer 2
  :diminish
  :custom
  (company-begin-commands '(self-insert-command))
  (company-idle-delay .1)
  (company-minimum-prefix-length 2)
  (company-show-numbers t)
  (company-tooltip-align-annotations 't)
  (global-company-mode t))

(use-package company-box
  :after company
  :diminish
  :hook (company-mode . company-box-mode))

;; Keybindings

;; Instantly open init.el from anywhere
(defun lg/open-init-file ()
  "Open the user Emacs configuration file init.el."
  (interactive)
  (find-file user-init-file))

(global-set-key (kbd "C-c i") #'lg/open-init-file)
