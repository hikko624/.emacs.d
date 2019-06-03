;; (use-package projectile
;;   :ensure t
;;   :init
;;   (projectile-global-mode))

(use-package projectile-rails
  :ensure t
  :init
  (projectile-rails-global-mode))

(use-package helm-projectile
  :ensure t
  :bind (
         ("C-c p h" . helm-projectile)
         )
  :config
  (helm-projectile-on)
  )
