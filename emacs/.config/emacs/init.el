;;; init.el --- Load the literal Org-mode configuration -*- lexical-binding: t; -*-

;; The real configuration lives in config.org.  org-babel-load-file
;; tangles the Emacs Lisp source blocks out of that file and loads
;; them, producing a compiled config.el next to it.
(org-babel-load-file
 (expand-file-name
  "config.org"
  user-emacs-directory))

;;; init.el ends here