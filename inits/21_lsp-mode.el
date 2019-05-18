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
  :custom
  (lsp-ui-doc-enable t)
  (lsp-ui-doc-header t)
  (lsp-ui-doc-max-width 150)
  (lsp-ui-doc-max-height 30)
  (lsp-ui-doc-use-childframe t)
  (lsp-ui-doc-use-webkit t)
  (lsp-ui-peek-enable t)
  (lsp-ui-peek-peek-height 20)
  (lsp-ui-peek-list-width 50)
  (lsp-ui-sideline-enable nil)
  :hook (
         (lsp-mode . lsp-ui-mode))
  :bind
  (:map lsp-mode-map
        ("M-?" . lsp-ui-peek-find-references)
        ("M-." . lsp-ui-peek-find-definitions))
  )

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
