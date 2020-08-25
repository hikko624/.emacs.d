;; flycheck
(use-package flycheck
  :straight t
  :hook
  (yaml-mode . flycheck-mode)
  ;; ((c++-mode . flycheck-mode))
  ;; (ruby-mode . fly-check-mode)
  )
