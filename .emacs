;; .emacs
(package-initialize)

(setq custom-file "~/.emacs.custom.el")
(setq display-line-numbers 'relative)
(setq make-backup-files nil)
(setq inhibit-splash-screen t)
(defun default_font_by_OS()
	(cond 
	  ((eq system-type 'windows-nt) "Consolas-12")	
	  ((eq system-type 'gnu/linux) "Monospace-12")))
	
(add-to-list 'default-frame-alist `(font . ,(default_font_by_OS)))

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(ido-mode 1)
(ido-everywhere 1)
 
(global-display-line-numbers-mode 1)

(add-to-list 'load-path "~/.emacs.local/simpc-mode")
(add-to-list 'load-path "~/.emacs.local/desert-theme")
(add-to-list 'load-path "~/.emacs.local/prettier-js")
(add-to-list 'load-path "~/.emacs.local/smex")

(require 'smex)  
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(require 'prettier-js)
(require 'simpc-mode)
(require 'desert-theme)
(add-hook 'js-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)

(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))
    
(load-file custom-file)
