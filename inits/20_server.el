(use-package server
  ;; :ensure t
  :config
  (unless (server-running-p)
    ;; サーバ起動
    (server-start)
    ;; クライアントを終了するとき終了するかどうかを聞かない
    (remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)))
