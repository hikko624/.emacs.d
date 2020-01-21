(use-package lsp-mode
  :straight t
  :hook (c++-mode . lsp)
  :commands lsp
  :config
  (setq lsp-prefer-flymake nil)
  (use-package lsp-clients)
  :custom
  (lsp-clients-clangd-executable "/usr/local/opt/llvm/bin/clangd")
  )

(use-package lsp-ui
  :commands lsp-ui-mode
  :straight t)

(use-package company-lsp
  :commands company-lsp
  :straight t)

(use-package helm-lsp
  :commands helm-lsp-workspace-symbol
  :straight t)

(use-package lsp-treemacs
  :commands lsp-treemacs-errors-list
  :straight t)

;; optionally if you want to use debugger
(use-package dap-mode
  :straight t)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language
