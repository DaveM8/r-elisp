;; elisp fnction to convert the names output from R, ess
;; to a c(var1,var2, ... ,varn)
;; David Morrisroe

(defun names-to-c ()
  (interactive)
  (save-excursion
    (let*
	(beg (region-beginning))
      (end (region-end))
      (goto-char (beg))
      (while (and (< (point) (end))
		  (re-search-forward
		   "[[:space:]]?\\[[0-9]+\\][[:space:]]+" nil t))
	(replace-match "")))))

	;; (goto-char (beg))
	;; (while (and (< (point) end)
	;; 	    (re-search-forward
	;; 	     "[[:space:]]+" nil t)
	;; 	    (replace-match "\n")))

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

