(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#181818" :foreground "#d8d8d8" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal :foundry "PfEd" :family "Source Code Pro")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "16dd114a84d0aeccc5ad6fd64752a11ea2e841e3853234f19dc02a7b91f5d661" default)))
 '(git-gutter:update-interval 2)
 '(package-selected-packages
   (quote
    (dired+ evil-exchange flx rainbow-delimiters evil-magit nlinum-relative flycheck-ycmd company-anaconda anaconda-mode company-ycmd company ycmd flycheck counsel linum-relative git-timemachine git-gutter cmake-font-lock rtags anzu counsel-projectile projectile yasnippet-snippets yasnippet 0xc base16-default-dark neotree elscreen telephone-line 0blayout evil-collection hydra helm ## find-file-in-project smart-mode-line monokai-theme monokai-alt-theme evil-surround base16-theme))))

(load (concat user-emacs-directory "artur.el"))
