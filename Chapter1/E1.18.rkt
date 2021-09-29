#lang sicp
; Using the results of Exercise 1.16 and Exercise 1.17,
; devise a procedure that generates an iterative process
; for multiplying two integers in terms of adding, doubling,
; and halving and uses a logarithmic number of steps.

(define (double x) (+ x x))

(define (fast-multi-iter a b)
  (define (fast-multi-iter-helper a s b)
    (cond ((= b 0) s)
          ((even? b) (fast-multi-iter-helper (double a) s (/ b 2)))
          (else (fast-multi-iter-helper a (+ a s) (- b 1)))))
  (fast-multi-iter-helper a 0 b))