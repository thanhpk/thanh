(require 'package)

;; Add melpa to package repos
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

(setq package-pinned-packages '())

(package-initialize)
(require 'dash)

(unless (file-exists-p "~/.emacs.d/elpa/archives/melpa")
	(package-refresh-contents))

(defun packages-install (packages)
	(--each packages
		(when (not (package-installed-p it))
			(package-install it)))
	(delete-other-windows))

;;; On-demand installation of packages

(defun require-package (package &optional min-version no-refresh)
	"Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
	(if (package-installed-p package min-version)
			t
		(if (or (assoc package package-archive-contents) no-refresh)
				(package-install package)
			(progn
				(package-refresh-contents)
				(require-package package min-version t)))))

;; Install extensions if they're missing
(defun init--install-packages ()
	(packages-install
	 '(
		 dash
		 avy
		 markdown-mode
		 yaml-mode
		 go-mode
		 json-mode
		 protobuf-mode
		 prettier-js
		 flycheck
		 ido-vertical-mode
		 direx
		 dired-icon
		 diminish
		 gitignore-mode
		 toml-mode
		 go
		 go-dlv
		 go-snippets
		 go-stacktracer
		 mode-icons
		 python-mode
		 auto-dim-other-buffers
		 ob-go
		 cql-mode
		 nginx-mode
		 go-complete
		 go-impl
		 go-errcheck
		 magit
		 s
		 smex
		 flx-ido
		 browse-kill-ring
		 )))

(condition-case nil
		(init--install-packages)
	(error
	 (package-refresh-contents)
	 (init--install-packages)))

(provide 'setup-package)
