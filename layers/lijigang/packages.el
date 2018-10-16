;;; packages.el --- lijigang layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: ljg <i@lijigang.com>
;; URL: http://www.lijigang.com
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3


;;; Code:

(defconst lijigang-packages
  '(org-page
    dired-icon
    cnfonts
    swiper
    wttrin
    beacon
    pangu-spacing
    pyim
    posframe
    )
)

(defun lijigang/init-org-page()
  "Initialize org-page to publish blog."
  (use-package org-page
    :ensure t
    :config (progn
          (setq op/site-main-title "捉妖记")
          (setq op/personal-github-link "https://github.com/lijigang")
          (setq op/repository-directory "~/lijigang")
          (setq op/site-domain "http://lijigang.github.io/")
          (setq op/theme-root-directory "~/.emacs.d/elpa/org-page-20170806.1924/themes")
          (setq op/theme 'ljg)
          ;; (setq op/personal-google-analytics-id "36d44a2295ffa55a3ab51c6aa7a71733")
          (setq op/highlight-render 'js)
          (setq op/category-ignore-list '("themes" "assets" "images"))
          (setq op/category-config-alist
            '(("blog"
              :show-meta t
              :show-comment t
              :uri-generator op/generate-uri
              :uri-template "/blog/%t/"
              :sort-by :date     ;; how to sort the posts
              :category-index nil) ;; generate category index or not
              ("index"
              :show-meta nil
              :show-comment nil
              :uri-generator op/generate-uri
              :uri-template "/"
              :sort-by :date
              :category-index nil)
              ("about"
              :show-meta nil
              :show-comment nil
              :uri-generator op/generate-uri
              :uri-template "/about/"
              :sort-by :date
              :category-index nil)))
          (bind-key "C-c M-p" 'op/do-publication-and-preview-site)))
    )

(defun lijigang/init-dired-icon ()
  "Initialize dired-icon"
  (add-hook 'dired-mode-hook 'dired-icon-mode)
  (add-hook 'dired-mode-hook
            (lambda ()
              (highlight-lines-matching-regexp "\.org$" 'hi-yellow))))

(defun lijigang/init-cnfonts()
  "Initialize cnfonts"
  (use-package cnfonts
    :init
    (cnfonts-enable)
    (cnfonts-set-spacemacs-fallback-fonts)))

(defun lijigang/init-swiper()
  "Initialize swiper"
  (use-package swiper
    :init
    (define-key global-map (kbd "C-s") 'swiper)))


(defun lijigang/init-wttrin()
  (use-package wttrin
    :ensure t
    :commands (wttrin)
    :init
    (setq wttrin-default-cities '("Beijing"
                                  "Bristol")))
  )

(defun lijigang/init-beacon()
  "Initialize beacon"
  (use-package beacon
    :init
    (beacon-mode 1)
    (setq beacon-color "#666600")))

(defun lijigang/init-pangu-spacing()
  "Initialize pangu-spacing"
  (use-package pangu-spacing
    :init
    (global-pangu-spacing-mode 1)
    (setq pangu-spacing-real-insert-separtor t)))

(defun lijigang/init-pyim()
  "Initialize pyim"
  (use-package pyim
    :ensure nil
    :demand t
    :init
    (setq pyim-punctuation-translate-p '(no yes auto))
    :config
    (setq default-input-method "pyim")
    (setq pyim-default-scheme 'wubi)

    ;; 让 Emacs 启动时自动加载 pyim 词库
    (add-hook 'emacs-startup-hook
              #'(lambda () (pyim-restart-1 t)))

    (setq pyim-page-tooltip 'posframe)
    (setq pyim-dicts '((:name "基础词库" :file "~/Library/Mobile Documents/com~apple~CloudDocs/3-config/wbdict.pyim")))
    (global-set-key (kbd "C-9") 'toggle-input-method)
    ))

(defun lijigang/init-posframe ()
  (use-package posframe))
;;; packages.el ends here
