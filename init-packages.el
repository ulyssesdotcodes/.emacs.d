(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
;;(exec-path-from-shell-initialize)

(eval-when-compile
  (defvar use-package-verbose t)
  (require 'use-package))

(setq-default evil-overriding-maps
              '(
                (magit-mode-map . nil)
                (magit-status-mode-map . nil)
                (magit-svn-status-mode-map . nil)
                (magit-svn-mode-map . nil)
                (magit-reflog-mode-map . nil)
                (magit-log-select-mode-map . nil)
                ; some other magit mode
                ))
(setq-default evil-normal-state-modes
              '(      
                magit-mode
                magit-diff-mode
                magit-status-mode
                magit-log-mode
                magit-reflog-mode
                magit-process-mode))
(setq-default evil-insert-state-modes
              '(
                magit-log-select-mode
                diff-mode
                git-rebase-mode
                magit-popup-mode
                magit-popup-sequence-mode))

;;; then load evil

(use-package evil
  
	     :init
	     (progn
	       (setq evil-want-C-u-scroll t)
	       (setq evil-emacs-state-cursor '("red" box))
	       (setq evil-normal-state-cursor '("green" box))
	       (setq evil-visual-state-cursor '("orange" box))
	       (setq evil-insert-state-cursor '("red" bar))
	       (setq evil-replace-state-cursor '("red" bar))
	       (setq evil-operator-state-cursor '("red" hollow)) 

	       (use-package evil-leader
			    :init (global-evil-leader-mode)
			    :config
			    (progn
			      (evil-leader/set-leader "<SPC>")

			      (evil-leader/set-key
			       "w" 'save-buffer
			       "e" 'find-file
			       "q" 'kill-buffer-and-window
			       "x" 'helm-M-x
			       "l" 'next-buffer
			       "h" 'previous-buffer
			       )))

	       (evil-mode 1))
	       :config
	       (progn
		 
		    (define-key evil-normal-state-map [escape] 'keyboard-quit)
		    (define-key evil-visual-state-map [escape] 'keyboard-quit)
		    (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
		    (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
		    (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
		    (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

		))

(use-package magit)


(with-eval-after-load 'magit
  (define-key magit-mode-map "\s" nil) ;space I use space as my evil-leader key
  (define-key magit-diff-mode-map "\s" nil) ;space
  (define-key magit-diff-mode-map "j" nil)

  (define-key magit-status-mode-map "j" 'next-line) ;may be should evil-next-line
  (define-key magit-mode-map "j" 'next-line)
  (define-key magit-mode-map "k" 'previous-line)
  (define-key magit-file-section-map "K" 'magit-discard)
  (define-key magit-file-section-map "k" nil)
  (define-key magit-hunk-section-map "K" 'magit-discard)
  (define-key magit-hunk-section-map "k" nil)
  (define-key magit-unstaged-section-map "k" nil)
  (define-key magit-unstaged-section-map "K" 'magit-discard)
  (define-key magit-staged-section-map "K" 'magit-discard)
  (define-key magit-staged-section-map "k" nil)
  (define-key magit-stash-section-map "K" 'magit-stash-drop)
  (define-key magit-stash-section-map "k" nil)
  (define-key magit-stashes-section-map "K" 'magit-stash-clear)
  (define-key magit-stashes-section-map "k" nil)

  (define-key magit-untracked-section-map "K" 'magit-discard)
  (define-key magit-untracked-section-map "k" nil)

  (define-key magit-branch-section-map "K" 'magit-branch-delete)
  (define-key magit-branch-section-map "k" nil)

  (define-key magit-remote-section-map "K" 'magit-remote-remove)
  (define-key magit-remote-section-map "k" nil)

  (define-key magit-tag-section-map "k" nil)
  (define-key magit-tag-section-map "K" 'magit-tag-delete))

(provide 'init-evil)
