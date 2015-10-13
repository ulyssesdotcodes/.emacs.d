(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
;;(exec-path-from-shell-initialize)

(eval-when-compile
  (defvar use-package-verbose t)
  (require 'use-package))


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
			       "e" 'helm-find-files
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

(provide 'init-evil)
