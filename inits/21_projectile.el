(use-package projectile
  :init
  (projectile-mode)
  :ensure t)

(use-package projectile-rails
  :ensure t
  :init
  (projectile-rails-global-mode))

(use-package helm-projectile
  :ensure t
  :init
  (setq projectile-enable-caching t)
  :bind (
         ;; 参考 http://tuhdo.github.io/helm-projectile.html
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
         ("C-c p s s" . helm-projectile-ag))
  :config
  (helm-projectile-on)
  )
