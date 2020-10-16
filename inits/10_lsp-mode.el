(use-package lsp-mode
  :straight t
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  ;; :init
  ;; (setq lsp-keymap-prefix "s-l")
  :hook(
        (c++-mode . lsp)
        (js-mode . lsp)
        (go-mode . lsp)
        (ruby-mode . lsp)
        (php-mode . lsp)
        (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp
  :config
  (setq lsp-completion-provider :capf)
  (setq lsp-prefer-flymake nil)
  (use-package lsp-clangd)
  (use-package lsp-solargraph)
  )

(use-package lsp-ui
  :commands lsp-ui-mode
  :straight t)

;; (use-package company-lsp
;;   :commands company-lsp
;;   :init
;;   (add-to-list 'company-backends 'company-lsp)
;;   :straight t)

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
;;   :custom
;;   (ccls-executable "/usr/local/bin/ccls")
;;   :hook ((c++-mode) .
;;          (lambda () (require 'ccls) (lsp))))
