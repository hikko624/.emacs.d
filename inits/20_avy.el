(use-package avy
  :ensure t
  :bind
  (("C-c C-a r" . avy-resume)
   ("C-c C-a l" . avy-goto-line))
  :config
  (avy-setup-default))
