;;; queen-attack.el --- Queen Attack (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(defun valid-position-p (queen)
  (and (<= 0 (car queen)) (< (car queen) 8)
       (<= 0 (cdr queen)) (< (cdr queen) 8)))

(defun can-attack-p (white-queen black-queen)
  (and (valid-position-p white-queen) (valid-position-p black-queen)
       (or (= (car white-queen) (car black-queen))
           (= (cdr white-queen) (cdr black-queen))
           (= (abs (- (car white-queen) (car black-queen)))
              (abs (- (cdr white-queen) (cdr black-queen)))))))

(provide 'queen-attack)
;;; queen-attack.el ends here
