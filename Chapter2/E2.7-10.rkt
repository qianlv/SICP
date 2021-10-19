#lang sicp

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

; Exercise 2.7
; Alyssa’s program is incomplete because she has not specified the
; implementation of the interval abstraction. Here is a definition
; of the interval constructor:

(define (make-interval a b) (cons a b))

; Define selectors upper-bound and lower-bound to complete
; the implementation.

(define (lower-bound interval)
  (min (car interval) (cdr interval)))

(define (upper-bound interval)
  (max (car interval) (cdr interval)))

(define interval (make-interval 6.8 0.1))
(lower-bound interval)
(upper-bound interval)

; Exercise 2.8
; Using reasoning analogous to Alyssa’s, describe how the difference of
; two intervals may be computed. Define a corresponding subtraction
; procedure, called sub-interval
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

(define x (make-interval 1 3))
(define y (make-interval 2 3))
(sub-interval x y)

; Exercise 2.9
; The width of an interval is half of the difference between its upper and lower
; bounds. The width is a measure of the uncertainty of the number specified by the
; interval. For some arithmetic operations the width of the result of combining two
; intervals is a function only of the widths of the argument intervals, whereas for
; others the width of the combination is not a function of the widths of the
; argument intervals.
; Show that the width of the sum (or difference) of two intervals
; is a function only of the widths of the intervals being added (or subtracted).
; Give examples to show that this is not true for multiplication or division.
; 参考: http://community.schemewiki.org/?sicp-ex-2.9

; for Sum
; a + b = [aL + bL, aH + bH]
; width = 1/2 * (aH + bH - aL - bL) = 1/2 * (aH - aL) + 1/2 * (bH - bL)
; = 1/2 * width of a + 1/2 * width of b
; for multiplication
; [0, 10] * [0, 2] = [0, 20]   (5 * 1 != (width = 10))

; Exercise 2.10
(define (div-interval x y)
  (if (<= (* (lower-bound y) (upper-bound y)) 0)
      (error "Division error (interval span zero)" y)
      (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))
(div-interval (make-interval 1 2) (make-interval -2 1))