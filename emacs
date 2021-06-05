(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))
;; set a theme
;; (load-theme 'solarized-light t)

;; remove the menu bar
(menu-bar-mode -1)
(setq truncate-lines nil)

;soft wrapping
(global-visual-line-mode t)

;; evil settings
(setq evil-want-C-i-jump nil)
(require 'evil)
(evil-mode 1)

;; turn on rainbow delimiters
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; turn on which-key
(which-key-mode)

;; telephone line, give me some time, I'm living in twilight
(setq telephone-line-primary-left-separator 'telephone-line-flat)
(setq telephone-line-primary-right-separator 'telephone-line-flat)
(telephone-line-mode 1)

;;deft settings
(use-package deft
  :after org
  :bind
  ("C-c n d" . deft)
  :custom
  (deft-recursive t)
  (deft-use-filter-string-for-filename t)
  (deft-default-extension "org")
  (deft-directory "~/org-roam"))

;; mappings for org
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

;; settings for org
(setq org-agenda-files (directory-files-recursively "~/org/" "\\.org$"))
(setq org-agenda-include-diary t)

;; org-roam settings
(add-hook 'after-init-hook 'org-roam-mode)
(setq org-roam-directory "~/org-roam")
(global-set-key (kbd "C-c n r") #'org-roam-buffer-toggle-display)
(global-set-key (kbd "C-c n i") #'org-roam-insert)
(global-set-key (kbd "C-c n /") #'org-roam-find-file)
(global-set-key (kbd "C-c n b") #'org-roam-switch-to-buffer)
(global-set-key (kbd "C-c n d") #'org-roam-find-directory)

;; don't touch below
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" "c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" default))
 '(global-display-line-numbers-mode t)
 '(org-agenda-show-future-repeats 'next)
 '(org-attach-archive-delete 'query)
 '(org-attach-store-link-p 'file)
 '(org-capture-templates
   '(("s" "Seminary TODO item" entry
      (file+headline "~/org/seminary.org" "Inbox")
      (file "~/org/todo-template.txt"))
     ("m" "Main TODO item" entry
      (file+headline "~/org/main.org" "Inbox")
      (file "~/org/todo-template.txt"))))
 '(org-deadline-warning-days 0)
 '(org-enforce-todo-checkbox-dependencies t)
 '(org-enforce-todo-dependencies t)
 '(org-file-apps
   '((auto-mode . emacs)
     (directory . emacs)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . default)
     ("\\.pdf\\'" . default)
     ("\\.docx\\'" . "open %s")))
 '(org-modules
   '(ol-bbdb ol-bibtex ol-docview ol-eww ol-gnus org-habit ol-info ol-irc ol-mhe ol-rmail ol-w3m))
 '(org-refile-allow-creating-parent-nodes 'confirm)
 '(org-refile-targets '((org-agenda-files :tag . ":maxlevel . 2")))
 '(org-refile-use-outline-path 'file)
 '(org-track-ordered-property-with-tag t)
 '(package-selected-packages
   '(telephone-line rainbow-delimiters which-key use-package deft ht org-super-agenda markdown-mode ## org-roam evil org)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-date ((t (:background "magenta" :foreground "white" :inverse-video nil :box (:line-width 2 :color "#fdf6e3") :overline nil :underline t :slant normal :weight normal :height 1.0))))
 '(org-agenda-dimmed-todo-face ((t (:foreground "brightred"))))
 '(org-level-1 ((t (:inherit outline-1 :extend nil :foreground "yellow")))))
