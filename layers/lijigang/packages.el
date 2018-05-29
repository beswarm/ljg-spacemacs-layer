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
    cnfonts
    swiper
    wttrin
    beacon)
)

(defun lijigang/init-org-page()
  "Initialize org-page to publish blog."
  (use-package org-page
    :ensure t
    :config (progn
          (setq op/site-main-title "為學日益, 為道日損")
          (setq op/personal-github-link "https://github.com/lijigang")
          (setq op/repository-directory "~/lijigang")
          (setq op/site-domain "http://lijigang.github.io/")
          (setq op/theme-root-directory "~/.emacs.d/elpa/org-page-20170806.1924/themes")
          (setq op/theme 'ljg)
          (setq op/highlight-render 'js)
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

;;; packages.el ends here
