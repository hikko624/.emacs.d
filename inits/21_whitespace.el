;; 空白の可視化
;;	　
;;       "\\(\\( \\|ࢠ\\|ठ\\|ภ\\|༠\\)+\\)"
(use-package whitespace
  :config
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
  (setq whitespace-hspace-regexp "\\(\\( \\|ࢠ\\|ठ\\|ภ\\|༠\\)+\\)")
  ;; 保存前に自動でクリーンアップ
  (setq whitespace-action '(auto-cleanup)))

(setq whitespace-display-mappings
      '((space-mark ?\u3000 [?\u25a1])
        (space-mark ?\u200B [?\u2423])
        (space-mark ?\uFEFF [?\u2423])
        ;; WARNING: タブ幅が1文字分しかない状況ではタブ位置がずれる問題がある
        (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(whitespace-empty ((((class color) (background dark)) :background "#200040" :foreground "darkgray") (((class color) (background light)) :background "khaki" :foreground "lightgray") (t :inverse-video t :weight bold :underline t)))
 '(whitespace-hspace ((((class color) (background dark)) :background "DeepPink3" :foreground "pink") (((class color) (background light)) :background "DeepPink2" :foreground "MidnightBlue") (t nil)))
 '(whitespace-indentation ((((class color) (background dark)) :background "grey16" :foreground "DeepPink") (((class color) (background light)) :background "chartreuse" :foreground "DeepPink") (t :inverse-video t :weight bold :underline t)))
 '(whitespace-space ((((class color) (background dark)) :background "DeepPink4" :foreground "pink") (((class color) (background light)) :background "DeepPink" :foreground "MidnightBlue") (t nil)))
 '(whitespace-space-before-tab ((((class color) (background dark)) :background "DeepPink" :foreground "firebrick") (((class color) (background light)) :background "DeepPink" :foreground "firebrick") (t :inverse-video t :weight bold :underline t)))
 '(whitespace-tab ((((class color) (background dark)) :background "grey16" :foreground "darkgray") (((class color) (background light)) :background "chartreuse" :foreground "MidnightBlue") (t :inverse-video t)))
 '(whitespace-trailing ((((class color) (background dark)) :background "#400080") (((class color) (background light)) :background "LightGreen") (t :inverse-video t :weight bold :underline t))))

(global-whitespace-mode 1)
