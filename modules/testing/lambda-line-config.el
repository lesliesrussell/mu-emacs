(use-package fontset
  :straight (:type built-in) ;; only include this if you use straight
  :config
  ;; Use symbola for proper unicode
  (when (member "Symbola" (font-family-list))
    (set-fontset-font
     t 'symbol "Symbola" nil)))

(message "Configuring lambda-line")
(use-package lambda-line
  :straight (:type git :host github :repo "lambda-emacs/lambda-line")
  :custom
  (lambda-line-position 'top) ;; Set position of status-line
  (lambda-line-abbrev t) ;; abbreviate major modes
  (lambda-line-hspace " ")  ;; add some cushion
  (lambda-line-prefix t) ;; use a prefix symbol
  (lambda-line-prefix-padding nil) ;; no extra space for prefix
  (lambda-line-status-invert nil)  ;; no invert colors
  (lambda-line-gui-ro-symbol  " ⨂") ;; symbols
  (lambda-line-gui-mod-symbol " ⬤")
  (lambda-line-gui-rw-symbol  " ◯")
  (lambda-line-space-top +.05)  ;; padding on top and bottom of line
  (lambda-line-space-bottom -.05)
  (lambda-line-symbol-position 0.1) ;; adjust the vertical placement of symbol
  (lambda-line-syntax t)
  (lambda-line-git-diff-mode-line )
  :config
  ;; activate lambda-line
  (lambda-line-mode)
  ;; set divider line in footer
  (when (eq lambda-line-position 'top)
    (setq-default mode-line-format (list "%_"))
    (setq mode-line-format (list "%_"))))

(setq-default mode-line-format nil)

(customize-set-variable 'flymake-mode-line-counter-format '("" flymake-mode-line-error-counter flymake-mode-line-warning-counter flymake-mode-line-note-counter ""))
(customize-set-variable 'flymake-mode-line-format '(" " flymake-mode-line-exception flymake-mode-line-counters))

(message "lambda-line configured")
