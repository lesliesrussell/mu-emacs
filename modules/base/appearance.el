(use-package ancient-one-dark-theme
    :straight t)

  (use-package arc-dark-theme
    :straight t)

  (use-package badger-theme
    :straight t)

  (use-package birds-of-paradise-plus-theme
    :straight t)

(if (display-graphic-p)
    (load-theme 'ancient-one-dark t)
  (load-theme 'ancient-one-dark t))

(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (with-selected-frame frame (load-theme 'ancient-one-dark t))))
  (load-theme 'ancient-one-dark t))
