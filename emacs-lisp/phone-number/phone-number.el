;;; phone-number.el --- phone-number (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(defconst pn--re-country "\\+?\\([0-9]?\\)")
(defconst pn--re-area "(?\\([0-9]\\{3\\}\\))?")
(defconst pn--re-exchange "\\([0-9]\\{3\\}\\)")
(defconst pn--re-subscriber "\\([0-9]\\{4\\}\\)")
(defconst pn--re-seps "[-\\. ]*")
(defconst pn--re-phone
  (concat "^" pn--re-country pn--re-seps pn--re-area pn--re-seps pn--re-exchange
          pn--re-seps pn--re-subscriber pn--re-seps "$"))

(define-error 'country-code-error "Invalid country code")
(define-error 'area-code-starting-with-0-error "Area code starts with 0")
(define-error 'area-code-starting-with-1-error "Area code starts with 1")
(define-error 'exchange-code-starting-with-0-error "Exchange code starts with 0")
(define-error 'exchange-code-starting-with-1-error "Exchange code starts with 1")
(define-error 'letters-in-phone-num-error "Letters in phone number")
(define-error 'punctuations-in-phone-num-error "Punctuations in phone number")
(define-error 'long-phone-num-error "Phone number too long")
(define-error 'short-phone-num-error "Phone number too short")
(define-error 'invalid-phone-number "Invalid phone number")

(defun make-phone-number (string)
  "Create a phone-number record from STRING."
  (unless (string-match pn--re-phone string)
    (cond
     ((string-match "[[:alpha:]]+" string)
      (signal 'letters-in-phone-num-error (match-string 0 string)))
     ((string-match "[^0-9 -.()]+" string)
      (signal 'punctuations-in-phone-num-error (match-string 0 string)))
     ((length> (replace-regexp-in-string "[^0-9]" "" string) 11)
      (signal 'long-phone-num-error nil))
     ((length< (replace-regexp-in-string "[^0-9]" "" string) 11)
      (signal 'short-phone-num-error nil))
     (t (signal 'invalid-phone-number nil))))
  (record 'phone-number
          (match-string 1 string)
          (match-string 2 string)
          (match-string 3 string)
          (match-string 4 string)))

(defun pn-get (record field)
  "Return the given FIELD from the phone-number RECORD."
  (pcase field
    ('country (aref record 1))
    ('area (aref record 2))
    ('exchange (aref record 3))
    ('subscriber (aref record 4))
    (_ nil)))

(defun numbers (num)
  (let ((pn (make-phone-number num)))
    (cond
     ((not (or (string= "" (pn-get pn 'country))
               (string= "1" (pn-get pn 'country))))
      (signal 'country-code-error (pn-get pn 'country)))
     ((string-prefix-p "0" (pn-get pn 'area))
      (signal 'area-code-starting-with-0-error (pn-get pn 'area)))
     ((string-prefix-p "1" (pn-get pn 'area))
      (signal 'area-code-starting-with-1-error (pn-get pn 'area)))
     ((string-prefix-p "0" (pn-get pn 'exchange))
      (signal 'exchange-code-starting-with-0-error (pn-get pn 'exchange)))
     ((string-prefix-p "1" (pn-get pn 'exchange))
      (signal 'exchange-code-starting-with-1-error (pn-get pn 'exchange)))
     (t (format "%s%s%s"(pn-get pn 'area) (pn-get pn 'exchange)
                (pn-get pn 'subscriber))))))

(defun area-code (num)
  (pn-get (make-phone-number num) 'area))

(defun pprint (num)
  (let ((pn (make-phone-number num)))
    (format "(%s) %s-%s"
            (pn-get pn 'area) (pn-get pn 'exchange) (pn-get pn 'subscriber))))

(provide 'phone-number)
;;; phone-number.el ends here
