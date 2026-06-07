;;; darts.el --- Darts (exercism)  -*- lexical-binding: t; -*-

;;; Commentary: x^2 + y^2 = r^2

;;; Code:
(defun score (x y)
  (pcase (+ (* x x) (* y y))
    ((pred (<= _ 1))  10)
    ((pred (<= _ 25))  5)
    ((pred (<= _ 100)) 1)
    (_ 0)))

(provide 'darts)
;;; darts.el ends here
