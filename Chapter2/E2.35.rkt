#lang sicp

; Redefine count-leaves from Section 2.2.2 as an accumulation:
; Section 2.2.2 count-leaves:
; (define (count-leaves x)
;   (cond ((null? x) 0)
;         ((not (pair? x)) 1)
;         (else (+ (count-leaves (car x))
;                  (count-leaves (cdr x))))))

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
  (accumulate (lambda (x y) (+ x y))
              0 
              (map (lambda (x)
                     (cond ((null? x) 0)
                           ((not (pair? x)) 1)
                           (else (count-leaves x)))) 
                   t)))

(define x (cons (list 1 2) (list 3 4)))
x
(count-leaves x)
(list x x)
(count-leaves (list x x))
(count-leaves (list x x (list x x)))
