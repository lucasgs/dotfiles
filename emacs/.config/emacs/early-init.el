;;; early-init.el --- Early Startup Configuration -*- lexical-binding: t; -*-

;;; Commentary:

;; Emacs 27 introduced early-init.el, which is run before init.el, before
;; package and UI initialization happens.

;;; Code:
(setq gc-cons-threshold 50000000)

(setq frame-background-mode 'dark)

(scroll-bar-mode -1)             ; Disable ugly scrollbars
(tool-bar-mode -1)               ; Disable the graphical toolbar
(tooltip-mode -1)                ; Disable tooltips
(set-fringe-mode 10)             ; Give some breathing room on the sides
(menu-bar-mode -1)               ; Disable the menu bar

(setq package-inhibit-implied-resize t)

(provide 'early-init)

;;; early-init.el ends here
