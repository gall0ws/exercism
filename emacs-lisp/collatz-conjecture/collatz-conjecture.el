;;; collatz-conjecture.el --- Collatz Conjecture (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(defun collatz (number)
  "Produce the Collatz sequence starting from NUMBER."
  (when (< number 1) (error "collatz is defined only for positive integers"))
  (named-let rec ((lst (list number)))
    (pcase (car lst)
      (1 (nreverse lst))
      ((pred cl-evenp)
       (rec (cons (/ (car lst) 2) lst)))
      (_ (rec (cons (1+ (* 3 (car lst))) lst))))))

(defun steps (number)
  "Count the steps to reach 1 using the Collatz conjecture."
  (1- (length (collatz number))))

(provide 'collatz-conjecture)
;;; collatz-conjecture.el ends here
