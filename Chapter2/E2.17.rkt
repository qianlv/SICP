#lang sicp

; Define a procedure last-pair that returns
; the list that contains only the last element of a given (nonempty)
; list:
; (last-pair (list 23 72 149 34))
; (34)

(define (last-pair lst)
  (cond
    ((null? lst) '())
    ((null? (cdr lst)) lst)
    (else (last-pair (cdr lst)))))

(last-pair (list 23 72 149 34))
(last-pair (list 12))
(last-pair '())
