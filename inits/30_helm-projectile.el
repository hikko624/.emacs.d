(use-package helm-projectile
  :ensure t
  :config
  (setq projectile-enable-caching t)
  (setq helm-projectile-fuzzy-match t)
  :bind (
         ;; :map projectile-mode-map
         ;; 参考 https://github.com/bbatsov/projectile/blob/master/doc/configuration.md
         ("C-c p h" . helm-projectile)
         ("C-c p p" . helm-projectile-switch-project)
         ("C-c p f" . helm-projectile-find-file)
         ("C-c p F" . helm-projectile-find-file-in-known-projects)
         ("C-c p g" . helm-projectile-find-file-dwim)
         ("C-c p d" . helm-projectile-find-dir)
         ("C-c p e" . helm-projectile-recentf)
         ("C-c p a" . helm-projectile-find-other-file)
         ("C-c p i" . projectile-invalidate-cache)
         ("C-c p z" . projectile-cache-current-file)
         ("C-c p b" . helm-projectile-switch-to-buffer)
         ("C-c p s g" . helm-projectile-grep)
         ("C-c p s a" . helm-projectile-ack)
         ;; ("C-c p s s" . helm-projectile-ag)
         ("C-c p s s" . helm-projectile-rg)
         )
  :init
  (helm-projectile-on))

(use-package helm-rg
  :ensure t)
(use-package helm-ag
  :ensure t)
