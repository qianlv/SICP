#lang sicp

; A function f is defined by the rule that
; f(n) = n if n < 3
; f(n) = f(n-1) + 2f(n-2) + 3(fn-3) if n >= 3
; Write a procedure that computes f by means of a recursive
; process.
; Write a procedure that computes f by means of an iterative
; process.

(define (f-rec n)
  (cond ((< n 3) n)
        (else (+
                 (f-rec (- n 1))
                 (* 2 (f-rec (- n 2)))
                 (* 3 (f-rec (- n 3)))))))

(define (f-iter n)
  (f-iter-helper 0 1 2 n))

(define (f-iter-helper f0 f1 f2 count)
  (cond ((= count 0) f0)
        ((= count 1) f1)
        ((= count 2) f2)
        (else (f-iter-helper f1
                             f2
                             (+ f2 (* 2 f1) (* 3 f0))
                             (- count 1)))))