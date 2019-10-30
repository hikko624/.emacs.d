;; ;; emacsのモードライン
;; (use-package doom-modeline
;;   :ensure t
;;   :init
;;   (doom-modeline-mode 1)
;;   :config
;;   (line-number-mode 0)
;;   (column-number-mode 0)
;;   :custom
;;   ;; Determines the style used by `doom-modeline-buffer-file-name'.
;;   ;;
;;   ;; Given ~/Projects/FOSS/emacs/lisp/comint.el
;;   ;;   truncate-upto-project => ~/P/F/emacs/lisp/comint.el
;;   ;;   truncate-from-project => ~/Projects/FOSS/emacs/l/comint.el
;;   ;;   truncate-with-project => emacs/l/comint.el
;;   ;;   truncate-except-project => ~/P/F/emacs/l/comint.el
;;   ;;   truncate-upto-root => ~/P/F/e/lisp/comint.el
;;   ;;   truncate-all => ~/P/F/e/l/comint.el
;;   ;;   relative-from-project => emacs/lisp/comint.el
;;   ;;   relative-to-project => lisp/comint.el
;;   ;;   file-name => comint.el
;;   ;;   buffer-name => comint.el<2> (uniquify buffer name)
;;   ;;
;;   ;; If you are expereicing the laggy issue, especially while editing remote files
;;   ;; with tramp, please try `file-name' style.
;;   ;; Please refer to https://github.com/bbatsov/projectile/issues/657.

;;   ;; How tall the mode-line should be (only respected in GUI Emacs).
;;   (doom-modeline-height 25)
;;   ;; How wide the mode-line bar should be (only respected in GUI Emacs).
;;   (doom-modeline-bar-width 3)

;;   (doom-modeline-buffer-file-name-style 'truncate-with-project)

;;   ;; If non-nil, the mode-line is displayed with the `variable-pitch' face.
;;   (doom-modeline-enable-variable-pitch nil)

;;   ;; Whether show `all-the-icons' or not (if nil nothing will be showed).
;;   (doom-modeline-icon t)

;;   ;; Whether show the icon for major mode. It respects `doom-modeline-icon'.
;;   (doom-modeline-major-mode-icon t)

;;   ;; Display color icons for `major-mode'. It respects `all-the-icons-color-icons'.
;;   (doom-modeline-major-mode-color-icon nil)

;;   ;; Whether display minor modes or not. Non-nil to display in mode-line.
;;   (doom-modeline-minor-modes nil)

;;   ;; If non-nil, a word count will be added to the selection-info modeline segment.
;;   (doom-modeline-enable-word-count nil)

;;   ;; If non-nil, only display one number for checker information if applicable.
;;   (doom-modeline-checker-simple-format t)

;;   ;; Whether display perspective name or not. Non-nil to display in mode-line.
;;   (doom-modeline-persp-name t)

;;   ;; Whether display `lsp' state or not. Non-nil to display in mode-line.
;;   (doom-modeline-lsp t)

;;   ;; Whether display github notifications or not. Requires `ghub` package.
;;   (doom-modeline-github nil)

;;   ;; The interval of checking github.
;;   (doom-modeline-github-interval (* 30 60))

;;   ;; Whether display environment version or not.
;;   (doom-modeline-env-version t)

;;   ;; What executable of Python will be used (if nil nothing will be showed).
;;   (doom-modeline-python-executable "python")

;;   ;; Whether display mu4e notifications or not. Requires `mu4e-alert' package.
;;   (doom-modeline-mu4e t)

;;   ;; Whether display irc notifications or not. Requires `circe' package.
;;   (doom-modeline-irc t)

;;   ;; Function to stylize the irc buffer names.
;;   (doom-modeline-irc-stylize 'identity)

;;   (neo-theme (if (display-graphic-p) 'icons 'arrow)))
