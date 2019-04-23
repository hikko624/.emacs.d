;; web-modeの設定
(use-package web-mode
  :ensure t
  :mode
  ("\\.html?\\'" . web-mode)
  ("\\.js[x]?$" . web-mode)
  :config
  ;; 拡張子 .js でもJSX編集モードにする
  (web-mode-content-types-alist . (("jsx" . "\\.js[x]?\\'")))

  )
