(use-package dockerfile-mode
  :straight t
  :init
  (add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode)))
