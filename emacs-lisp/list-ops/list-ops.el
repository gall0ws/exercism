;;; list-ops.el --- List Ops (exercism)  -*- lexical-binding: t; -*-

;;; Commentary: Primitive used: car, cdr, cons, null, zerop, apply, funcall, +, 1+

;;; Code:
(defun list-foldl (fun list accu)
  (if (list-empty-p list) accu
    (list-foldl fun (cdr list) (funcall fun accu (car list)))))

(defun list-foldr (fun list accu)
  (list-foldl (lambda (&rest args)
                (apply fun (list-reverse args)))
              (list-reverse list) accu))

(defun list-empty-p (list)
  (null list))

(defun list-sum (list)
  (if (list-empty-p list) 0
    (+ (car list) (list-sum (cdr list)))))

(defun list-length (list)
  (if (list-empty-p list) 0
    (1+ (list-length (cdr list)))))

(defun list-append (list1 list2)
  (if (list-empty-p list1) list2
    (if (list-empty-p (cdr list1)) (cons (car list1) list2)
      (cons (car list1) (list-append (cdr list1) list2)))))

(defun list-reverse (list)
  (if (list-empty-p list) nil
    (list-append (list-reverse (cdr list)) (cons (car list) nil))))

(defun list-concatenate (list1 list2 &rest LISTS)
  (if (list-empty-p LISTS) (list-append list1 list2)
    (apply 'list-concatenate (list-append list1 list2) (car LISTS) (cdr LISTS))))

(defun list-filter (list predicate)
  (if (list-empty-p list) nil
    (if (funcall predicate (car list))
        (cons (car list) (list-filter (cdr list) predicate))
      (list-filter (cdr list) predicate))))

(defun list-map (list fun)
  (if (list-empty-p list) nil
    (cons (funcall fun (car list)) (list-map (cdr list) fun))))

(provide 'list-ops)
;;; list-ops.el ends here
