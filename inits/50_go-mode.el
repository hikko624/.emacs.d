(use-package go-mode
  :straight t
  :hook
  (go-mode . (lambda ()
               (setq tab-width 4)))
  :init
  (add-hook 'before-save-hook 'gofmt-before-save)
  )
