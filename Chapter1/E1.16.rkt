#lang sicp

; Design a procedure that evolves an iterative exponentiation
; process that uses successive squaring
; and uses a logarithmic number of steps, as does fast-expt.

(define (even? n)
  (= (remainder n 2) 0))

(define (square x) (* x x))

; (define (fast-expt b n)
;   (cond ((= n 0) 1)
;         ((even? n) (square (fast-expt b (/ n 2))))
;         (else (* b (fast-expt b (- n 1))))))

(define (fast-expt b n)
  (define (fast-expt-iter eb a n)
    (cond ((= n 0) a)
          ((even? n) (fast-expt-iter (* eb eb) a (/ n 2)))
          (else (fast-expt-iter eb (* a eb) (- n 1)))))
  (fast-expt-iter b 1 n))