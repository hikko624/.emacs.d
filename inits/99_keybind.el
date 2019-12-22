;; command キーをメタキーとして使い、 option キーは修飾キーとして扱わない
(when (eq window-system 'ns)
  (setq mac-option-modifier nil)
  (setq mac-command-modifier 'meta))

;; C-hとC-?を入れ替える
; C-hがBSとして扱える
;; (keyboard-translate ?\C-h ?\C-?)

;; VSCodeのように行swap
(defun move-line-up ()
  (interactive)
  (save-column
    (transpose-lines 1)
    (forward-line -2)))

(defun move-line-down ()
  (interactive)
  (save-column
    (forward-line 1)
    (transpose-lines 1)
    (forward-line -1)))

(global-set-key (kbd "M-P") 'move-line-up)
(global-set-key (kbd "M-N") 'move-line-down)
