;; elisp fnction to convert the names output from R, ess
;; to a c(var1,var2, ... ,varn)
;; David Morrisroe

(defun names-to-c (start-point end-point)
  (interactive "r")
  (save-excursion
    (save-restriction
    (message (concat "beg " (number-to-string start-point)
		     " end " (number-to-string end-point)))
    (defvar beg start-point)
    (defvar end end-point)
    (narrow-to-region beg end)
    (goto-char (point-min)
    (while (and (< (point) end)
		(re-search-forward
		 "[[:space:]]?\\[[0-9]+\\][[:space:]]+" nil t))
      (replace-match ""))
    (goto-char beg)
    (while (and (< (point) end)
		(re-search-forward
		 "[[:space:]]+" nil t)
		(replace-match "\n")))
        (message (concat "beg " (number-to-string beg)
		     " end " (number-to-string end)))))
	;; (goto-char (beg))
	;; (while (and (< (point) end)
	;; 	    (re-search-	
	;; 	     "\"\\(.*\\)\"" nil t)
	;; 	    (replace-match "\\1")))
	
	;; (goto-char (beg))
	;; (while (and (< (point) end)
	;; 	    (re-search-forward
	;; 	     "\n" nil t)
	;; 	    (replace-match ", ")))
	;; (goto-char (beg))
	;; (while (and (< (point) end)
	;; 	    "^," nil t)
	;;   (replace-match ""))
	;; (goto-char (beg))
	;; (while (and (< (point) end)
	;; 	"\\(.+\\)" nil t)
	;;   (replace-match "c(\\1)"))
	))

