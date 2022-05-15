(setq org-use-fast-todo-selection t)

(setq dropbox-root "~/Dropbox/org/")
(setq org-default-notes-file (concat dropbox-root "notes.org"))
(setq my-project-file (concat dropbox-root "projects.org"))
(setq my-diary (concat dropbox-root "diary.org"))

(setq org-agenda-files (quote ("~/Dropbox/org/journal.org"
                               "~/Dropbox/org/notes.org"
                               "~/Dropbox/org/projects.org")))

(setq org-capture-templates
      '(("t" "todo" entry (file org-default-notes-file)
	 "* TODO %?\n%u\n%a\n" :clock-in t :clock-resume t)
	("m" "Meeting" entry (file org-default-notes-file)
	 "* MEETING with %? :MEETING:\n%t" :clock-in t :clock-resume t)
	("d" "Diary" entry (file+datetree my-diary)
	 "* %?\n%U\n" :clock-in t :clock-resume t)
	("i" "Idea" entry (file org-default-notes-file)
	 "* %? :IDEA: \n%t" :clock-in t :clock-resume t)
	("n" "Next Task" entry (file+headline org-default-notes-file "Tasks")
	 "** NEXT %? \nDEADLINE: %t")
	("p" "Project" entry (file+headline my-project-file "Project")
	 "* :PROJECT: %? \n" :clock-in t :clock-resume t)))

(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))
