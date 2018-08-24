;;; package --- Summary
;;; Commentary:
;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
	 [default default default italic underline success warning error])
 '(ansi-color-names-vector
	 ["#dddddd" "#222222" "#555555" "#000000" "#000000" "#222222" "#000000" "#000000"])
 '(blink-cursor-blinks 10000)
 '(blink-cursor-delay 0.1)
 '(blink-cursor-interval 0.1)
 '(blink-cursor-mode nil)
 '(c-basic-offset 2)
 '(column-number-mode t)
 '(compilation-message-face (quote default))
 '(custom-enabled-themes (quote (leuven)))
 '(fci-rule-color "#efefef")
 '(fill-nobreak-invisible nil)
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(flycheck-go-build-install-deps nil)
 '(font-lock-global-modes (quote (not speedbar-mode)))
 '(font-use-system-font t)
 '(fringe-mode 0 nil (fringe))
 '(global-linum-mode t)
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
	 (quote
		(("#3C3D37" . 0)
		 ("#679A01" . 20)
		 ("#4BBEAE" . 30)
		 ("#1DB4D0" . 50)
		 ("#9A8F21" . 60)
		 ("#A75B00" . 70)
		 ("#F309DF" . 85)
		 ("#3C3D37" . 100))))
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
 '(nrepl-message-colors
	 (quote
		("#032f62" "#6a737d" "#d73a49" "#6a737d" "#005cc5" "#6f42c1" "#d73a49" "#6a737d")))
 '(package-selected-packages
	 (quote
		(flycheck ido-vertical-mode pug-mode go-imports direx dired+ color-theme-sanityinc-tomorrow java-imports java-snippets javadoc-lookup javap-mode yaml-mode persistent-scratch scratches dockerfile-mode python-docstring govet hydandata-light-theme material-theme delight dired-icon diminish gitignore-mode toml-mode json-mode go go-add-tags go-direx go-dlv go-snippets go-stacktracer typescript-mode highlight-tail mode-icons python-mode pyvenv auto-dim-other-buffers ob-go rainbow-delimiters jump-char avy cql-mode go-guru golint nginx-mode go-complete dired-rainbow rainbow-mode web-mode go-impl go-errcheck magit ## ac-js2 list-packages-ext helm-projectile tide markdown-mode go-mode)))
 '(pdf-view-midnight-colors (quote ("#6a737d" . "#fffbdd")))
 '(pos-tip-background-color "#FFFACE")
 '(pos-tip-foreground-color "#272822")
 '(projectile-global-mode t)
 '(py-indent-offset 2)
 '(py-indent-tabs-mode t)
 '(py-smart-indentation t)
 '(scala-indent:step 2)
 '(scroll-bar-mode nil)
 '(semantic-stickyfunc-indent-string "")
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
 '(vc-annotate-color-map
	 (quote
		((20 . "#F92672")
		 (40 . "#CF4F1F")
		 (60 . "#C26C0F")
		 (80 . "#E6DB74")
		 (100 . "#AB8C00")
		 (120 . "#A18F00")
		 (140 . "#989200")
		 (160 . "#8E9500")
		 (180 . "#A6E22E")
		 (200 . "#729A1E")
		 (220 . "#609C3C")
		 (240 . "#4E9D5B")
		 (260 . "#3C9F79")
		 (280 . "#A1EFE4")
		 (300 . "#299BA6")
		 (320 . "#2896B5")
		 (340 . "#2790C3")
		 (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(window-divider-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#FFFFFF" :foreground "#333333" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 109 :width normal :foundry "APPL" :family "Monaco"))))
 '(dired-directory ((t (:inherit font-lock-function-name-face :foreground "blue"))))
 '(flycheck-error ((t (:underline (:color "red" :style wave)))))
 '(font-lock-comment-face ((t nil)))
 '(font-lock-constant-face ((t nil)))
 '(font-lock-function-name-face ((t nil)))
 '(font-lock-keyword-face ((t nil)))
 '(font-lock-string-face ((t nil)))
 '(font-lock-type-face ((t nil))))

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))

;; (add-to-list 'load-path "~/elisp")

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

;; (projectile-mode t)

(defalias 'list-buffers 'ibuffer) ; make ibuffer default

;; install js2-mode
(add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))
(add-hook 'js2-mode-hook 'ac-js2-mode)
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))
(setq js2-strict-missing-semi-warning nil)
(setq js2-missing-semi-one-line-override nil)

(defun scroll-up-line-3 ()
  "Upcase the last letter of the word at point."
  (interactive)
  (scroll-up-line)
  (scroll-up-line)
	(scroll-up-line))

(defun scroll-down-line-3 ()
  "Upcase the last letter of the word at point."
  (interactive)
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

(add-hook 'dired-mode-hook
					(lambda ()
						(define-key dired-mode-map (kbd "^")
							(lambda () (interactive) (find-alternate-file "..")))))

;; YML YAML mode
(add-hook 'yaml-mode-hook
					(lambda ()
						(define-key yaml-mode-map "\C-m" 'newline-and-indent)))

(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

(show-paren-mode 1)

;; (windmove-default-keybindings 'meta)

;;(global-set-key (kbd "DEL") 'backward-delete-char)

(require 'json)
(require 'flycheck)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;(require 'key-chord)
;;(setq key-chord-two-keys-delay 0.15)
;;(setq key-chord-one-key-delay 0.2)

(defun switch-to-previous-buffer ()
  "Switch to previously open buffer.Repeated invocations toggle between the two most recently open buffers."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

;;(key-chord-define-global "JJ" 'winner-undo)
;;(key-chord-define-global "SS" 'isearch-forward)
;;(key-chord-define-global "RR" 'query-replace)
;;(key-chord-define-global "OO" 'occur)
;;(key-chord-define-global "HH" 'linum-mode)
;;(key-chord-mode +1)

(let ((map minibuffer-local-map))
  (define-key map [next]  'next-history-element)
  (define-key map [down]  'next-history-element)
  (define-key map [XF86Forward] 'next-history-element)
  (define-key map [prior] 'previous-history-element)
  (define-key map [up]    'previous-history-element)
  (define-key map [XF86Back] 'previous-history-element)
  ;; Override the global binding (which calls indent-relative via
  ;; indent-for-tab-command).  The alignment that indent-relative tries to
  ;; do doesn't make much sense here since the prompt messes it up.
  (define-key map "\t"    'self-insert-command)
  (define-key map [C-tab] 'file-cache-minibuffer-complete)
	(define-key map "\M-s" 'isearch-repeat-forward)
	;;	(define-key map "\M-s" 'abort-recursive-edit)
	;;		(define-key map "\M-q" 'abort-recursive-edit))
	)

;;(define-key key-translation-map "\s-q" (kbd "\C-g"))
;; (define-key key-translation-map "\M-," (kbd "<RET>"))
(define-key isearch-mode-map (kbd "M-s") 'isearch-repeat-forward)
(define-key isearch-mode-map (kbd "M-r") 'isearch-repeat-backward)
;; (define-key isearch-mode-map (kbd "s-q") 'isearch-cancel)
(global-set-key (kbd "M-a") 'avy-goto-word-1-above)
(global-set-key (kbd "M-e") 'avy-goto-word-1-below)


(defun xah-cut-line-or-region ()
  "Cut current line, or text selection.
When `universal-argument' is called first, cut whole buffer (respects `narrow-to-region').

URL `http://ergoemacs.org/emacs/emacs_copy_cut_current_line.html'
Version 2015-06-10"
  (interactive)
  (if current-prefix-arg
      (progn ; not using kill-region because we don't want to include previous kill
        (kill-new (buffer-string))
        (delete-region (point-min) (point-max)))
    (progn (if (use-region-p)
               (kill-region (region-beginning) (region-end) t)
             (kill-region (line-beginning-position) (line-beginning-position 2))))))

(defun xah-copy-line-or-region ()
  "Copy current line, or text selection.
When called repeatedly, append copy subsequent lines.
When `universal-argument' is called first, copy whole buffer (respects `narrow-to-region').

URL `http://ergoemacs.org/emacs/emacs_copy_cut_current_line.html'
Version 2017-07-08"
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
	"Copy lines (as many as prefix argument) in the kill ring.
      Ease of use features:
      - Move to start of next line.
      - Appends the copy on sequential calls.
      - Use newline as last char even on the last line of the buffer.
      - If region is active, copy its lines."
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


;;(Global-set-key (kbd "C-t") 'select-frame-by-name)
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

(global-set-key (kbd "M-J") 'scroll-up-line-3)
(global-set-key (kbd "M-K") 'scroll-down-line-3)
(global-set-key (kbd "M-H") 'backward-word)
(global-set-key (kbd "M-L") 'forward-word)

;;  (global-set-key (kbd "M-,") 'newline)
;; (global-set-key (kbd "M-S-h") 'windmove-left)
;; (global-set-key (kbd "M-S-l") 'windmove-right)
;; (global-set-key (kbd "M-S-k") 'windmove-up)
;; (global-set-key (kbd "M-S-j") 'windmove-down)

(global-set-key (kbd "M-0") 'delete-window) ; close current pane

(global-set-key (kbd "M-p") 'switch-to-buffer)
(global-set-key (kbd "M-P") 'switch-to-buffer-other-window)
;;(global-set-key (kbd "C-;") 'switch-to-buffer)
(global-set-key (kbd "M-r") 'isearch-backward)
(global-set-key (kbd "M-s") 'isearch-forward)

(global-set-key (kbd "M-;") 'move-end-of-line)
;(global-set-key (kbd "s-m") 'move-beginning-of-line)


(global-set-key (kbd "C-k") 'xah-cut-line-or-region)
(global-set-key (kbd "C-o") 'ido-find-file)
;;(global-set-key (kbd "s-SPC") 'set-mark-command)
(global-set-key (kbd "M-w") 'xah-copy-line-or-region)
;;(define-key key-translation-map "\s-q" (kbd "\C-g"))
(global-set-key (kbd "C-k") 'xah-cut-line-or-region)
;;(global-set-key (kbd "s-v") 'yank)
;;(global-set-key (kbd "s-p") 'yank-pop)
;;(global-set-key (kbd "s-j") 'electric-newline-and-maybe-indent)
;;(global-set-key (kbd "s-h") 'backward-delete-char-untabify)
(global-set-key (kbd "M-I") 'other-window)
(global-set-key (kbd "M-U") 'other-frame)
;;(global-set-key (kbd "s-/") 'undo)
;;global-set-key
;;(define-key key-translation-map "\s-q" (kbd "\C-g"))
(define-key key-translation-map "\M-j" (kbd "<down>"))
(define-key key-translation-map "\M-k" (kbd "<up>"))
(define-key key-translation-map "\M-h" (kbd "<left>"))
(define-key key-translation-map "\M-l" (kbd "<right>"))

(define-key isearch-mode-map (kbd "M-s") 'isearch-repeat-forward)
(define-key isearch-mode-map (kbd "<escape> l") 'linum-mode)
(define-key isearch-mode-map (kbd "M-r") 'isearch-repeat-backward)
;;(define-key isearch-mode-map (kbd "s-q") 'isearch-cancel)
(global-set-key (kbd "M-a") 'avy-goto-word-1-above)
(global-set-key (kbd "M-e") 'avy-goto-word-1-below)
(global-set-key (kbd "M-v") 'switch-to-previous-buffer)

(global-set-key (kbd "M-q") 'backward-kill-word)
(global-set-key (kbd "C-b") nil)
(global-set-key (kbd "C-a") nil)
(global-set-key (kbd "C-w") nil)
;;(global-set-key (kbd "C-e") nil)
;; (global-set-key (kbd "C-SPC") 'set-mark-command)

;;(electric-pair-mode 1)

(defun xah-select-current-line ()
  "Select current line.
URL `http://ergoemacs.org/emacs/modernization_mark-word.html'
Version 2016-07-22"
  (interactive)
  (end-of-line)
  (set-mark (line-beginning-position)))

(defun xah-select-line ()
  "Select current line. If region is active, extend selection downward by line.
URL `http://ergoemacs.org/emacs/modernization_mark-word.html'
Version 2016-07-22"
  (interactive)
  (if (region-active-p)
      (progn
        (forward-line 1)
        (end-of-line))
    (xah-select-current-line)))


(defvar xah-brackets nil "string of left/right brackets pairs.")
(setq xah-brackets "()[]{}<>（）［］｛｝⦅⦆〚〛⦃⦄“”‘’‹›«»「」〈〉《》【】〔〕⦗⦘『』〖〗〘〙｢｣⟦⟧⟨⟩⟪⟫⟮⟯⟬⟭⌈⌉⌊⌋⦇⦈⦉⦊❛❜❝❞❨❩❪❫❴❵❬❭❮❯❰❱❲❳〈〉⦑⦒⧼⧽﹙﹚﹛﹜﹝﹞⁽⁾₍₎⦋⦌⦍⦎⦏⦐⁅⁆⸢⸣⸤⸥⟅⟆⦓⦔⦕⦖⸦⸧⸨⸩｟｠⧘⧙⧚⧛⸜⸝⸌⸍⸂⸃⸄⸅⸉⸊᚛᚜༺༻༼༽⏜⏝⎴⎵⏞⏟⏠⏡﹁﹂﹃﹄︹︺︻︼︗︘︿﹀︽︾﹇﹈︷︸")

(defvar xah-left-brackets '("(" "{" "[" "<" "〔" "【" "〖" "〈" "《" "「" "『" "“" "‘" "‹" "«" )
  "List of left bracket chars.")
(progn
;; make xah-left-brackets based on xah-brackets
  (setq xah-left-brackets '())
  (dotimes ($x (- (length xah-brackets) 1))
    (when (= (% $x 2) 0)
      (push (char-to-string (elt xah-brackets $x))
            xah-left-brackets)))
  (setq xah-left-brackets (reverse xah-left-brackets)))

(defvar xah-right-brackets '(")" "]" "}" ">" "〕" "】" "〗" "〉" "》" "」" "』" "”" "’" "›" "»")
  "list of right bracket chars.")
(progn
  (setq xah-right-brackets '())
  (dotimes ($x (- (length xah-brackets) 1))
    (when (= (% $x 2) 1)
      (push (char-to-string (elt xah-brackets $x))
            xah-right-brackets)))
  (setq xah-right-brackets (reverse xah-right-brackets)))

(defun xah-goto-matching-bracket ()
  "Move cursor to the matching bracket.
If cursor is not on a bracket, call `backward-up-list'.
The list of brackets to jump to is defined by `xah-left-brackets' and `xah-right-brackets'.
URL `http://ergoemacs.org/emacs/emacs_navigating_keys_for_brackets.html'
Version 2016-11-22"
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

(global-set-key (kbd "M-n") 'xah-goto-matching-bracket)

;;; bigger minibuffer text
(defun tmtxt/make-minibuffer-text-bigger ()
  "Make minibuffer text bigger"
  (set (make-local-variable 'face-remapping-alist)
       '((default :height 1.3)))
  (setq line-spacing 0.2))
(add-hook 'minibuffer-setup-hook 'tmtxt/make-minibuffer-text-bigger)

(require 'delight)
(delight '((abbrev-mode " Abv" abbrev)
           (smart-tab-mode " \\t" smart-tab)
           (eldoc-mode nil "eldoc")
           (rainbow-mode)
           (overwrite-mode " Ov" t)
				 	;(go-mode "G" :major)
				  	(projectile-mode "❡" projectile)
				  	(flycheck-mode  "🐛"  flycheck)
           (emacs-lisp-mode "Elisp" :major)))

;;; ᚻ ᛜ ᛃ
;;(global-set-key (kbd "C-p") 'helm-projectile)
(global-set-key (kbd "M-f") 'dired-jump)
(global-set-key (kbd "C-b") 'ido-kill-buffer)
(global-set-key (kbd "C-a") 'save-buffer)
(global-set-key (kbd "C-l") 'goto-line)
(global-set-key (kbd "C-d") nil)
;;(global-DieIf-key  (kbd "C-n") 'goto-line)
;;(global-set-key (kbd "M-p") 'goto-line)
;;(global-set-key (kbd "C-f") nil)
;;(global-set-key (kdb "C-i")
;;; .emacs ends here
