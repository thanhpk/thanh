(require 'misc)
(global-set-key (kbd "s-.") 'copy-from-above-command)

(require 'repeat)
(global-set-key (kbd "H-.") 'repeat)

;; Smart M-x
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Use C-x C-m to do M-x per Steve Yegge's advice
(global-set-key (kbd "C-x C-m") 'smex)

;; Experimental multiple-cursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-S-c C-e") 'mc/edit-ends-of-lines)
(global-set-key (kbd "C-S-c C-a") 'mc/edit-beginnings-of-lines)

;; Extra multiple cursors stuff
(global-set-key (kbd "C-~") 'mc/reverse-regions)
(global-set-key (kbd "M-~") 'mc/sort-regions)
(global-set-key (kbd "H-~") 'mc/insert-numbers)
(global-set-key (kbd "H-0") 'mc/insert-numbers)

;; Use shell-like backspace C-h, rebind help to F1
(define-key key-translation-map [?\C-h] [?\C-?])
(global-set-key (kbd "<f1>") 'help-command)

;; Transpose stuff with M-t
(global-unset-key (kbd "M-t")) ;; which used to be transpose-words
(global-set-key (kbd "M-t l") 'transpose-lines)
(global-set-key (kbd "M-t w") 'transpose-words)
(global-set-key (kbd "M-t s") 'transpose-sexps)
(global-set-key (kbd "M-t p") 'transpose-params)

;; Change next underscore with a camel case
(global-set-key (kbd "C-c C--") 'replace-next-underscore-with-camel)
(global-set-key (kbd "M-s M--") 'snakeify-current-word)

;; Killing text
(global-set-key (kbd "C-S-k") 'kill-and-retry-line)
(global-set-key (kbd "C-w") 'kill-region-or-backward-word)
(global-set-key (kbd "C-c C-w") 'kill-to-beginning-of-line)

(global-set-key (kbd "M-Z") (lambda (char) (interactive "cZap to char: ") (zap-to-char 1 char)))
(global-set-key (kbd "s-Z") (lambda (char) (interactive "cZap to char backwards: ") (zap-to-char -1 char)))

;; Jump to a definition in the current file. (This is awesome)
(global-set-key (kbd "C-x C-i") 'ido-imenu)

;; File finding
(global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)
(global-set-key (kbd "C-x f") 'recentf-ido-find-file)
(global-set-key (kbd "C-x C-p") 'find-or-create-file-at-point)
(global-set-key (kbd "C-x M-p") 'find-or-create-file-at-point-other-window)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "M-`") 'file-cache-minibuffer-complete)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Edit file with sudo
(global-set-key (kbd "M-s e") 'sudo-edit)

;; Copy file path to kill ring
(global-set-key (kbd "C-x M-w") 'copy-current-file-path)

(global-set-key (kbd "C-x 3") 'split-window-right-and-move-there-dammit)

;; Add region to *multifile*
(global-set-key (kbd "C-!") 'mf/mirror-region-in-multifile)

;; Help should search more than just commands
(global-set-key (kbd "<f1> a") 'apropos)

;; Should be able to eval-and-replace anywhere.
(global-set-key (kbd "C-c C-e") 'eval-and-replace)
(global-set-key (kbd "M-s-e") 'eval-and-replace)

;; Webjump let's you quickly search google, wikipedia, emacs wiki
(global-set-key (kbd "C-x g") 'webjump)
(global-set-key (kbd "C-x M-g") 'browse-url-at-point)

;; Completion at point
(global-set-key (kbd "C-<tab>") 'completion-at-point)

;; Like isearch, but adds region (if any) to history and deactivates mark
(global-set-key (kbd "C-s") 'isearch-forward-use-region)
(global-set-key (kbd "C-r") 'isearch-backward-use-region)

;; Like isearch-*-use-region, but doesn't fuck with the active region
(global-set-key (kbd "C-S-s") 'isearch-forward)
(global-set-key (kbd "C-S-r") 'isearch-backward)

;; Convenience on ThinkPad Keyboard: Use back/forward as pg up/down
(global-set-key (kbd "<XF86Back>") 'scroll-down)
(global-set-key (kbd "<XF86Forward>") 'scroll-up)
(global-set-key (kbd "<XF86WakeUp>") 'beginning-of-buffer)

;; Query replace regex key binding
(global-set-key (kbd "M-&") 'query-replace-regexp)

;; Yank selection in isearch
(define-key isearch-mode-map (kbd "C-o") 'isearch-yank-selection)

;; Comment/uncomment block
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c u") 'uncomment-region)

;; Eval buffer
(global-set-key (kbd "C-c C-k") 'eval-buffer)

;; Create scratch buffer
(global-set-key (kbd "C-c b") 'create-scratch-buffer)

;; Magit
(global-set-key (kbd "C-x m") 'magit-status-fullscreen)
(autoload 'magit-status-fullscreen "magit")

;; Duplicate region
(global-set-key (kbd "C-c d") 'duplicate-current-line-or-region)

;; Browse the kill ring
(global-set-key (kbd "C-x C-y") 'browse-kill-ring)

;; Buffer file functions
(global-set-key (kbd "C-x t") 'touch-buffer-file)
(global-set-key (kbd "C-x C-r") 'rename-current-buffer-file)
(global-set-key (kbd "C-x C-k") 'delete-current-buffer-file)

;; Multi-occur
(global-set-key (kbd "M-s m") 'multi-occur)
(global-set-key (kbd "M-s M") 'multi-occur-in-matching-buffers)

;; Find files by name and display results in dired
(global-set-key (kbd "M-s f") 'find-name-dired)

;; Find file in project
(global-set-key (kbd "C-x o") 'find-file-in-project)

;; View occurrence in occur mode
(define-key occur-mode-map (kbd "v") 'occur-mode-display-occurrence)
(define-key occur-mode-map (kbd "n") 'next-line)
(define-key occur-mode-map (kbd "p") 'previous-line)

;;(Global-set-key (kbd "C-t") 'select-frame-by-name)
(global-set-key (kbd "M-a") 'avy-goto-word-1-above)
(global-set-key (kbd "M-e") 'avy-goto-word-1-below)
(global-set-key (kbd "M-n") 'xah-goto-matching-bracket)

(global-set-key (kbd "C-t") 'other-frame)
(global-set-key (kbd "M-o n") 'open-line-below)
(global-set-key (kbd "M-o p") 'open-line-above)
(global-set-key (kbd "M-o o") 'occur)
(global-set-key (kbd "M-o r") 'query-replace)
(global-set-key (kbd "M-o k") 'kill-line)
(global-set-key (kbd "M-o h") 'mark-whole-buffer)
(global-set-key (kbd "M-o m") 'rectangle-mark-mode)
; (global-set-key (kbd "M-o f") 'dired-jump)
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
(autoload 'dired-jump "dired")
(global-set-key (kbd "C-b") 'ido-kill-buffer)
(global-set-key (kbd "C-a") 'save-buffer)
(global-set-key (kbd "M-0") 'back-to-identation)
(global-set-key (kbd "M-g t") 'other-window)
(global-set-key (kbd "M-:") 'goto-line)
(global-set-key (kbd "C-p") 'pop-to-mark-command)
(global-set-key (kbd "M-.") 'dabbrev-expand)
(global-set-key (kbd "C-.") 'undo)

(provide 'key-bindings)
