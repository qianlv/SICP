#lang sicp

; Consider the problem of representing line segments in a plane.
; Each segment is represented as a pair of points: a starting point
; and an ending point. Define a constructor make-segment and selectors
; start-segment and end-segment that define the representation of
; segments in terms of points. Furthermore, a point can be represented
; as a pair of numbers: the x coordinate and the y coordinate. Accordingly,
; specify a constructor make-point and selectors x-point and y-point that
; define this representation. Finally, using your selectors and constructors,
; define a procedure midpoint-segment that takes a line segment as
; argument and returns its midpoint (the point whose coordinates are
; the average of the coordinates of the endpoints). To try your procedures,
; you’ll need a way to print points:
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-point x y)
  (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (make-segment start-point end-point)
  (cons start-point end-point))
(define (start-segment seg) (car seg))
(define (end-segment seg) (cdr seg))

(define (average x y) (/ (+ x y) 2))
(define (midpoint-segment seg)
  (let ((start-point (start-segment seg))
        (end-point (end-segment seg)))
    (make-point (average (x-point start-point) (x-point end-point))
                (average (y-point start-point) (y-point end-point)))))



(print-point (make-point 1 2))
(define p1 (make-point 1 2))
(define p2 (make-point 3 10))
(define seg (make-segment p1 p2))
(define mid (midpoint-segment seg))
(print-point mid)