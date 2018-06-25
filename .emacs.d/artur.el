(savehist-mode 1)

;;
;; Settings
;;

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(setq c-default-style "linux")
(setq c-basic-offset 4)


;; auto saves & backups  location
(defvar user-temporary-file-directory
  (concat temporary-file-directory user-login-name "/"))
(make-directory user-temporary-file-directory t)
(setq backup-by-copying t)
(setq backup-directory-alist
      `(("." . ,user-temporary-file-directory)
        (,tramp-file-name-regexp nil)))
(setq auto-save-list-file-prefix
      (concat user-temporary-file-directory ".auto-saves-"))
(setq auto-save-file-name-transforms
      `((".*" ,user-temporary-file-directory t)))

;(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'before-save-hook 'whitespace-cleanup)

;;
;; Packages
;;

(setq package-enable-at-startup nil)
(package-initialize)

(require 'package)
(setq package-list '(use-package))

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))

; activate all the packages (in particular autoloads)
(package-initialize)
; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(require 'use-package)
(setq use-package-always-ensure t)

;; Themes
(use-package base16-theme
  :config
  (load-theme 'base16-default-dark))

(use-package evil
  :init
  (setq evil-want-integration nil)
  :config
  (evil-mode 1))

(use-package evil-leader
  :after evil
  :config
  (global-evil-leader-mode)
  (defun better-whitespace ()
    (interactive)
    (whitespace-mode -1)
    (let ((ws-small '(face lines-tail))
          (ws-big '(face tabs spaces trailing lines-tail space-before-tab
                         newline indentation empty space-after-tab space-mark
                         tab-mark newline-mark)))
      (if (eq whitespace-style ws-small)
          (setq whitespace-style ws-big)
        (setq whitespace-style ws-small)))
    (whitespace-mode 1))
  (evil-leader/set-key
    "<f1>"  'toggle-truncate-lines)
  (evil-leader/set-key
    "<f2>"  'better-whitespace))

(use-package magit
  :after evil)

(use-package evil-collection
  :after evil anaconda-mode company eldoc flycheck ivy magit git-timemachine
  :custom (evil-collection-setup-minibuffer t)
  :init
  (evil-collection-init 'anaconda-mode)
  (evil-collection-init 'company)
  (evil-collection-init 'eldoc)
  (evil-collection-init 'flycheck)
  (evil-collection-init 'ivy)
  (evil-collection-init 'minibuffer)
  (evil-collection-init 'magit)
  (evil-collection-init 'package-menu)
  (evil-collection-init 'git-timemachine)
  (setq evil-collection-setup-minibuffer t))

(use-package elscreen
  :config
  (load "elscreen" "ElScreen" t)
  (elscreen-start)
  (define-key evil-normal-state-map (kbd "C-w t") 'elscreen-create) ;create tab
  (define-key evil-normal-state-map (kbd "C-w x") 'elscreen-kill) ;kill tab
  (define-key evil-normal-state-map "gT" 'elscreen-previous) ;previous tab
  (define-key evil-normal-state-map "gt" 'elscreen-next) ;next tab
  (defun tabnew ()
    "Create new ElScreen"
    (interactive)
    (elscreen-create))
  (defun tabclose ()
    "Kill ElScreen"
    (interactive)
    (elscreen-kill)))

(use-package nlinum-relative
  :after evil
  :config
  (setq nlinum-relative-redisplay-delay 0)      ;; delay
  (setq nlinum-relative-current-symbol ">")      ;; or "" for display current line number
  (setq nlinum-relative-offset 0)
  (nlinum-relative-setup-evil)
  (add-hook 'prog-mode-hook 'nlinum-relative-mode))

(use-package magit)

(use-package evil-magit)

(use-package find-file-in-project
  :config
  (evil-leader/set-key
    "p"  'counsel-projectile-find-file))

(use-package telephone-line
  :config
  (telephone-line-mode 1))

(use-package ivy
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

(use-package hydra)

(use-package counsel
  :config
  (define-key evil-normal-state-map (kbd "C-b") 'counsel-ibuffer))

(use-package neotree
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
  :config
  (global-flycheck-mode)
  (when (not (display-graphic-p))
    (setq flycheck-indication-mode nil)))

(use-package ycmd
  :after evil-leader
  :config
  (setq ycmd-extra-conf-handler 'load)
  (add-hook 'c++-mode-hook 'ycmd-mode)
  (set-variable 'ycmd-server-command `("python" ,(file-truename "~/.emacs.d/ycmd/ycmd/")))
  (evil-leader/set-key
    "d"  'ycmd-goto-declaration
    "i"  'ycmd-goto-definition))

(use-package company
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package company-ycmd
  :after ycmd company
  :config
  (company-ycmd-setup))

(use-package anaconda-mode
  :after eldoc
  :config
  (add-hook 'python-mode-hook 'anaconda-mode)
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode))

(use-package company-anaconda
  :after company anaconda-mode
  :config
  (add-to-list 'company-backends 'company-anaconda)
  (add-hook 'python-mode-hook 'anaconda-mode))

(use-package flycheck-ycmd
  :after flycheck ycmd
  :config
  (flycheck-ycmd-setup))

(use-package eldoc
  :diminish eldoc-mode
  :init (add-hook 'ycmd-mode-hook 'ycmd-eldoc-setup))

(use-package yasnippet
  :config
  (yas-reload-all)
  (add-hook 'prog-mode-hook #'yas-minor-mode))

;(use-package yasnippet-snippets)

(use-package projectile
  :config
  (projectile-mode))

(use-package counsel-projectile
  :after projectile ivy
  :config
  (counsel-projectile-mode))

(use-package speedbar)

(use-package sr-speedbar
  :after speedbar
  :config
  (setq speedbar-use-images nil)
  (defun sr-speedbar-open-and-focus ()
    "Open & focus sr-speedbar window"
    (interactive)
    (sr-speedbar-toggle)
    (sr-speedbar-select-window))
  (evil-leader/set-key
    "o"  'projectile-speedbar-open-current-buffer-in-tree))

(use-package projectile-speedbar
  :after projectile sr-speedbar)

(use-package anzu
  :config
  (global-anzu-mode +1))

(use-package cmake-font-lock)

(use-package git-timemachine)

;(use-package git-gutter
;  :config
;  (global-git-gutter-mode t)
;  (git-gutter:linum-setup)
;  (custom-set-variables
;   '(git-gutter:update-interval 1)))
