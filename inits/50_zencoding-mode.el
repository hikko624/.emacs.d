(use-package zencoding-mode
  :ensure t
  :hook (sgml-mode . (lambda ()
                      ;; htmlタグの記述の効率化を図るため
                      (zencoding-mode)
                      ;; 閉じタグも自動で編集できるようにする
                      (sgml-electric-tag-pair-mode))))
