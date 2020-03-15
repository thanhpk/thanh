(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
	 [default default default italic underline success warning error])
 '(ansi-color-names-vector
	 ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(c-basic-offset 2)
 '(column-number-mode t)
 '(compilation-message-face (quote default))
 '(css-indent-offset 2)
 '(custom-enabled-themes (quote (leuven)))
 '(display-hourglass t)
 '(fci-rule-color "#efefef")
 '(fill-nobreak-invisible nil)
 '(fish-indent-offset 2)
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(flycheck-go-build-install-deps nil)
 '(flycheck-typescript-tslint-config "~/.tslint.json")
 '(font-use-system-font t)
 '(fringe-mode 0 nil (fringe))
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(ido-use-filename-at-point nil)
 '(indent-tabs-mode t)
 '(js-indent-level 2)
 '(js2-strict-trailing-comma-warning nil)
 '(magit-diff-use-overlays nil)
 '(menu-bar-mode nil)
 '(message-default-charset (quote iso-8859-1))
 '(nginx-indent-level 2)
 '(nginx-indent-tabs-mode t)
 '(package-selected-packages
	 (quote
		(js2-mode avy markdown-mode yaml-mode go-mode json-mode protobuf-mode prettier-js flycheck ido-vertical-mode pug-mode direx dired+ persistent-scratch scratches python-docstring dired-icon diminish gitignore-mode toml-mode go go-add-tags go-direx go-dlv go-snippets go-stacktracer mode-icons python-mode pyvenv auto-dim-other-buffers ob-go jump-char cql-mode nginx-mode go-complete dired-rainbow rainbow-mode go-impl go-errcheck magit ## list-packages-ext helm-projectile)))
 '(pdf-view-midnight-colors (quote ("#6a737d" . "#fffbdd")))
 '(pos-tip-background-color "#FFFACE")
 '(pos-tip-foreground-color "#272822")
 '(prettier-js-command "prettier-eslint")
 '(projectile-global-mode t)
 '(py-indent-offset 2)
 '(py-indent-tabs-mode t)
 '(py-smart-indentation t)
 '(python-indent-offset 2)
 '(safe-local-variable-values
	 (quote
		((eval font-lock-add-keywords nil
					 (quote
						(("defexamples\\|def-example-group\\| => "
							(0
							 (quote font-lock-keyword-face)))
						 ("(defexamples[[:blank:]]+\\(.*\\)"
							(1
							 (quote font-lock-function-name-face))))))
		 (eval font-lock-add-keywords nil
					 (quote
						(("defexamples\\|def-example-group\\| => "
							(0
							 (quote font-lock-keyword-face))))))
		 (eval when
					 (and
						(buffer-file-name)
						(file-regular-p
						 (buffer-file-name))
						(string-match-p "^[^.]"
														(buffer-file-name)))
					 (emacs-lisp-mode))
		 (eval font-lock-add-keywords nil
					 (quote
						(("defexamples\\| => "
							(0
							 (quote font-lock-keyword-face))))))
		 (encoding . utf-8))))
 '(scala-indent:step 2)
 '(scroll-bar-mode nil)
 '(semantic-stickyfunc-indent-string "")
 '(sh-basic-offset 2)
 '(sml/active-background-color "#34495e")
 '(sml/active-foreground-color "#ecf0f1")
 '(sml/inactive-background-color "#dfe4ea")
 '(sml/inactive-foreground-color "#34495e")
 '(standard-indent 2)
 '(tab-stop-list (quote (2 4 6 8)))
 '(tab-width 2)
 '(tool-bar-mode nil)
 '(typescript-indent-level 2)
 '(vc-annotate-background nil)
 '(visible-cursor t)
 '(window-divider-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:slant normal :weight normal :height 115 :width normal :foundry "SAJA" :family "Cascadia Mono")))))
