;; flycheck
(use-package flycheck
  :ensure t
  :hook
  ((c-mode . flycheck-mode)
   (c++-mode . flycheck-mode)
   (ruby-mode . flycheck-mode)
   (php-mode . flycheck-mode)))
