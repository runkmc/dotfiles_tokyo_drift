(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))
;; set a theme
(load-theme 'gruvbox-dark-soft 't)

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
   '(rainbow-delimiters which-key use-package deft ht org-super-agenda markdown-mode gruvbox-theme ## org-roam evil org)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
