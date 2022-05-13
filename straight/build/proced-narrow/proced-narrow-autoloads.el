;;; proced-narrow-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:


;;;### (autoloads nil "proced-narrow" "proced-narrow.el" (0 0 0 0))
;;; Generated autoloads from proced-narrow.el

(defvar proced-narrow-map (let ((map (make-sparse-keymap))) (define-key map (kbd "C-g") 'minibuffer-keyboard-quit) (define-key map (kbd "RET") 'exit-minibuffer) (define-key map (kbd "<return>") 'exit-minibuffer) map) "\
Keymap used while `proced-narrow' is reading the pattern.")

(autoload 'proced-narrow "proced-narrow" "\
Narrow a proced buffer to the processes matching a string.

If the string contains spaces, then each word is matched against
the process name separately.  To succeed, all of them have to
match but the order does not matter.  To bring it back to the
original view, you can call `revert buffer' (usually bound to g)." t nil)

(register-definition-prefixes "proced-narrow" '("proced-narrow-"))

;;;***

(provide 'proced-narrow-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; proced-narrow-autoloads.el ends here
