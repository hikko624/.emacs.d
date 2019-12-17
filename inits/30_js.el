(use-package js2-mode
  :ensure t
  :init
  (setq js2-basic-offset 2)
  )

(use-package rjsx-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))
  )
