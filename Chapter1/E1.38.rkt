#lang sicp

; In 1737, the Swiss mathematician Leonhard
; Euler published a memoir De Fractionibus Continuis, which
; included a continued fraction expansion for e − 2, where
; e is the base of the natural logarithms. In this fraction, the
; Ni are all 1, and the Di are successively 1, 2, 1, 1, 4, 1, 1,
; 6, 1, 1, 8, . . .. Write a program that uses your cont-frac
; procedure from Exercise 1.37 to approximate e, based on
; Euler’s expansion.

; infinite continued fraction
(define (cont-frac-rec n d k)
  (define (cont-frac-rec-helper i)
    (if (>= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (cont-frac-rec-helper (+ i 1))))))
  (cont-frac-rec-helper 1))

; e: 2.718281828459045
(+ 2 (cont-frac-rec (lambda (i) 1.0)
                    (lambda (i)
                      (let ((q (+ (quotient i 3) 1))
                            (r (remainder i 3)))
                        (if (< r 2)
                           1.0
                           (* q 2))))
                    20))

