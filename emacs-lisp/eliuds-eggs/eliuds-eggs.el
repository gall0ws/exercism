;;; eliuds-eggs.el --- Eliud's Eggs (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(defun egg-count (number)
  ;(logcount number))
  (cl-loop for i from (logb number) downto 0
           sum (logand 1 (ash number (- i)))))

(provide 'eliuds-eggs)
;;; eliuds-eggs.el ends here
