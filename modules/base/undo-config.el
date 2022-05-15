(use-package undo-fu
  :straight t
  :commands (undo-fu-only-undo
             undo-fu-only-redo)
  :bind (("C-z" . #'undo-fu-only-undo)
         ("C-S-z" . #'undo-fu-only-redo)))
