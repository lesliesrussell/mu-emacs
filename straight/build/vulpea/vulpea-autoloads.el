;;; vulpea-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:


;;;### (autoloads nil "vulpea" "vulpea.el" (0 0 0 0))
;;; Generated autoloads from vulpea.el

(autoload 'vulpea-find "vulpea" "\
Select and find a note.

If OTHER-WINDOW, visit the NOTE in another window.

CANDIDATES-FN is the function to query candidates for selection,
which takes as its argument a filtering function (see FILTER-FN).
Unless specified, `vulpea-find-default-candidates-source' is
used.

FILTER-FN is the function to apply on the candidates, which takes
as its argument a `vulpea-note'. Unless specified,
`vulpea-find-default-filter' is used.

When REQUIRE-MATCH is nil user may select a non-existent note and
start the capture process.

\(fn &key OTHER-WINDOW FILTER-FN CANDIDATES-FN REQUIRE-MATCH)" t nil)

(autoload 'vulpea-find-backlink "vulpea" "\
Select and find a note linked to current note." t nil)

(autoload 'vulpea-insert "vulpea" "\
Select a note and insert a link to it.

Allows capturing new notes. After link is inserted,
`vulpea-insert-handle-functions' are called with the inserted
note as the only argument regardless involvement of capture
process.

FILTER-FN is the function to apply on the candidates, which takes
as its argument a `vulpea-note'. Unless specified,
`vulpea-insert-default-filter' is used.

\(fn &optional FILTER-FN)" t nil)

(register-definition-prefixes "vulpea" '("vulpea-"))

;;;***

;;;### (autoloads nil "vulpea-buffer" "vulpea-buffer.el" (0 0 0 0))
;;; Generated autoloads from vulpea-buffer.el

(register-definition-prefixes "vulpea-buffer" '("vulpea-buffer-"))

;;;***

;;;### (autoloads nil "vulpea-db" "vulpea-db.el" (0 0 0 0))
;;; Generated autoloads from vulpea-db.el

(defvar vulpea-db-autosync-mode nil "\
Non-nil if Vulpea-Db-Autosync mode is enabled.
See the `vulpea-db-autosync-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `vulpea-db-autosync-mode'.")

(custom-autoload 'vulpea-db-autosync-mode "vulpea-db" nil)

(autoload 'vulpea-db-autosync-mode "vulpea-db" "\
Global minor mode to automatically synchronise vulpea db.

This is a minor mode.  If called interactively, toggle the
`Vulpea-Db-Autosync mode' mode.  If the prefix argument is
positive, enable the mode, and if it is zero or negative, disable
the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `(default-value \\='vulpea-db-autosync-mode)'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t nil)

(autoload 'vulpea-db-autosync-enable "vulpea-db" "\
Activate function `vulpea-db-autosync-mode'." nil nil)

(register-definition-prefixes "vulpea-db" '("vulpea-db-"))

;;;***

;;;### (autoloads nil "vulpea-meta" "vulpea-meta.el" (0 0 0 0))
;;; Generated autoloads from vulpea-meta.el

(register-definition-prefixes "vulpea-meta" '("vulpea-meta"))

;;;***

;;;### (autoloads nil "vulpea-note" "vulpea-note.el" (0 0 0 0))
;;; Generated autoloads from vulpea-note.el

(register-definition-prefixes "vulpea-note" '("vulpea-note-meta-get"))

;;;***

;;;### (autoloads nil "vulpea-select" "vulpea-select.el" (0 0 0 0))
;;; Generated autoloads from vulpea-select.el

(register-definition-prefixes "vulpea-select" '("vulpea-select-"))

;;;***

;;;### (autoloads nil "vulpea-utils" "vulpea-utils.el" (0 0 0 0))
;;; Generated autoloads from vulpea-utils.el

(register-definition-prefixes "vulpea-utils" '("vulpea-utils-"))

;;;***

(provide 'vulpea-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; vulpea-autoloads.el ends here
