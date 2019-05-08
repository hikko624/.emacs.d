;; C/C++専用lsp
(use-package ccls
  :ensure t
  :hook ((c-mode c++-mode objc-mode) .
         (lambda () (require 'ccls) (lsp))))
