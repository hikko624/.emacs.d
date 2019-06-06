(use-package phpactor :ensure t)

(use-package php-mode
  :ensure t
  :init
  (ac-php-core-eldoc-setup)
  (setq flycheck-phpcs-standard "PSR2")
  :bind (:map php-mode-map
              ("M-]" . ac-php-find-symbol-at-point)
              ("M-[" . ac-php-location-stack-back)))
