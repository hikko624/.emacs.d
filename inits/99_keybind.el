;; command キーをメタキーとして使い、 option キーは修飾キーとして扱わない
(when (eq window-system 'ns)
  (setq mac-option-modifier nil)
  (setq mac-command-modifier 'meta))

(setq help-char nil)
(global-set-key "\C-h" 'delete-backward-char)
(define-key isearch-mode-map "\C-h" 'isearch-delete-char)

(when (eq system-type 'darwin)
  (define-key key-translation-map [(meta ?¥)] [(meta ?\\)])
  (define-key key-translation-map [(control ?¥)] [(control ?\\)])
  (define-key key-translation-map [(meta control ?¥)] [(meta control ?\\)]))
 ;; (define-key key-translation-map [(super ?¥)] [(super ?\\)])
