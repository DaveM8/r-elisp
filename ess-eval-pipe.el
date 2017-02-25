;; ess-eavl-pipe.el
;; evaluate a magrittr pipe %>% in R
;; identify the start and end of a multiline foward pipe
;; command and send it the ess-eval-region

;; Copyright (C) 2017 D. J. Morrisroe <davidjmorrisroe@gmail.com>

;; Author David J. Morrisroe <davidjmorrisroe@gmail.com>
;; Created 2017 Feburary 25

;; This file is not part of ess
;; This file is not part of emacs

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; A copy of the GNU General Public License is available at
;; http://www.r-project.org/Licenses/

;;; Commentary:

;; ess-eval-pipe was created for the quicj evaluation of
;; multiline R commands linked tograther using the magrittr
;; forward pipe %>% operater.

;; It will also work on many other multi-line commands
;; such as + , <- etc

;; it does not work on multiline commands where the comma is placed
;; at the beginning of the next line
;; it should work anywhare the indation in emacs works.

;; Please report all bugs to davidjmorrisroe@gmail.com

;; function to 
(defun ess-eval-pipe (&optional vis)
     (interactive "P")
     (save-excursion

       (setq save-point (point))
       (goto-char
	(re-search-backward
	 ;; search for a line NOT ending in a continuation operator
	 "[^,*+%=(-]$"  nil t 1))
       (end-of-line)
       (forward-char 1)
       (setq beg (point))

       (goto-char save-point)
       ;; search forward to find the next line not ending with a
       ;; continuation operator
       (goto-char
	(re-search-forward
	 ;; search for a line NOT ending in a continuation operator
	 "[^,*+%=(-]$" nil t 1))
       (end-of-line)
       (setq end (point))
       (message "beg %d end %d" beg end)
       (ess-eval-region beg end vis "Eval pipe")))
