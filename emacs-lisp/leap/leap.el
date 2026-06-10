;;; leap.el --- Leap exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(defun leap-year-p (year)
  (if (zerop (% year 100)) (zerop (% year 400))
    (zerop (% year 4))))

(provide 'leap-year-p)
;;; leap.el ends here
