;;; armstrong-numbers.el --- armstrong-numbers Exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(defun sum-digits (n)
  (if (= n 0)
      0
    (seq-reduce (lambda (acc m) (+ acc (expt m (ceiling (log10 n)))))
                (mapcar (lambda (c) (- c ?0)) (format "%d" n))
                0)))

(defun armstrong-p (n)
  (= n (sum-digits n)))

(provide 'armstrong-numbers)
;;; armstrong-numbers.el ends here
