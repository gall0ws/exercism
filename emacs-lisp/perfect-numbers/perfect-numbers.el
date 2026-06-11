;;; perfect-numbers.el --- perfect-numbers Exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(defun aliquot-parts (integer)
  "Produce a list containing the aliquot-parts of the given INTEGER."
  (if (<= integer 1)
      nil
    (let ((x 2) (lst '(1)))
      (while (<= x (sqrt integer))
        (when (zerop (% integer x))
          (push x lst)
          (unless (= (* x x) integer)
            (push (/ integer x) lst)))
        (cl-incf x))
      (sort lst)))) ; sorted because it's fancier

(defun classify (number)
  (when (< number 1) (error "Classification is only possible for natural numbers"))
  (pcase (apply '+ (aliquot-parts number))
    ((pred (> number)) 'deficient)
    ((pred (< number)) 'abundant)
    (_ number 'perfect)))

(provide 'perfect-numbers)
;;; perfect-numbers.el ends here
