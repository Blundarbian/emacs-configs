;---------------Package repo setup---------------
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;; use-package
(require 'use-package)
(setq use-package-always-ensure t)

;---------------Packages---------------
;; Display keybindings
(use-package which-key
  :ensure t
  :config (which-key-mode 1))

;; UI/Themes
(use-package doom-themes
  :ensure t
  :config (load-theme 'doom-dracula t))

;; icons for doom-modeline and specific fontp
(use-package nerd-icons
  :custom
  (nerd-icons-font-family "JetBrainsMono Nerd Font")) 

;; doom modeline instead of emacs clasic
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(use-package dashboard
  :ensure t
  :init
  (setq dashboard-startup-banner (expand-file-name "space_ship.jpg" user-emacs-directory))
  :custom
  (dashboard-banner-logo-title "Welcome to Emacs")
  (dashboard-center-content t)
  (dashboard-display-icons-p t)     
  (dashboard-set-heading-icons t)
  (dashboard-set-file-icons t)
  (dashboard-items '((recents  . 5)
                     (bookmarks . 5)
                     (agenda . 5)))
  :config
  (dashboard-setup-startup-hook)
  (setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))
  
  ;; Keybinding for dashboard
  (with-eval-after-load 'dashboard
    (define-key dashboard-mode-map (kbd "r") 'dashboard-jump-to-recents)))
  
;--------------Custom Functions---------------
;;Bell is changed to flashing mode
(defun my-visible-bell ()
  (invert-face 'mode-line)
  (run-with-timer 0.1 nil #'invert-face 'mode-line))

(setq ring-bell-function 'my-visible-bell)
(setq visible-bell nil) ; Ensure the default screen flash is off

;---------------Removals---------------
;; remove tool bar
(tool-bar-mode -1)
;; reove menu bar
(scroll-bar-mode -1)
;; deletes highlights when you start typing
(delete-selection-mode 1)
;; remove startup splash-screen
(setq inhibit-startup-screen t)
;; remove startup message
(setq inhibit-startup-message t)

;---------------Additional Features---------------
;; backup directory / copy to avoid possible file linking issues
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)

;; highlight current line
(global-hl-line-mode +1)

;; adds line numbers (prog-mode-hook) only affects coding buffers
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; show matching parenthesis
(show-paren-mode 1)

;; built-in fuzzy finder for emacs
(setq completion-styles '(flex basic partial-completion))
(fido-mode 1)
(fido-vertical-mode 1)




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
