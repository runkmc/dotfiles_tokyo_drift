(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
;; set a theme
(load-theme 'wombat t)

;; remove the menu bar
;(menu-bar-mode -1)
(setq truncate-lines nil)

;soft wrapping
(global-visual-line-mode t)

;;evil settings
(setq evil-want-C-i-jump nil)
(require 'evil)
(evil-mode 1)

;; turn on rainbow delimiters
;(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; turn on which-key
(which-key-mode)

(global-set-key (kbd "C-c c l") 'comment-line)
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
;(global-set-key (kbd "C-c a") 'org-agenda)
;(global-set-key (kbd "C-c c") 'org-capture)
;; settings for org
;(setq org-agenda-files (directory-files-recursively "~/org/" "\\.org$"))
;(setq org-agenda-include-diary t)

;; org-roam settings
(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t) 
  :custom
  (org-roam-directory (file-truename "~/org-roam"))
  :bind (("C-c n l" . org-roam-buffer-toggle)
	 ("C-c n f" . org-roam-node-find)
	 ("C-c n i" . org-roam-node-insert))
  :config
  (org-roam-setup))
(org-roam-db-autosync-mode)

;; don't touch below
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "13a8eaddb003fd0d561096e11e1a91b029d3c9d64554f8e897b2513dbf14b277" "51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "0fffa9669425ff140ff2ae8568c7719705ef33b7a927a0ba7c5e2ffcfac09b75" "285d1bf306091644fb49993341e0ad8bafe57130d9981b680c1dbd974475c5c7" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" "c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" default))
 '(global-display-line-numbers-mode t)
 '(latex-run-command "xelatex")
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
   '(ag solarized-theme telephone-line rainbow-delimiters which-key use-package deft ht org-super-agenda markdown-mode ## org-roam evil org)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
