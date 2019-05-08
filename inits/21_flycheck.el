;; flycheck
(use-package flycheck
  :ensure t
  :hook
  ((c-mode-common . flycheck-mode)
   (ruby-mode . flycheck-mode)))
