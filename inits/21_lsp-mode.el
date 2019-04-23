;; language server protocolの設定
;; 現在設定中[C++, Ruby(solargraph必須)]
(use-package lsp-mode
  :commands lsp
  :hook
  (c-mode-common . lsp)
  (ruby-mode . lsp))
(use-package lsp-ui :commands lsp-ui-mode)
(use-package company-lsp :commands company-lsp)
