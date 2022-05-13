(use-package visual-regexp-steroids
  :straight t
  :bind (("C-c r" . #'vr/replace)
	 ("C-c q" . #'vr/query-replace)
	 ("C-c m" . #'vr/mark)
	 ("C-r" . vr/isearch-backward)
	 ("C-s" . vr/isearch-forward)))

(use-package embark
  :straight t
  :bind
  (("C-." . embark-act)         ;; pick some comfortable binding
   ("C-;" . embark-dwim)        ;; good alternative: M-.
   ("C-h B" . embark-bindings)  ;; alternative for `describe-bindings'
   )
  :init
  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)
  :config
  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
	       '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
		 nil
		 (window-parameters (mode-line-format . none)))))
