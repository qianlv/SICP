#lang sicp

; Define a procedure reverse that takes a list as argument
; and returns a list of the same elements in reverse order:
; (reverse (list 1 4 9 16 25))
; (25 16 9 4 1)

(define (reverse lst)
  (define (iter items answer)
    (if (null? items)
      answer
      (iter (cdr items)
            (cons (car items)
                  answer))))
  (iter lst nil))

(reverse (list 1 4 9 16 25))
