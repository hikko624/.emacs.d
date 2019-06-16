;; flycheck
(use-package flycheck
  :ensure t
  :hook
  ((c-mode . flycheck-mode)
   (c++-mode . flycheck-mode)
   (ruby-mode . flycheck-mode)
   (php-mode . flycheck-mode)
   (go-mode . flycheck-mode)))

(use-package flycheck-golangci-lint
  :ensure t
  :hook (go-mode . flycheck-golangci-lint-setup)
  :init
  (setq flycheck-golangci-lint-fast t))
