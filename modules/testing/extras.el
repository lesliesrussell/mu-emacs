(use-package proced-narrow
  :straight t
  :defer t
  :after proced
  :bind (:map proced-mode-map
              ("/" . proced-narrow)))
