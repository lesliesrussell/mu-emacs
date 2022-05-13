(use-package which-key
  :straight t
  :hook (emacs-startup . (lambda ()
			   (which-key-mode))))

(use-package which-key-posframe
  :straight t
  :init (which-key-posframe-mode 1))
