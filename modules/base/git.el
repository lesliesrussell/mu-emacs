(use-package magit
  :straight t
  :bind (("C-c C-g m" . #'magit)))

(use-package vdiff
  :straight t
  :commands (vdiff-mode)
  :hook (vdiff-mode . (lambda ()
                        (define-key vdiff-mode-map (kbd "C-c") vdiff-mode-prefix-map))))

(use-package vdiff-magit
  :straight t
  :commands (vdiff-magit-dwim
             vdiff-magit)
  :hook (magit-mode . (lambda ()
                        (define-key magit-mode-map "e" 'vdiff-magit-dwim)
                        (define-key magit-mode-map "E" 'vdiff-magit)
                        (transient-suffix-put 'magit-dispatch "e" :description "vdiff (dwim)")
                        (transient-suffix-put 'magit-dispatch "e" :command 'vdiff-magit-dwim)
                        (transient-suffix-put 'magit-dispatch "E" :description "vdiff")
                        (transient-suffix-put 'magit-dispatch "E" :command 'vdiff-magit)

                        ;; This flag will default to using ediff for merges.
                        ;; (setq vdiff-magit-use-ediff-for-merges nil)

                        ;; Whether vdiff-magit-dwim runs show variants on hunks.  If non-nil,
                        ;; vdiff-magit-show-staged or vdiff-magit-show-unstaged are called based on what
                        ;; section the hunk is in.  Otherwise, vdiff-magit-dwim runs vdiff-magit-stage
                        ;; when point is on an uncommitted hunk.
                        ;; (setq vdiff-magit-dwim-show-on-hunks nil)

                        ;; Whether vdiff-magit-show-stash shows the state of the index.
                        ;; (setq vdiff-magit-show-stash-with-index t)

                        ;; Only use two buffers (working file and index) for vdiff-magit-stage
                        ;; (setq vdiff-magit-stage-is-2way nil)
                        )))
