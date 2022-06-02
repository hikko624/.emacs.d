(use-package go-mode
  :ensure t
  :hook
  (go-mode . (lambda ()
               (setq tab-width 4)
               (lsp-go-install-save-hooks))
           )
  :init
  (defun lsp-go-install-save-hooks ()
    (add-hook 'before-save-hook #'lsp-format-buffer t t)
    (add-hook 'before-save-hook #'lsp-organize-imports t t))
  )
