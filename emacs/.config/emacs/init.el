(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
(global-display-line-numbers-mode 1)
(setq initial-scratch-message nil)

(setq visible-bell nil)
(setq inhibit-startup-message t)
(setq mouse-drag-copy-region t)
(setq bookmark-save-flag 1)

(set-face-attribute 'default nil :family "Hack Nerd Font" :height 150)

;(load-theme 'modus-operandi)
;(load-theme 'modus-vivendi)
;(load-theme 'modus-vivendi-tinted)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(use-package kanagawa-themes
  :ensure t
  :config
  (load-theme 'kanagawa-wave t))

(use-package vertico
  :ensure t
  :config
  (vertico-mode 1))

(use-package marginalia
  :ensure t
  :config
  (marginalia-mode 1))

(use-package savehist
  :ensure nil
  :config
  (savehist-mode 1))

(use-package orderless
  :ensure t
  :config
  (setq completion-styles '(orderless basic))
  (setq completion-category-defaults nil))

(use-package delsel
  :ensure nil
  :config
  (delete-selection-mode 1))

(use-package vterm
    :ensure t)
