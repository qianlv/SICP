#lang sicp

; Write a procedure to find all ordered triples
; of distinct positive integers i, j, and k less than or equal to
; a given integer n that sum to a given integer s.

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
    nil
    (cons low (enumerate-interval (+ low 1) high))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))


(define (order-triples n)
  (flatmap 
    (lambda (i)
      (flatmap (lambda (j) 
                 (map (lambda (k) (list i j k))
                      (enumerate-interval (+ j 1) n)))
               (enumerate-interval (+ i 1) n)))
    (enumerate-interval 1 n)))

(define (sum-triple triple)
  (accumulate + 0 triple))

(define (order-triples-sum s n)
  (filter (lambda (triple) (= s (sum-triple triple)))
          (order-triples n)))

(order-triples 5)
(order-triples-sum 5 5)
(order-triples-sum 6 5)
(order-triples-sum 7 5)
(order-triples-sum 8 5)
(order-triples-sum 9 5)
(order-triples-sum 10 5)
; '(((1 2 3) (1 2 4)) ((1 3 4)) () ((2 3 4)) () ())

