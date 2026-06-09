;;; hamming.el --- Hamming (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(defun hamming-distance (dna1 dna2)
  (unless (eq (length dna1) (length dna2))
    (error "DNA1 and DNA2 must be sequences of equal length"))
  (seq-count 'not (cl-mapcar 'eq dna1 dna2)))

(provide 'hamming)
;;; hamming.el ends here
