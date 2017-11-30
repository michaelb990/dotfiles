(defconst ha/emacs-directory (concat (getenv "HOME") "/.emacs.d/"))

(defun ha/emacs-subdirectory (d) (expand-file-name d ha/emacs-directory))

(let* ((subdirs '("elisp" "backups"))
       (fulldirs (mapcar (lambda (d) (ha/emacs-subdirectory d)) subdirs)))
  (dolist (dir fulldirs)
    (when (not (file-exists-p dir))
      (message "Make directory: %s" dir)
      (make-directory dir))))

(setq gc-cons-threshold 50000000)
(setq gnutls-min-prime-bits 4096)


(require 'package)

(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "http://melpa.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

(package-initialize)
(package-refresh-contents)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(require 'cl)

(use-package dash
  :ensure t
  :config (eval-after-load "dash" '(dash-enable-font-lock)))

(use-package s
  :ensure t)

(use-package f
  :ensure t)

(fset 'yes-or-no-p 'y-or-n-p)

(setq scroll-conservatively 10000
      scroll-preserve-screen-position t)

(setq disabled-command-function nil)

(setq initial-scratch-message "") ;; Uh, I know what Scratch is for
(setq visible-bell t)             ;; Get rid of the beeps

(when (window-system)
  (tool-bar-mode 0)               ;; Toolbars were only cool with XEmacs
  (when (fboundp 'horizontal-scroll-bar-mode)
    (horizontal-scroll-bar-mode -1))
  (scroll-bar-mode -1))            ;; Scrollbars are waste screen estate

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (company f s dash use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; toml mode
(add-hook 'toml-mode-hook
          '(lambda()
             (setq tab-width 2)))

;; no-easy-keys :)
(load-file "~/.emacs.d/no-easy-keys/no-easy-keys.el")
(require 'no-easy-keys)
(no-easy-keys 1)

;; enable mouse in emacs :O
(require 'mouse)
(xterm-mouse-mode t)
(defun track-mouse (e))

(add-hook
 'elixir-mode-hook
 (lambda ()
   (alchemist-mode t)
   (require 'flycheck-mix)
   (flycheck-mix-setup)))

;; enable ido - interactively do things, buffer switching in particular
(require 'ido)
(ido-mode t)

;; suppress ido prompt when creating new buffer
(setq ido-create-new-buffer 'always)

;; ignore some buffers
(add-to-list 'ido-ignore-buffers "^ ")
(add-to-list 'ido-ignore-buffers "*Messages*")
(add-to-list 'ido-ignore-buffers "*ECB")
(add-to-list 'ido-ignore-buffers "*Buffer")
(add-to-list 'ido-ignore-buffers "*Completions")
(add-to-list 'ido-ignore-buffers "*ftp ")
(add-to-list 'ido-ignore-buffers "*bsh")
(add-to-list 'ido-ignore-buffers "*jde-log")
(add-to-list 'ido-ignore-buffers "magit-*")
(add-to-list 'ido-ignore-buffers "^[tT][aA][gG][sS]$")

(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (ha/emacs-subdirectory "backups")))))
(setq vc-make-backup-files t)

(defun save-all ()
  "Save all dirty buffers without asking for confirmation."
  (interactive)
  (save-some-buffers t))

(add-hook 'focus-out-hook 'save-all)

(use-package company
  :ensure t
  :init
  (setq company-dabbrev-ignore-case t
        company-show-numbers t)
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (add-to-list 'company-backends 'company-math-symbols-unicode)
  :bind ("C-:" . company-complete)  ; In case I don't want to wait
  :diminish company-mode)

(setq-default indent-tabs-mode nil)
(setq tab-width 2)

;; define function to shutdown emacs server instance
(defun server-shutdown ()
  "Save buffers, Quit, and Shutdown (kill) server"
  (interactive)
  (save-some-buffers)
  (kill-emacs)
  )


