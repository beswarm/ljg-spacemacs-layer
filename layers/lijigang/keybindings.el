;; (evil-leader/set-key "oc" 'org-capture)
;; (evil-leader/set-key "oa" 'org-agenda)
;; (evil-leader/set-key "ol" 'org-store-link)
;; (evil-leader/set-key "el" 'eval-print-last-sexp)
;; (evil-leader/set-key "od" 'org-archive-subtree)

;; (evil-leader/set-key "oip" 'org-set-property)
;; (evil-leader/set-key "oil" 'org-insert-link)
;; (evil-leader/set-key "ois" 'org-time-stamp)
;; (evil-leader/set-key "oid" 'org-insert-drawer)
;; (evil-leader/set-key "oif" 'org-footnote-action)

;; (evil-leader/set-key "oog" (lambda () (interactive) (find-file "~/Library/Mobile Documents/com~apple~CloudDocs/org/gtd.org")))
;; (evil-leader/set-key "ool" (lambda () (interactive) (find-file "/Users/ljg/.spacemacs.d/layers/lijigang/packages.el")))

;; (evil-leader/set-key "oit" 'insert-day-progress)

;; (global-set-key (kbd "C--") 'org-table-insert-hline)

(global-set-key
 (kbd "C-c p")
 (defhydra hydra-blog (:color blue :hint nil)
   "
    blog  _n_: new post                        _l_: publish last commit
          _r_: reset & publish all             _p_: publish interactively
          _t_: reset & publish to /tmp/blog    _e_: new-repository
          "
   ("n" op/new-post)
   ("r" (progn
          (setq op/item-cache nil)
          (op/do-publication t nil nil t t)))
   ("t" (progn
          (setq op/item-cache nil)
          (op/do-publication t "/tmp/blog" nil t nil)))
   ("l" (op/do-publication nil "HEAD~1" nil t t))
   ("p" op/do-publication)
   ("e" op/new-repository)))
