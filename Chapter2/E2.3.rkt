#lang sicp

; Implement a representation for rectangles in a plane.
; (Hint: You may want to make use of Exercise 2.2.) In
; terms of your constructors and selectors, create procedures
; that compute the perimeter and the area of a given rectangle.
; Now implement a different representation for rectangles.
; Can you design your system with suitable abstraction barriers,
; so that the same perimeter and area procedures will work using
; either representation?
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

(define (make-rectangular left-upper right-bottom)
  (cons left-upper right-bottom))
(define (left-upper-rectangular rec) (car rec))
(define (right-bottom-rectangular rec) (cdr rec))
(define (right-upper-rectangular rec)
  (let ((left-upper (left-upper-rectangular rec))
        (right-bottom (right-bottom-rectangular rec)))
    (make-point (x-point right-bottom)
                (y-point left-upper))))
(define (left-bottom-rectangular rec)
  (let ((left-upper (left-upper-rectangular rec))
        (right-bottom (right-bottom-rectangular rec)))
    (make-point (x-point left-upper)
                (y-point right-bottom))))

(define (area-rectangular rec)
  (let ((left-upper (left-upper-rectangular rec))
        (right-bottom (right-bottom-rectangular rec)))
    (* (abs (- (x-point left-upper) (x-point right-bottom)))
       (abs (- (y-point left-upper) (y-point right-bottom))))))
(define (perimeter-rectangular rec)
  (let ((left-upper (left-upper-rectangular rec))
        (right-bottom (right-bottom-rectangular rec)))
    (+ (* 2 (abs (- (x-point left-upper) (x-point right-bottom))))
       (* 2 (abs (- (y-point left-upper) (y-point right-bottom)))))))
  

(define p1 (make-point 1 4))
(define p2 (make-point 2 2))
(define rec (make-rectangular p1 p2))
(display (area-rectangular rec))
(newline)
(display (perimeter-rectangular rec))
(newline)
  