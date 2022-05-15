(defun mu-setup-howdoyou ()
  (use-package howdoyou
    :straight t
    :bind (("C-h <tab>" . #'howdoyou-query)))

  ;; (add-hook 'howdoyou-mode-hook (lambda ()
  ;;                                 (switch-to-buffer-other-window "*How Do You*")))
  )

(add-hook 'emacs-startup-hook #'mu-setup-howdoyou)
