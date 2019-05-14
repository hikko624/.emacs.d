;; web-modeの設定
(use-package web-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

  (add-hook 'web-mode-hook
            '(lambda()
               (setq web-mode-content-types-alist)
               (setq web-mode-markup-indent-offset 2)
               (setq web-mode-css-indent-offset 2)
               (setq web-mode-code-indent-offset 2)
               (setq web-mode-style-padding 1)
               (setq web-mode-script-padding 1)
               (setq web-mode-block-padding 0)
               (setq web-mode-comment-style 2)
               (set-face-attribute 'web-mode-css-rule-face nil :foreground "Pink3")
               (setq web-mode-extra-snippets
                     '(("erb" . (("toto" . "<% toto | %>\n\n<% end %>")))
                       ("php" . (("dowhile" . "<?php do { ?>\n\n<?php } while (|); ?>")
                                 ("debug" . "<?php error_log(__LINE__); ?>")))
                       ))
               (setq web-mode-extra-auto-pairs
                     '(("erb"  . (("beg" "end")))
                       ("php"  . (("beg" "end")
                                  ("beg" "end")))
                       ))


               ))


  )
