;; 空白の可視化
;;	　
;; "\\(\\( \\|ࢠ\\|ठ\\|ภ\\|༠\\)+\\)"
(use-package whitespace
  ;; :ensure t
  :diminish global-whitespace-mode
  :config
  (global-whitespace-mode 1)
  :init
  (setq whitespace-style '(facetabs spaces trailing space-before-tab::tab indentation empty space-mark tab-mark))
  (setq whitespace-display-mappings
        '((space-mark ?\u3000 [?\u25a1])
          (space-mark ?\u200B [?\u2423])
          (space-mark ?\uFEFF [?\u2423])
          ;; WARNING: タブ幅が1文字分しかない状況ではタブ位置がずれる問題がある
          (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))
  (setq whitespace-display-mappings
        '((space-mark ?\u3000 [?\u25a1])
          (space-mark ?\u200B [?\u2423])
          (space-mark ?\uFEFF [?\u2423])
          ;; WARNING: タブ幅が1文字分しかない状況ではタブ位置がずれる問題がある
          (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))
  (setq whitespace-space-regexp "\\([\u2002-\u200B\u3000\uFEFF]+\\)")
  (setq whitespace-hspace-regexp "\\(\\( \\|ࢠ\\|ठ\\|ภ\\|༠\\)+\\)")
  ;; 保存前に自動でクリーンアップ
  (setq whitespace-action '(auto-cleanup))

  (setq whitespace-display-mappings
        '((space-mark ?\u3000 [?\u25a1])
          (space-mark ?\u200B [?\u2423])
          (space-mark ?\uFEFF [?\u2423])
          ;; WARNING: タブ幅が1文字分しかない状況ではタブ位置がずれる問題がある
          (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))
  )
