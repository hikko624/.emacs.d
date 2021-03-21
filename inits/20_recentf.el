;; 最近開いたファイル
(use-package recentf
  ;; :ensure t
  :config
  (setq recentf-save-file "~/.emacs.d/.recentf")
  (setq recentf-max-saved-items 1000)
  (recentf-load-list)
  ;; recentf を自動保存
  (defvar recentf-auto-save-timer
    (run-with-idle-timer 300 t 'recentf-save-list))
  )

;; https://melpa.org/#/recentf-ext
;; window configuration が変わる度に recentf を更新
;; dired で開いたディレクトリを recentf に追加
;; (require 'recentf-ext)

;; https://melpa.org/#/undo-tree
;; (global-undo-tree-mode 1)
;; (define-key undo-tree-map "\C-_" 'undo-tree-switch-branch)

;; 同一ファイル名を開いた時に, バッファ名をユニークにする
(use-package uniquify
  :config
  ;; デフォルトでは #! だけで script になるので #!/ に
  (defadvice executable-make-buffer-file-executable-if-script-p
      (around my-script-p activate)
    (and (>= (buffer-size) 3)
         (save-restriction
           (widen)
           (string= "#!/" (buffer-substring (point-min) (+ 3 (point-min)))))
         ad-do-it))
  :init
  ;; [ファイル名]<[ディレクトリ名]>
  ;; (setq uniquify-buffer-name-style 'post-forward-angle-brackets)
  ;; [ディレクトリ名]/[ファイル名]
  (setq uniquify-buffer-name-style 'forward)
  ;; shebangがあるとき実行可能属性を付加
  :hook
  (after-save . executable-make-buffer-file-executable-if-script-p)
)
