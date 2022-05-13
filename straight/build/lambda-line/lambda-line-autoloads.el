;;; lambda-line-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:


;;;### (autoloads nil "lambda-line" "lambda-line.el" (0 0 0 0))
;;; Generated autoloads from lambda-line.el

(defvar lambda-line-mode nil "\
Non-nil if Lambda-Line mode is enabled.
See the `lambda-line-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `lambda-line-mode'.")

(custom-autoload 'lambda-line-mode "lambda-line" nil)

(autoload 'lambda-line-mode "lambda-line" "\
Toggle lambda-line on or off.

This is a minor mode.  If called interactively, toggle the
`Lambda-Line mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `(default-value \\='lambda-line-mode)'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t nil)

(register-definition-prefixes "lambda-line" '("lambda-line"))

;;;***

(provide 'lambda-line-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; lambda-line-autoloads.el ends here
