;;; package --- Summary
;;; Commentary:
;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-blinks 100000)
 '(blink-cursor-delay 0.001)
 '(blink-cursor-interval 0.1)
 '(blink-cursor-mode t)
 '(c-basic-offset 2)
 '(column-number-mode t)
 '(compilation-message-face (quote default))
 '(css-indent-offset 2)
 '(custom-enabled-themes (quote (simple)))
 '(custom-safe-themes
	 (quote
		("0e456b63cdd54d0144d8586864ec93f89e4f7bfb4c17e1f00739c7edd1f2d8dd" "0e1d55814d2985615cb314418c464962e7e7028fe71d29fc14556377e010f4bb" "bb19e479f002571e936aa7ed6bc73b03267f884c64f9673e5d00db1e7328e578" "8d8af8ae9b2f9634dd88604893a984107235bf9faf7e8d0d8e954a2bc1ade916" "80a3be9b00940f3509e90767b4f337356adb0685f837a8e9a6ab4b89e8bec06a" "6dd274f89807928fbc6030b0517b42dcf344119fadadc4b0e0b35ba31be036b0" "90d3b6a715032856fd7e59b7a1e097cd1d6ea5f081550b87ccdd0e3a94c3f260" "c24e4a9b8cccae14a81211ac34b1694949c8b7395c7b800ec9adfcd13c5e8038" "53bd4739853d80ab06722fa78f5084c3f815a4c230d01789ae7454275442588f" "95fbbe042f246518daca20a264d673dfe6874a2e9149181bff13b1924ad12d4f" "c186214f0d24e58c7a17861a165a1c0c08a228053747c9ccae5977f97452d324" default)))
 '(display-hourglass t)
 '(fci-rule-color "#efefef")
 '(fill-nobreak-invisible nil)
 '(fish-indent-offset 2)
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(flycheck-go-build-install-deps nil)
 '(flycheck-typescript-tslint-config "~/.tslint.json")
 '(font-use-system-font t)
 '(fringe-mode 0 nil (fringe))
 '(global-linum-mode t)
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(ido-vertical-show-count t)
 '(indent-tabs-mode t)
 '(js-indent-level 2)
 '(js2-strict-trailing-comma-warning nil)
 '(linum-eager t)
 '(linum-format (quote dynamic))
 '(magit-diff-use-overlays nil)
 '(menu-bar-mode nil)
 '(message-default-charset (quote iso-8859-1))
 '(nginx-indent-level 2)
 '(nginx-indent-tabs-mode t)
 '(package-selected-packages
	 (quote
		(xah-css-mode ag json-mode markdown-mode+ protobuf-mode prettier-js fish-mode flycheck ido-vertical-mode pug-mode go-imports direx dired+ yaml-mode persistent-scratch scratches dockerfile-mode python-docstring dired-icon diminish gitignore-mode toml-mode go go-add-tags go-direx go-dlv go-snippets go-stacktracer typescript-mode mode-icons python-mode pyvenv auto-dim-other-buffers ob-go jump-char avy cql-mode go-guru nginx-mode go-complete dired-rainbow rainbow-mode web-mode go-impl go-errcheck magit ## list-packages-ext helm-projectile tide markdown-mode go-mode)))
 '(pdf-view-midnight-colors (quote ("#6a737d" . "#fffbdd")))
 '(pos-tip-background-color "#FFFACE")
 '(pos-tip-foreground-color "#272822")
 '(prettier-js-command "prettier-eslint")
 '(projectile-global-mode t)
 '(py-indent-offset 2)
 '(py-indent-tabs-mode t)
 '(py-smart-indentation t)
 '(python-indent-offset 2)
 '(scala-indent:step 2)
 '(scroll-bar-mode nil)
 '(semantic-stickyfunc-indent-string "")
 '(sh-basic-offset 2)
 '(show-paren-mode t)
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

(require 'package)

(add-to-list
 'package-archives
 '("melpa" . "http://melpa.org/packages/")
 t)

(package-initialize)

(add-hook 'after-init-hook #'global-flycheck-mode)

;; create backup file in tmp directory instead of current directory
(setq backup-directory-alist '(("." . "~/tmp"))
			backup-by-copying t    ; Don't delink hardlinks
			version-control t      ; Use version numbers on backups
			delete-old-versions t  ; Automatically delete excess backups
			kept-new-versions 20   ; how many of the newest versions to keep
			kept-old-versions 5)   ; and how many of the old

(require 'ido)
(ido-mode t)
(ido-vertical-mode t)
(setq ido-decorations (quote ("\n🡒 " "" "\n   " "\n   ..." "" "..." " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
(defun ido-disable-line-truncation ()
	(set (make-local-variable 'truncate-lines) nil))
(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-truncation)
;; C-n/p is more intuitive in vertical layout
(defun ido-define-keys ()
	(define-key ido-completion-map (kbd "M-n") 'ido-next-match)
	(define-key ido-completion-map (kbd "M-p") 'ido-prev-match))
(add-hook 'ido-setup-hook 'ido-define-keys)
;; display any item that contains the chars you typed
(setq ido-enable-flex-matching t)

(defalias 'list-buffers 'ibuffer) ; make ibuffer default

(defun scroll-up-line-3 ()
	"Upcase the last letter of the word at point."
	(interactive)
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
	(scroll-down-line))

(defun move-to-next-line ()
	"Move to next line."
	(interactive)
	(move-end-of-line 1)
	(open-line 1)
	(forward-line)
	(indent-for-tab-command))

(defun move-to-prev-line ()
	"Move to next line."
	(interactive)
	(move-beginning-of-line 1)
	(open-line 1)
	(indent-for-tab-command))

(defun mark-whole-word ()
	"Select current word."
	(interactive)
	(backward-word)
	(mark-word))

(put 'dired-find-alternate-file 'disabled nil)

(add-hook
 'dired-mode-hook
 (lambda ()
	 (define-key dired-mode-map (kbd "^")
		 (lambda () (interactive) (find-alternate-file "..")))))

;; YML YAML mode
(add-hook
 'yaml-mode-hook
 (lambda ()
	 (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

(show-paren-mode 1)

(require 'flycheck)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(defun switch-to-previous-buffer ()
	"Switch to previously open buffer.Repeated invocations toggle between the two most recently open buffers."
	(interactive)
	(switch-to-buffer (other-buffer (current-buffer) 1)))

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

;; (define-key key-translation-map "\s-q" (kbd "\C-g"))
;; (define-key key-translation-map "\M-," (kbd "<RET>"))
(define-key isearch-mode-map (kbd "M-s") 'isearch-repeat-forward)
(define-key isearch-mode-map (kbd "M-r") 'isearch-repeat-backward)
;; (define-key isearch-mode-map (kbd "s-q") 'isearch-cancel)

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

;;; bigger minibuffer text
(defun tmtxt/make-minibuffer-text-bigger ()
	"Make minibuffer text bigger."
	(set (make-local-variable 'face-remapping-alist)
			 '((default :height 1.75)))
	(setq line-spacing 0.2))
(add-hook 'minibuffer-setup-hook 'tmtxt/make-minibuffer-text-bigger)

(eval-after-load 'web-mode
	'(define-key web-mode-map (kbd "M-;") 'move-end-of-line))

(setq web-mode-enable-current-element-highlight t)

(eval-after-load 'web-mode
	'(define-key web-mode-map (kbd "M-n") 'web-mode-navigate))

;;(Global-set-key (kbd "C-t") 'select-frame-by-name)
(global-set-key (kbd "M-a") 'avy-goto-word-1-above)
(global-set-key (kbd "M-e") 'avy-goto-word-1-below)
(global-set-key (kbd "M-n") 'xah-goto-matching-bracket)

(global-set-key (kbd "C-t") 'other-frame)
(global-set-key (kbd "M-o n") 'move-to-next-line)
(global-set-key (kbd "M-o p") 'move-to-prev-line)
(global-set-key (kbd "M-o o") 'occur)
(global-set-key (kbd "M-o r") 'query-replace)
(global-set-key (kbd "M-o k") 'kill-line)
(global-set-key (kbd "M-o h") 'mark-whole-buffer)
(global-set-key (kbd "M-o m") 'rectangle-mark-mode)
(global-set-key (kbd "M-o f") 'dired-jump)
(global-set-key (kbd "M-o j") 'godef-jump-other-window)
(global-set-key (kbd "M-o c") 'delete-window)

(global-set-key (kbd "M-J") 'scroll-up-line-3)
(global-set-key (kbd "M-K") 'scroll-down-line-3)
(global-set-key (kbd "M-H") 'backward-word)
(global-set-key (kbd "M-L") 'forward-word)

(global-set-key (kbd "M-0") 'delete-window) ; close current pane
(global-set-key (kbd "M-p") 'switch-to-buffer)
(global-set-key (kbd "M-P") 'switch-to-buffer-other-window)
(global-set-key (kbd "M-;") 'move-end-of-line)

(global-set-key (kbd "C-k") 'xah-cut-line-or-region)
(global-set-key (kbd "C-o") 'ido-find-file)
(global-set-key (kbd "M-w") 'xah-copy-line-or-region)
(global-set-key (kbd "C-k") 'xah-cut-line-or-region)

(define-key key-translation-map "\M-j" (kbd "<down>"))
(define-key key-translation-map "\M-k" (kbd "<up>"))
(define-key key-translation-map "\M-h" (kbd "<left>"))
(define-key key-translation-map "\M-l" (kbd "<right>"))

;;(define-key isearch-mode-map (kbd "s-q") 'isearch-cancel)
(global-set-key (kbd "M-a") 'avy-goto-word-1-above)
(global-set-key (kbd "M-e") 'avy-goto-word-1-below)
(global-set-key (kbd "M-v") 'switch-to-previous-buffer)
(global-set-key (kbd "M-q") 'backward-kill-word)
(global-set-key (kbd "M-f") 'dired-jump)
(global-set-key (kbd "C-b") 'ido-kill-buffer)
(global-set-key (kbd "C-a") 'save-buffer)
(global-set-key (kbd "M-0") 'back-to-identation)
(global-set-key (kbd "M-g t") 'other-window)
(global-set-key (kbd "M-:") 'goto-line)
(global-set-key (kbd "C-p") 'pop-to-mark-command)
(global-set-key (kbd "M-.") 'dabbrev-expand)
(global-set-key (kbd "C-.") 'undo)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 125 :width normal :family "Latin modern mono"))))
 '(variable-pitch ((t nil))))

;;; .Emacs ends here
