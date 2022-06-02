(use-package lsp-mode
  :ensure t
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  ;; :init
  ;; (setq lsp-keymap-prefix "s-l")
  :hook(
        (c++-mode . lsp)
        (js-mode . lsp)
        (go-mode . lsp)
        ;; (ruby-mode . lsp)
        (php-mode . lsp)
        (haskell-mode . lsp)
        (haskell-literate-mode . lsp)
        (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp
  :config
  (setq lsp-completion-provider :capf)
  ;; GCの設定
  (setq garbage-collection-messages t)
  (setq gc-cons-threshold 100000000)

  ;; プロセスから読み込むデータの量を増やす
  (setq read-process-output-max (* 1024 1024))

  (use-package lsp-clangd)
  (use-package lsp-haskell
    :ensure t)
  (use-package lsp-solargraph))

(use-package lsp-ui
  :commands lsp-ui-mode
  :ensure t
  :hook (lsp-mode . lsp-ui-mode)
  )

;; (use-package company-lsp
;;   :commands company-lsp
;;   :init
;;   (add-to-list 'company-backends 'company-lsp)
;;   :ensure t)

(use-package helm-lsp
  :commands helm-lsp-workspace-symbol
  :ensure t)

(use-package lsp-treemacs
  :commands lsp-treemacs-errors-list
  :ensure t)

;; optionally if you want to use debugger
(use-package dap-mode
  :ensure t)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language
