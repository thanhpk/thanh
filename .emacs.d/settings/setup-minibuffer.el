(let ((map minibuffer-local-map))
	(define-key map [next]        'next-history-element)
	(define-key map [down]        'next-history-element)
	(define-key map [XF86Forward] 'next-history-element)
	(define-key map [prior]       'previous-history-element)
	(define-key map [up]          'previous-history-element)
	(define-key map [XF86Back]    'previous-history-element)
	;; Override the global binding (which calls indent-relative via
	;; indent-for-tab-command).  The alignment that indent-relative tries to
	;; do doesn't make much sense here since the prompt messes it up.
	(define-key map "\t"          'self-insert-command)
	(define-key map [C-tab]       'file-cache-minibuffer-complete)
	(define-key map "\M-s"        'isearch-repeat-forward))

;;; bigger minibuffer text
(defun tmtxt/make-minibuffer-text-bigger ()
	"Make minibuffer text bigger."
	(set (make-local-variable 'face-remapping-alist)
			 '((default :height 1.75)))
	(setq line-spacing 0.2))
(add-hook 'minibuffer-setup-hook 'tmtxt/make-minibuffer-text-bigger)

(provide 'setup-minibuffer)
