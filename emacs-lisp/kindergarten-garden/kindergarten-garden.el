;;; kindergarten-garden.el --- Kindergarten Garden (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(defconst kgg-children
  '("Alice" "Bob" "Charlie" "David"
    "Eve" "Fred" "Ginny" "Harriet"
    "Ileana" "Joseph" "Kincaid" "Larry"))

(defconst kgg-plants
  '((?G . "grass") (?C . "clover") (?R . "radishes") (?V . "violets")))

(defun get-plant-codes (row index)
  "Return plants owned by the student no. INDEX on the given ROW."
  (let ((i (* 2 index)))
      (list (elt row i) (elt row (1+ i)))))

(defun plants (diagram student)
  (let ((rows (string-split diagram "\n")))
    (mapcar (lambda (k) (alist-get k kgg-plants))
            (append (get-plant-codes (car  rows) (seq-position kgg-children student))
                    (get-plant-codes (cadr rows) (seq-position kgg-children student))))))

(provide 'plants)
;;; kindergarten-garden.el ends here
