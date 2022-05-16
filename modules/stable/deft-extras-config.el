;; (defvar mu-deft-dir-list '()
;;   "List of deft dirs")
;; (require 'consult)
;; (require 'deft)

(setq mu-deft-dir-list '("~/Documents/"
                         "~/.config/emacs/modules/"
                         ))

(defun mu-select-deft-dir ()
  (interactive)
  (setq deft-directory
        (consult--read mu-deft-dir-list :prompt "Directory: "))
  (deft))
;; (global-set-key (kbd "C-c M-d") #'mu-select-deft-dir)
(general-define-key "C-c M-d" #'mu-select-deft-dir)
