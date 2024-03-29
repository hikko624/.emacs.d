;; yasnippetの設定
(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :bind (
         :map yas-minor-mode-map
              ;; 既存スニペットを挿入する
              ("C-x i i" . yas-insert-snippet)
              ;; 新規スニペットを作成するバッファを用意する
              ("C-x i n" . yas-new-snippet)
              ;; 既存スニペットを閲覧・編集する
              ("C-x i v" . yas-visit-snippet-file))
  :init
  ;; yas起動
  (yas-global-mode 1))
(use-package yasnippet-snippets
  :ensure t
  :diminish)
