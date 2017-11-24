(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(package-initialize)

;; Bootstrap 'use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(setq use-package-always-ensure t)

(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package monokai-theme
  :ensure t
  :config (load-theme 'monokai t))

(use-package drag-stuff
  :ensure t
  :init (drag-stuff-global-mode 1)
  :bind (("M-N" . drag-stuff-up)
	 ("M-P" . drag-stuff-down)))		

(use-package magit
  :ensure t
  :defer t
  :bind ("C-x g" . magit-status))
  
(use-package py-autopep8
  :ensure t
  :config (add-hook 'python-mode-hook 'py-autopep8-enable-on-save))

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes
   (quote
    ("3629b62a41f2e5f84006ff14a2247e679745896b5eaa1d5bcfbc904a3441b0cd" default)))
 '(package-selected-packages (quote (py-autopep8 magit ## monokai-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
