(use-package go-mode
  :straight t
  :defer t
  :mode "\\.go\\'"
  :hook (go-mode . (lambda ()
                     (local-set-key (kbd "M-.") #'godef-jump)
                     (local-set-key (kbd "M-*") #'pop-tag-mark)))
  :init (add-hook 'before-save-hook 'gofmt-before-save))

(use-package go-eldoc
  :straight t
  :after go-mode)
