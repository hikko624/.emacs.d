(use-package eshell
  :init
  (setq eshell-path-env (getenv "PATH"))
  (setenv "LANG" "ja_JP.UTF-8")
  (setenv "PAGER" "cat")
  ;; brew search nkf colordiff
  (setenv "GIT_PAGER" "nkf -w|colordiff")
  )
