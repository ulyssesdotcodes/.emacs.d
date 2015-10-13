(defun eshell-evil-keys()
  (define-key eshell-mode-map (kbd "k") 'eshell-previous-matching-input-from-input))

(add-hook 'eshell-mode-hook 'eshell-vil-keys)

(global-set-key (kbd "M-x") 'helm-M-x)
