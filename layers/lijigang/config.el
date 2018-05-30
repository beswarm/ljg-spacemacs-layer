(setq org-archive-location "%s_archive::date-tree")
(defadvice org-archive-subtree
  (around org-archive-subtree-to-data-tree activate)
  "org-archive-subtree to date-tree"
  (if
      (string= "date-tree"
               (org-extract-archive-heading
                (org-get-local-archive-location)))
      (let* ((dct (decode-time (org-current-time)))
             (y (nth 5 dct))
             (m (nth 4 dct))
             (d (nth 3 dct))
             (this-buffer (current-buffer))
             (location (org-get-local-archive-location))
             (afile (org-extract-archive-file location))
             (org-archive-location
              (format "%s::*** %04d-%02d-%02d %s" afile y m d
                      (format-time-string "%A" (encode-time 0 0 0 d m y)))))
        (message "afile=%s" afile)
        (unless afile
          (error "Invalid `org-archive-location'"))
        (save-excursion
          (switch-to-buffer (find-file-noselect afile))
          ;; (org-datetree-find-year-create y)
          ;; (org-datetree-find-month-create y m)
          ;; (org-datetree-find-day-create y m d)
          (widen)
          (switch-to-buffer this-buffer))
        ad-do-it)
    ad-do-it))
