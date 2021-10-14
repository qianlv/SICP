#lang sicp

; Define a better version of make-rat that handles both positive and
; negative arguments. make-rat should normalize the sign so that if
; the rational number is positive, both the numerator and denominator
; are positive, and if the rational number is negative, only the numerator
; is negative.        

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (make-rat n d)
  (define sign
    (cond ((or (= n 0) (= d 0)) 1)
          ((and (< n 0) (< d 0)) 1)
          ((and (> n 0) (> d 0)) 1)
          (else -1)))
  (define pn (abs n))
  (define pd (abs d))
  (let ((g (gcd pn pd)))
    (cons (* sign (/ pn g)) (/ pd g))))

; for test
(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(print-rat (make-rat 4 -3))
(print-rat (make-rat -4 -2))
(print-rat (make-rat 0 -2))