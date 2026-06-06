;;; binary-search.el --- Binary Search (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(defun find-binary (array value &optional start end)
  (unless start (setq start 0))
  (unless end (setq end (1- (length array))))
  (if (> start end)
      nil
    (let ((idx (+ start (/ (- end start) 2))))
      (cond
       ((= (elt array idx) value)
        idx)
       ((< (elt array idx) value)
        (find-binary array value (1+ idx) end))
       ((> (elt array idx) value)
        (find-binary array value start (1- idx)))))))

(provide 'binary-search)
;;; binary-search.el ends here
