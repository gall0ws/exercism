;;; armstrong-numbers.el --- armstrong-numbers Exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(defun sum-digits (n)
  (if (= n 0)
      0
    (apply #'+ (mapcar (lambda (c)
                         (expt (- c ?0) (ceiling (log10 n))))
                       (format "%d" n)))))

(defun armstrong-p (n)
  (= n (sum-digits n)))

(provide 'armstrong-numbers)
;;; armstrong-numbers.el ends here
