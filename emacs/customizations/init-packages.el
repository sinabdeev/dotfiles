(require 'package)

(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
	     '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("org" . "https://orgmode.org/elpa/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(
    evil
    evil-surround
    evil-numbers
    projectile-rails
    evil-rails
    evil-commentary
    evil-matchit
    evil-exchange
    evil-visualstar

    railscasts-theme

    org
    org-evil))

(dolist (p my-packages)
  (if (not (package-installed-p p))
      (package-install p)))

(load-theme 'railscasts t nil)

(provide 'init-packages)
