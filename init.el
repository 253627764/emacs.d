(defun leafsoar()
  (interactive)
  (message "message leafsoar"))

(defun ls-edit()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; mac config
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

;; other

(global-set-key (kbd "C-x C-b") 'ibuffer)

(setq backup-inhibited t)
(setq auto-save-default nil)
(setq column-number-mode t)
(setq inhibit-startup-message t)
(setq kill-ring-max 200)
(setq scroll-margin 0
      scroll-conservatively 10000)
(show-paren-mode t)
(setq show-paren-style 'parentheses)
(mouse-avoidance-mode 'animate)
(setq visible-bell t)
(if window-system
  (tool-bar-mode 0))

;; (ido-mode t)

;; (require 'markdown-mode)
;; (setq auto-mode-alist
;;       (cons '("\\.md" . markdown-mode) auto-mode-alist))

(setq org-log-done 'time)
(setq tab-always-indent nil)

;; (global-set-key [f12] 'loop-alpha)  
(setq alpha-list '((75 20) (85 50) (93 80) (100 100)))
(defun loop-alpha ()
  (interactive)
  (let ((h (car alpha-list)))
    ((lambda (a ab)
       (set-frame-parameter (selected-frame) 'alpha (list a ab))
       (add-to-list 'default-frame-alist (cons 'alpha (list a ab))))
     (car h) (car (cdr h)))
    (setq alpha-list (cdr (append alpha-list (list h))))))

(defun ls-kill-current-buffer()
  (interactive)
  (kill-buffer (current-buffer)))

;;keys
(global-set-key (kbd "M-4") 'ls-kill-current-buffer)
(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "M-0") 'other-window)
(global-set-key (kbd "M-C-z") 'undo)

(setq c-basic-offset 4)
(global-set-key "\C-m" 'newline-and-indent)
(global-set-key (kbd "C-<return>") 'newline)

(setq tab-width 4 indent-tabs-mode nil)
(setq default-tab-width 4)
(setq tab-width 4)

;; lisp-interactive-mode auto ()
(defun ls-lisp-mode-auto-pair ()
  (interactive)
  (make-local-variable 'skeleton-pair-alist)
  (setq skeleton-pair-alist  '(
			       (?\( _ ")")))
  (setq skeleton-pair t)
  (local-set-key (kbd "(") 'skeleton-pair-insert-maybe))
(add-hook 'lisp-interaction-mode-hook 'ls-lisp-mode-auto-pair)
(add-hook 'lisp-mode-hook 'ls-lisp-mode-auto-pair)



;; elpa config
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-default-packages '(auto-complete htmlize))

(dolist (p my-default-packages)
  (when (not (package-installed-p p))
	(package-install p)))

(require 'auto-complete)
(require 'auto-complete-config)


(ac-config-default)  
(global-auto-complete-mode t)
(global-set-key "\M-/" 'auto-complete)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (deeper-blue))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
