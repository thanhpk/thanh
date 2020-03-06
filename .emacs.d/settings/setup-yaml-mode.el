;; YML YAML mode
(add-hook
 'yaml-mode-hook
 (lambda ()
	 (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

(provide 'setup-yaml-mode)
