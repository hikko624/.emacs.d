;; language server protocolの設定
;; 現在設定中[C++, Ruby(solargraph必須)]
(use-package lsp-mode
  :commands lsp
  :config
  (require 'lsp-clients)
  :custom
  (lsp-clients-clangd-executable "/usr/local/opt/llvm/bin/clangd")
  (lsp-prefer-flymake nil)
  :hook
  (c++-mode . lsp)
  (c-mode . lsp)
  (ruby-mode . lsp)
  )

(use-package lsp-ui
  :commands lsp-ui-mode
  :hook (
         (lsp-mode . lsp-ui-mode)))

(use-package company-lsp
  :commands company-lsp
  :init
  (add-to-list 'company-backend 'company-lsp)
  )

;; (use-package ccls
;;   :hook ((c++-mode c-mode objc-mode) .
;;          (lambda () (require 'ccls) (lsp)))
;;   :config
;;   (setq ccls-executable "/usr/local/bin/ccls")
;;   )
