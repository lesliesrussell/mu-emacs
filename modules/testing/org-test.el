(use-package company-posframe
  :straight t
  :config
  (company-posframe-mode 1))

(setq org-startup-indented t
      org-pretty-entities t
      org-hide-emphasis-markers t
      org-startup-with-inline-images t
      org-image-actual-width '(300))

(use-package org-appear
  :straight t
  :hook (org-mode . org-appear-mode))

(use-package org-superstar
  :straight t
  :defer t
  :config
  (setq org-superstar-special-todo-items t))

(add-hook 'org-mode-hook (lambda ()
                           (org-superstar-mode 1)))

(setq-default line-spacing 1)
