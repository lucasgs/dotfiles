(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)

(setq visible-bell nil)

(set-face-attribute 'default nil :family "Hack Nerd Font" :height 150)

(setq inhibit-startup-message t)

(global-display-line-numbers-mode 1)

;(load-theme 'modus-operandi)
;(load-theme 'modus-vivendi)
(load-theme 'modus-vivendi-tinted)

(setq mouse-drag-copy-region t)

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
