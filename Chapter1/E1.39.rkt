#lang sicp

; A continued fraction representation of the tangent function
; was published in 1770 by the German mathematician J.H. Lambert:

; tanx = x / (1 - (x^2 / (3 - (x^2 / 5 - (...))))

; where x is in radians. Define a procedure (tan-cf x k) that
; computes an approximation to the tangent function based
; on Lambert’s formula. k specifies the number of terms to
; compute, as in Exercise 1.37.

; infinite continued fraction
(define (cont-frac-rec n d k)
  (define (cont-frac-rec-helper i)
    (if (>= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (cont-frac-rec-helper (+ i 1))))))
  (cont-frac-rec-helper 1))

(define (tan-cf x k)
  (cont-frac-rec
    (lambda (i)
      (if (= i 1)
          x
          (- 0 (* x x))))
    (lambda (i) (+ 1 (* 2 (- i 1)))) k))

; tan(pi) = 0
(tan-cf 3.1415928 100)
    