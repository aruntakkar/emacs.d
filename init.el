;; init.el --- Arun's Emacs Configuration

;; Author: Arun
;; URL: https://github.com/aruntakkar/emacs.d
 
;; Commentary:
;; This is my personal Emacs configuration.


(require 'package)

;;; Code:
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(package-initialize)

;; -----------------------
;; Bootstrap 'use-package'
;; -----------------------
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(setq use-package-always-ensure t)

;; ----------------
;; Cleaning GUI
;; ----------------
(when window-system
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

;; -----------------
;; General Settings
;; -----------------
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq indent-tabs-mode nil)
(setq tab-width 4)
(toggle-frame-maximized)
(global-linum-mode t)
(show-paren-mode t)

;; -----------------
;; Encoding
;; -----------------
(prefer-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; -----------------
;; For Recent Files
;; -----------------
(recentf-mode 1)
(global-set-key "\C-xt" 'recentf-open-files)
(setq recentf-auto-cleanup 'never)

;; -----------------
;; External Packages
;; -----------------
(use-package monokai-theme
  :defer t
  :init (load-theme 'monokai t))

(use-package powerline
  :defer t
  :init (powerline-default-theme))

(use-package try
  :defer t)

(use-package which-key
  :defer t
  :diminish which-key-mode
  :init (add-hook 'after-init-hook 'which-key-mode))

(use-package drag-stuff
  :defer t
  :diminish drag-stuff-mode
  :config (drag-stuff-global-mode 1)
  :bind (("M-N" . drag-stuff-up)
	 ("M-P" . drag-stuff-down)))

(use-package company
  :defer t
  :diminish company-mode
  :init (add-hook 'after-init-hook 'global-company-mode))

(use-package magit
  :defer t
  :bind ("C-x g" . magit-status))

(use-package py-autopep8
  :defer t
  :init (add-hook 'python-mode-hook 'py-autopep8-enable-on-save))

(use-package rainbow-delimiters
  :defer t
  :config (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package rainbow-identifiers
  :defer t
  :config (add-hook 'prog-mode-hook 'rainbow-identifiers-mode))

(use-package flycheck
  :defer t
  :diminish flycheck-mode
  :config
  (progn
    (setq flycheck-display-errors-function nil)
    (add-hook 'after-init-hook 'global-flycheck-mode)))

(use-package anzu
  :defer t
  :diminish anzu-mode
  :init (add-hook 'after-init-hook 'global-anzu-mode))

(use-package json-reformat
  :defer t)

(use-package cycle-resize
  :defer t
  :bind (("C-M-v" . cycle-resize-window-vertically)
	 ("C-M-h" . cycle-resize-window-horizontally)))

(use-package emmet-mode
  :defer t
  :init (add-hook 'sgml-mode-hook 'emmet-mode)
        (add-hook 'html-mode-hook 'emmet-mode)
	(add-hook 'css-mode-hook 'emmet-mode))

(use-package org
  :defer t
  :config
  (progn
    (setq org-log-done 'time)
    (setq org-agenda-files (list "~/org-files/"))
    (bind-keys :map global-map
	     ("C-c 1" . org-store-link)
	     ("C-c a" . org-agenda)
	     ("C-c c" . org-capture))))

;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(package-selected-packages
   (quote
    (json-reformat which-key use-package try rainbow-identifiers rainbow-delimiters py-autopep8 monokai-theme magit flycheck drag-stuff cycle-resize company anzu))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
