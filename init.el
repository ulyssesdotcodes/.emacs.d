(setq visible-bell 1)

(require 'cask "~/.cask/cask.el")
(cask-initialize)

(defvar dotfiles-dir (file-name-directory
                      (or (buffer-file-name) load-file-name)))

(setenv "SSH_ASKPASS" "git-gui--askpass")

(load (concat dotfiles-dir "init-packages.el"))

(fset 'yes-or-no-p 'y-or-n-p)

(when window-system
  (load-theme 'solarized-dark t))

(add-hook 'term-mode-hook 'term-line-mode)

(define-key evil-normal-state-map "j" 'next-line)
(define-key evil-normal-state-map "k" 'previous-line)

(global-set-key "\C-h" 'windmove-left)
(global-set-key (kbd "C-l") 'windmove-right)
(global-set-key "\C-k" 'windmove-up)
(global-set-key (kbd "C-j") 'windmove-down)

(global-set-key (kbd "C--") 'pop-global-mark)
(global-set-key (kbd "C-S--") 'goto-last-change)

(define-key evil-normal-state-map (kbd "C-p") 'fiplr-find-file)


   ;;; esc quits

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
