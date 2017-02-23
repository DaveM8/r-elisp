;; elisp fnction to convert the names output from R, ess
;; to a c(var1,var2, ... ,varn)
;; David Morrisroe

;; the R function names will out put the names of all the fields
;; in the format below
;; > names(taxi)
;;  [1] "pickup_ad_dist" "pickup_ed_dist" "pickup_hour"    "pickup_day"    
;;  [5] "pickup_month"   "avg_total"      "sd_total"       "total_amt"     
;;  [9] "avg_tip"        "sd_tip"         "total_tip"      "num_trips"     

;; this elisp function will change this to a comma seperated
;; list all on one line
;; like so

;; pickup_ad_dist, pickup_ed_dist, pickup_hour, pickup_day, pickup_month, avg_total, sd_total, total_amt, avg_tip, sd_tip, total_tip, num_trips,

;; TODO
;; there's still a traling comma
;; I Think this could all be don't with just one regexp

(defun names-to-c (start-point end-point)
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region start-point end-point)
      ;;(message (number-to-string end-point))
      (goto-char (point-min))
      ;; match: the [8] at the start of each line
      ;; replace: blank
      (while (re-search-forward
	      "[[:space:]]?\\[[0-9]+\\][[:space:]]+" nil t)
	(replace-match ""))
      (goto-char (point-min))
      ;; match: the spaces between the fields on the same line
      ;; replace: new line
      (while (re-search-forward
	      "[[:space:]]+" nil t)
	(replace-match "\n"))
      (goto-char (point-min))
      ;; match: field name
      ;; replacd: remove the double quotes "field-name"
      (while (re-search-forward
	      "\"\\(.*\\)\"" nil t)
	(replace-match "\\1"))
      (goto-char (point-min))
      ;; remove the blank lines
      (while (re-search-forward
	      "^\n" nil t)
	(replace-match ""))
      (goto-char (point-min))
      ;; replace the new lines with ,
      ;; this makes all the fields on one line
      (while (re-search-forward
	      "\n" nil t)
	(replace-match ", "))
      (goto-char (point-min))
      ;; remove any starting ,
      (while (re-search-forward
	      "^," nil t)
	(replace-match ""))
      (goto-char (point-max))
      ;;remove traling , and any traling white-space
      (while (re-search-forward
	      ",\s?$" nil t)
	(replace-match "")))))
