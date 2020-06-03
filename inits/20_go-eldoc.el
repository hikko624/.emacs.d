(use-package go-eldoc
  :straight t
  :hook
  (go-mode . (lambda ()
               (go-eldoc-setup))))
