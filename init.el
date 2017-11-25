(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(package-initialize)

;; Bootstrap 'use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(setq use-package-always-ensure t)

;; Basic Configuration
(setq initial-scratch-message nil)
(setq inhibit-startup-screen t)
(set-language-environment "UTF-8")
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(toggle-frame-maximized)
(global-linum-mode t)
(show-paren-mode 1)
(recentf-mode 1) ;; For recent open files
(global-set-key "\C-xt" 'recentf-open-files)
(setq recentf-auto-cleanup 'never)

(use-package try
  :defer t)

(use-package which-key
  :defer t
  :diminish which-key-mode
  :config (which-key-mode))

(use-package monokai-theme
  :ensure t
  :config (load-theme 'monokai t))

(use-package drag-stuff
  :defer t
  :diminish drag-stuff-mode
  :config (drag-stuff-global-mode 1)
  :bind (("M-N" . drag-stuff-up)
	 ("M-P" . drag-stuff-down)))

(use-package company
  :defer t
  :diminish company-mode
  :init(add-hook 'after-init-hook 'global-company-mode))

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
  :diminish t
  :config (global-flycheck-mode))
    
