;;; gigasecond.el --- Gigasecond (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(defconst gigasecond 1000000000)

(defun add (second minute hour day month year)
  (butlast (decode-time
            (time-add
             (encode-time second minute hour day month year nil -1 0)
             gigasecond)
            0)
           3))

(provide 'gigasecond)
;;; gigasecond.el ends here

