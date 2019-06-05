(use-package phpactor :ensure t)
(use-package company-phpactor :ensure t)
(use-package php-mode
  :ensure t
  :init
  (ac-php-core-eldoc-setup)
  (setq flycheck-phpcs-standard "PSR2")
  :hook (
         (php-mode . (lambda () (set (make-local-variable 'company-backends)
                                     '(;; list of backends
                                       company-phpactor
                                       company-files
                                       company-ac-php-backend
                                       company-dabbrev-code
                                       company-capf
                                       )))))

   :bind (:map php-mode-map
               ("M-]" . ac-php-find-symbol-at-point)
               ("M-[" . ac-php-location-stack-back)))
