;; language server protocolの設定
;; 現在設定中[C++, Ruby(solargraph必須)]
(use-package lsp-mode
  :ensure t
  :commands lsp
  :config
  (require 'lsp-clients)
  :custom
  (lsp-clients-clangd-executable "/usr/local/opt/llvm/bin/clangd")
  (lsp-php nil)
  (lsp-clients-php-server-command
   `("php" ,(expand-file-name "~/.anyenv/envs/phpenv/shims/php-language-server.php")))
  (lsp-prefer-flymake nil)
  :hook
  (c++-mode . lsp)
  (c-mode . lsp)
  (ruby-mode . lsp)
  (php-mode . lsp)
  (go-mode . lsp))

(use-package lsp-ui
  :ensure t
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
        ("M-." . lsp-ui-peek-find-definitions)))

(use-package company-lsp
  :ensure t
  :commands company-lsp
  :custom
  (company-lsp-cache-candidates t)
  (company-lsp-async t)
  (company-lsp-enable-recompletion nil))

;; (use-package ccls
;;   :hook ((c++-mode c-mode objc-mode) .
;;          (lambda () (require 'ccls) (lsp)))
;;   :config
;;   (setq ccls-executable "/usr/local/bin/ccls")
;;   )
(use-package helm-lsp
  :ensure t
  :commands helm-lsp-workspace-symbol)
(use-package lsp-treemacs
  :ensure t
  :commands lsp-treemacs-errors-list)
(use-package dap-mode
  :ensure t
  :config
  (require 'dap-ui)
  (require 'dap-php)
  (require 'dap-ruby)
  (require 'dap-lldb)
  (require 'dap-go)
  :init
  (dap-mode t)
  (dap-ui-mode t))
