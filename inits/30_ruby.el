(use-package ruby-mode
  :init
  (setq ruby-indent-level 2)
  )
(use-package ruby-end
  :ensure t
  :hook
  (ruby-mode . ruby-end-mode))
