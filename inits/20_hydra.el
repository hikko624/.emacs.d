(use-package hydra
  :ensure t)
;; (use-package hydra-examples
;;   :ensure t)
;; (use-package hydra-ox
;;   :ensure t)
(use-package lv
  :ensure t)
(defhydra hydra-splitter ()
  "splitter"
  ("h" hydra-move-splitter-left)
  ("j" hydra-move-splitter-down)
  ("k" hydra-move-splitter-up)
  ("l" hydra-move-splitter-right))
(defhydra hydra-zoom ()
  "zoom"
  ("g" text-scale-increase "in")
  ("l" text-scale-decrease "out"))
