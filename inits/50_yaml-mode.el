(use-package yaml-mode
  :straight t
  :diminish
  :init
  (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode)
  ))
