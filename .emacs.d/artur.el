(savehist-mode 1)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4) ; emacs 23.1, 24.2, default to 8
(setq c-default-style "linux")
(setq c-basic-offset 4)

;(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'before-save-hook 'whitespace-cleanup)

(setq package-enable-at-startup nil)
(package-initialize)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(require 'use-package)

(use-package evil
  :ensure t
  :init
  (setq evil-want-integration nil)
  :config
  (evil-mode 1))

(use-package evil-leader
  :ensure t
  :after evil
  :config
  (global-evil-leader-mode))

(use-package evil-magit
  :ensure t
  :after evil)

(use-package evil-collection
  :ensure t
  :after evil anaconda-mode company eldoc flycheck ivy
  :config
  (evil-collection-init 'anaconda-mode)
  (evil-collection-init 'company)
  (evil-collection-init 'eldoc)
  (evil-collection-init 'flycheck)
  (evil-collection-init 'ivy)
  (setq evil-collection-setup-minibuffer t))

(use-package elscreen
  :ensure t
  :config
  (load "elscreen" "ElScreen" t)
  (elscreen-start)
  (define-key evil-normal-state-map (kbd "C-w t") 'elscreen-create) ;create tab
  (define-key evil-normal-state-map (kbd "C-w x") 'elscreen-kill) ;kill tab
  (define-key evil-normal-state-map "gT" 'elscreen-previous) ;previous tab
  (define-key evil-normal-state-map "gt" 'elscreen-next)) ;next tab

(use-package base16-theme
  :ensure t
  :config
  (load-theme 'base16-default-dark))

(use-package nlinum-relative
  :ensure t
  :config
  (setq nlinum-relative-redisplay-delay 0)      ;; delay
  (setq nlinum-relative-current-symbol "->")      ;; or "" for display current line number
  (setq nlinum-relative-offset 0)
  (nlinum-relative-setup-evil)
  (add-hook 'prog-mode-hook 'nlinum-relative-mode))

(use-package magit
  :ensure t)

(use-package find-file-in-project
  :ensure t
  :config
  (define-key evil-normal-state-map (kbd "C-p") 'counsel-projectile-find-file))

(use-package telephone-line
  :ensure t
  :config
  (telephone-line-mode 1))

(use-package ivy
  :ensure t
  :diminish
  (ivy-mode . "")             ; does not display ivy in the modeline
  :init
  (ivy-mode 1)                          ; enable ivy globally at startup
  :config
  (setq ivy-use-virtual-buffers t)       ; extend searching to bookmarks and
  (setq enable-recursive-minibuffers t)
  (setq ivy-height 20)                   ; set height of the ivy window
  (setq ivy-count-format "(%d/%d) ")     ; count format, from the ivy help page
  (setq ivy-display-style 'fancy)
  (setq ivy-format-function 'ivy-format-function-line) ; Make highlight extend all the way to the right
  (setq ivy-initial-inputs-alist nil))

(use-package hydra
  :ensure t)

(use-package counsel
  :ensure t
  :config
  (define-key evil-normal-state-map (kbd "C-b") 'counsel-ibuffer))

(use-package neotree
  :ensure t
  :config
  (evil-leader/set-key
    "m"  'neotree-toggle
    "n"  'neotree-project-dir)
  (setq neo-smart-open t)

  (setq projectile-switch-project-action 'neotree-projectile-action)

  (defun neotree-project-dir ()
    "Open NeoTree using the git root."
    (interactive)
    (let ((project-dir (ffip-project-root))
      (file-name (buffer-file-name)))
      (if project-dir
      (progn
        (neotree-dir project-dir)
        (neotree-find file-name))
    (message "Could not find git project root."))))

  (defun neo-open-file-hide (full-path &optional arg)
    "Open a file node and hides tree."
    (neo-global--select-mru-window arg)
    (find-file full-path)
    (neotree-hide))

  (defun neotree-enter-hide (&optional arg)
    "Enters file and hides neotree directly"
    (interactive "P")
    (neo-buffer--execute arg 'neo-open-file-hide 'neo-open-dir))

  (add-hook 'neotree-mode-hook
        (lambda ()
          (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
          (define-key evil-normal-state-local-map (kbd "I") 'neotree-hidden-file-toggle)
          (define-key evil-normal-state-local-map (kbd "z") 'neotree-stretch-toggle)
          (define-key evil-normal-state-local-map (kbd "R") 'neotree-refresh)
          (define-key evil-normal-state-local-map (kbd "m") 'neotree-rename-node)
          (define-key evil-normal-state-local-map (kbd "c") 'neotree-create-node)
          (define-key evil-normal-state-local-map (kbd "d") 'neotree-delete-node)
          (define-key evil-normal-state-local-map (kbd "s") 'neotree-enter-vertical-split)
          (define-key evil-normal-state-local-map (kbd "S") 'neotree-enter-horizontal-split)
          (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter-hide))))

(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode)
  (when (not (display-graphic-p))
    (setq flycheck-indication-mode nil)))

(use-package ycmd
  :ensure t
  :config
  (add-hook 'c++-mode-hook 'ycmd-mode)
  (set-variable 'ycmd-server-command `("python" ,(file-truename "~/.emacs.d/ycmd/ycmd/"))))

(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package company-ycmd
  :ensure t
  :after ycmd company
  :config
  (company-ycmd-setup))

(use-package anaconda-mode
  :ensure t
  :after eldoc
  :config
  (add-hook 'python-mode-hook 'anaconda-mode)
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode))

(use-package company-anaconda
  :ensure t
  :after company anaconda-mode
  :config
  (add-to-list 'company-backends 'company-anaconda)
  (add-hook 'python-mode-hook 'anaconda-mode))

(use-package flycheck-ycmd
  :ensure t
  :after flycheck ycmd
  :config
  (flycheck-ycmd-setup))

(use-package eldoc
  :ensure t
  :diminish eldoc-mode
  :init (add-hook 'ycmd-mode-hook 'ycmd-eldoc-setup))

(use-package yasnippet
  :ensure t
  :config
  (yas-reload-all)
  (add-hook 'prog-mode-hook #'yas-minor-mode))

;(use-package yasnippet-snippets
;  :ensure t)

(use-package projectile
  :ensure t
  :config
  (projectile-mode))

(use-package counsel-projectile
  :ensure t
  :after projectile ivy
  :config
  (counsel-projectile-mode))
