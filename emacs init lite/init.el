;; Remove bars and sound
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

;; Themes and highlights
(load-theme 'modus-vivendi)
;(global-hl-line-mode +1)

;; FZF
(fido-vertical-mode)

;; Backups, bell
(setq backup-directory-alist `(("." . ,(expand-file-name "backups" user-emacs-directory))))
(setq visible-bell t)

;; Enable Eglot automatically for modes and kill eglot buffer when done
(add-hook 'c-mode-hook #'eglot-ensure) ; make sure to install language severs
(add-hook 'c++-mode-hook #'eglot-ensure)
(add-hook 'python-mode-hook #'eglot-ensure)
(add-hook 'java-mode-hook #'eglot-ensure)
(setq eglot-autoshutdown t)
