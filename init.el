;; init.el --- Arun's Emacs Configuration

;; Author: Arun
;; URL: https://github.com/aruntakkar/emacs.d
 
;; Commentary:
;; This is my personal Emacs configuration.

(package-initialize)


;;; package-archives
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))


;; -----------------------
;; Bootstrap 'use-package'
;; -----------------------
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

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
(setq dired-dwim-target t)
(set 'temporary-file-directory "/tmp")
(toggle-frame-maximized)
(global-linum-mode t)
(show-paren-mode t)
(global-wakatime-mode)
(set-default-font "Monospace-10")


;; -----------------
;; Encoding
;; -----------------
(prefer-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)


;; -----------------
;; Fo Recent Files
;; -----------------
(recentf-mode 1)
(global-set-key "\C-xt" 'recentf-open-files)
(setq recentf-auto-cleanup 'never)


;; -----------------
;; External Packages
;; -----------------
(use-package monokai-theme
  :ensure t
  :defer t
  :init (load-theme 'monokai t))

(use-package powerline
  :ensure t
  :defer t
  :init (powerline-default-theme))

(use-package neotree
  :ensure t
  :defer t
  :bind ("M-s" . neotree-toggle)
  :config
  (progn
    (setq neo-theme (if (display-graphic-p) 'icons 'arrow))))

(use-package all-the-icons
  :ensure t
  :defer t)

(use-package highlight-indent-guides
  :ensure t
  :defer t
  :init (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
  :config
  (progn
    (setq highlight-indent-guides-method 'character)))

(use-package try
  :ensure t
  :defer t)

(use-package which-key
  :ensure t
  :defer t
  :diminish which-key-mode
  :init (add-hook 'after-init-hook 'which-key-mode))

(use-package drag-stuff
  :ensure t
  :defer t
  :diminish drag-stuff-mode
  :config (drag-stuff-global-mode 1)
  :bind (("M-N" . drag-stuff-up)
	 ("M-P" . drag-stuff-down)))

(use-package company
  :ensure t
  :defer t
  :diminish compnay-mode
  :init (add-hook 'after-init-hook 'global-company-mode))
    
(use-package magit
  :ensure t
  :defer t
  :bind ("C-x g" . magit-status))

(use-package py-autopep8
  :ensure t
  :defer t
  :init (add-hook 'python-mode-hook 'py-autopep8-enable-on-save))

(use-package rainbow-delimiters
  :ensure t
  :defer t
  :init (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package rainbow-identifiers
  :ensure t
  :defer t
  :config (add-hook 'prog-mode-hook 'rainbow-identifiers-mode))

(use-package flycheck
  :ensure t
  :defer t
  :diminish flycheck-mode
  :config
  (progn
    (setq flycheck-display-errors-function nil)
    (add-hook 'after-init-hook 'global-flycheck-mode)))

(use-package anzu
  :ensure t
  :defer t
  :diminish anzu-mode
  :init (add-hook 'after-init-hook 'global-anzu-mode))

(use-package json-reformat
  :ensure t
  :defer t)

(use-package cycle-resize
  :ensure t
  :defer t
  :bind (("C-M-v" . cycle-resize-window-vertically)
	 ("C-M-h" . cycle-resize-window-horizontally)))

(use-package emmet-mode
  :ensure t
  :defer t
  :diminish emmet-mode
  :diminish 
  :init (add-hook 'sgml-mode-hook 'emmet-mode)
        (add-hook 'html-mode-hook 'emmet-mode)
	(add-hook 'css-mode-hook 'emmet-mode)
	(add-hook 'rjsx-mode-hook 'emmet-mode))

(use-package vimish-fold
  :ensure t
  :defer t
  :init (vimish-fold-global-mode t))

(use-package smartparens
  :ensure t
  :defer t 
  :diminish smartparens-mode
  :init (add-hook 'prog-mode-hook 'smartparens-mode))

(use-package carbon-now-sh
  :ensure t
  :defer t)

(use-package wakatime-mode
  :ensure t
  :defer t
  :diminish wakatime-mode
  :init (add-hook 'after-init-hook 'global-wakatime-mode))

(use-package rjsx-mode
  :ensure t
  :defer t
  :diminish rjsx-mode)
(add-to-list 'auto-mode-alist '(".*\\.js\\'" . rjsx-mode))

(use-package yasnippet
  :ensure t
  :bind ("C-x y" . yas-describe-tables)
  :config
  (use-package yasnippet-snippets
    :ensure t)
  (yas-reload-all))
(add-hook 'prog-mode-hook 'yas-minor-mode)

(use-package react-snippets
  :ensure t
  :defer t)

(use-package org
  :ensure t
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
 '(ansi-color-names-vector
   ["#272822" "#F92672" "#A6E22E" "#E6DB74" "#66D9EF" "#FD5FF0" "#A1EFE4" "#F8F8F2"])
 '(compilation-message-face (quote default))
 '(custom-safe-themes
   (quote
    ("bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" "274fa62b00d732d093fc3f120aca1b31a6bb484492f31081c1814a858e25c72e" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(fci-rule-color "#3C3D37")
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100))))
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   (quote
    (yasnippet-snippets yasnippet-classic-snippets react-snippets ## vlf dracula-theme gh-md markdown-mode flymd pdf-tools rjsx-mode wakatime-mode all-the-icons-dired neotree emmet-mode powerline carbon-now-sh vimish-fold smartparens highlight-indent-guides all-the-icons json-reformat which-key use-package try rainbow-identifiers rainbow-delimiters py-autopep8 monokai-theme magit flycheck drag-stuff cycle-resize company anzu)))
 '(pos-tip-background-color "#FFFACE")
 '(pos-tip-foreground-color "#272822")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(wakatime-api-key "0a249fc0-6adb-4eb9-9d26-3384f33c7676")
 '(wakatime-cli-path "/usr/bin/wakatime")
 '(wakatime-python-bin nil)
 '(weechat-color-list
   (quote
    (unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
