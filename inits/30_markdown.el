;; MakefileをEmacsで書くときインデントがtabになる
(add-hook 'makefile-mode-hook
  '(lambda()
     (setq indent-tabs-mode t)
   )
)
