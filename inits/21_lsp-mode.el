;; language server protocolの設定
;; 現在設定中[C++, Ruby(solargraph必須)]
(use-package lsp-mode
  :ensure t
  :commands lsp
  :hook
  (c-mode-common . lsp)
  (ruby-mode . lsp))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :custom
  ;; lsp-ui-doc
  (lsp-ui-doc-enable t)
  (lsp-ui-doc-header t)
  (lsp-ui-doc-include-signature t)
  (lsp-ui-doc-position 'top)
  (lsp-ui-doc-max-width 150)
  (lsp-ui-doc-max-height 30)
  (lsp-ui-doc-use-childframe t)
  (lsp-ui-doc-use-webkit t)

  ;; lsp-ui-flycheck
  (lsp-ui-flycheck-enable nil)

  ;; lsp-ui-sideline
  (lsp-ui-sideline-enable nil)
  (lsp-ui-sideline-ignore-duplicate t)
  (lsp-ui-sideline-show-symbol t)
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-sideline-show-diagnostics nil)
  (lsp-ui-sideline-show-code-actions nil)

  ;; lsp-ui-imenu
  (lsp-ui-imenu-enable nil)
  (lsp-ui-imenu-kind-position 'top)

  ;; lsp-ui-peek
  (lsp-ui-peek-enable t)
  (lsp-ui-peek-peek-height 20)
  (lsp-ui-peek-list-width 50)
  (lsp-ui-peek-fontify 'on-demand)
  :bind
  (:map lsp-mode-map
        ("C-c C-r" . lsp-ui-peek-find-references)
        ("C-c C-j" . lsp-ui-peek-find-definitions)
        ("C-c i"   . lsp-ui-peek-find-implementation)
        ("C-c m"   . lsp-ui-imenu)
        ("C-c s"   . lsp-ui-sideline-mode)
        ("C-c d"   . ladicle/toggle-lsp-ui-doc)))

(use-package company-lsp
  :ensure t
  :commands company-lsp
  :custom
  (company-lsp-cache-candidates t)
  (company-lsp-async t)
  (company-lsp-enable-recompletion nil))
