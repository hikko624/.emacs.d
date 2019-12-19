(use-package magit
  :straight t
  :diminish
  :bind (
         ("C-x g" . magit-status)
         ("C-x M-g" . magit-dispatch-popup)))
