(use-package lsp-mode
  :straight t
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  :init
  (setq lsp-keymap-prefix "s-l")
  :hook(
        (c++-mode . lsp)
        (js2-mode . lsp)
        (go-mode . lsp)
        (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp
  :config
  (add-to-list 'lsp-language-id-configuration '(js2-jsx-mode . "javascriptreact"))
  (setq lsp-prefer-flymake nil)
  (use-package lsp-clients)
  ;; :custom
  ;; (lsp-clients-clangd-executable "/usr/local/opt/llvm/bin/clangd")
  )

(use-package lsp-ui
  :commands lsp-ui-mode
  :straight t)

(use-package company-lsp
  :commands company-lsp
  :init
  (add-to-list 'company-backends 'company-lsp)
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

;; (use-package ccls
;;   :straight t
;;   :init
;;   (setq cls-executable "/usr/local/bin/ccls")
;;   )
