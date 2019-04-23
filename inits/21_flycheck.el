;; flycheck
(use-package flycheck
  :hook
  ((c-mode-common . flycheck-mode)
   (ruby-mode . flycheck-mode)))
