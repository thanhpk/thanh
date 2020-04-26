(defun xah-cut-line-or-region ()
	"Cut current line, or text selection."
	(interactive)
	(if current-prefix-arg
			(progn ; not using kill-region because we don't want to include previous kill
				(kill-new (buffer-string))
				(delete-region (point-min) (point-max)))
		(progn (if (use-region-p)
							 (kill-region (region-beginning) (region-end) t)
						 (kill-region (line-beginning-position) (line-beginning-position 2))))))

(defun xah-copy-line-or-region ()
	"Copy current line, or text selection."
	(interactive)
	(if current-prefix-arg
			(progn
				(kill-ring-save (point-min) (point-max))
				(message "All visible buffer text copied"))
		(if (use-region-p)
				(progn
					(kill-ring-save (region-beginning) (region-end))
					(message "Active region copied"))
			(if (eq last-command this-command)
					(if (eobp)
							(progn (message "empty line at end of buffer." ))
						(progn
							(kill-append "\n" nil)
							(kill-append
							 (buffer-substring-no-properties (line-beginning-position) (line-end-position))
							 nil)
							(message "Line copy appended")
							(progn
								(end-of-line)
								(forward-char))))
				(if (eobp)
						(if (eq (char-before) 10 )
								(progn (message "empty line at end of buffer." ))
							(progn
								(kill-ring-save (line-beginning-position) (line-end-position))
								(end-of-line)
								(message "line copied")))
					(progn
						(kill-ring-save (line-beginning-position) (line-end-position))
						(end-of-line)
						(forward-char)
						(message "line copied")))))))

(defun copy-line (arg)
	"Copy lines (as many as prefix argument) in the kill ring."
	(interactive "p")
	(let ((beg (line-beginning-position))
				(end (line-end-position arg)))
		(when mark-active
			(if (> (point) (mark))
					(setq beg (save-excursion (goto-char (mark)) (line-beginning-position)))
				(setq end (save-excursion (goto-char (mark)) (line-end-position)))))
		(if (eq last-command 'copy-line)
				(kill-append (buffer-substring beg end) (< end beg))
			(kill-ring-save beg end)))
	(kill-append "\n" nil)
	(beginning-of-line (or (and arg (1+ arg)) 2))
	(if (and arg (not (= 1 arg))) (message "%d lines copied" arg)))

(defun xah-select-current-line ()
	"Select current line."
	(interactive)
	(end-of-line)
	(set-mark (line-beginning-position)))

(defun xah-select-line ()
	"Select current line. If region is active, extend selection downward by line."
	(interactive)
	(if (region-active-p)
			(progn
				(forward-line 1)
				(end-of-line))
		(xah-select-current-line)))

(defvar xah-brackets nil "String of left/right brackets pairs.")
(setq xah-brackets "()[]{}<>“”‘’''``")

(defvar xah-left-brackets '("(" "{" "[" "<" "“" "‘" ))
(progn
	;; make xah-left-brackets based on xah-brackets
	(setq xah-left-brackets '())
	(dotimes ($x (- (length xah-brackets) 1))
		(when (= (% $x 2) 0)
			(push (char-to-string (elt xah-brackets $x))
						xah-left-brackets)))
	(setq xah-left-brackets (reverse xah-left-brackets)))

(defvar xah-right-brackets '(")" "]" "}" ">" "”" "’"))
(progn
	(setq xah-right-brackets '())
	(dotimes ($x (- (length xah-brackets) 1))
		(when (= (% $x 2) 1)
			(push (char-to-string (elt xah-brackets $x))
						xah-right-brackets)))
	(setq xah-right-brackets (reverse xah-right-brackets)))

(defun xah-goto-matching-bracket ()
	"Move cursor to the matching bracket."
	(interactive)
	(if (nth 3 (syntax-ppss))
			(backward-up-list 1 'ESCAPE-STRINGS 'NO-SYNTAX-CROSSING)
		(cond
		 ((eq (char-after) ?\") (forward-sexp))
		 ((eq (char-before) ?\") (backward-sexp ))
		 ((looking-at (regexp-opt xah-left-brackets))
			(forward-sexp))
		 ((looking-back (regexp-opt xah-right-brackets) (max (- (point) 1) 1))
			(backward-sexp))
		 (t (backward-up-list 1 'ESCAPE-STRINGS 'NO-SYNTAX-CROSSING)))))

(defun scroll-up-line-3 ()
	"Upcase the last letter of the word at point."
	(interactive)
	(scroll-up-line)
	(scroll-up-line)
	(scroll-up-line)
	(scroll-up-line)
	(scroll-up-line)
	(scroll-up-line))

(defun scroll-down-line-3 ()
	"Upcase the last letter of the word at point."
	(interactive)
	(scroll-down-line)
	(scroll-down-line)
	(scroll-down-line)
	(scroll-down-line)
	(scroll-down-line)
	(scroll-down-line))

(defun mark-whole-word ()
	"Select current word."
	(interactive)
	(backward-word)
	(mark-word))

(defun switch-to-previous-buffer ()
	"Switch to previously open buffer.Repeated invocations toggle between the two most recently open buffers."
	(interactive)
	(switch-to-buffer (other-buffer (current-buffer) 1)))

(provide 'xah)
