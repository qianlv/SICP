#lang sicp

; You can obtain an even more general version of accumulate
; (Exercise 1.32) by introducing the notion of a filter on
; the terms to be combined. That is, combine only those terms
; derived from values in the range that satisfy a specified
; condition. The resulting filtered-accumulate abstraction
; takes the same arguments as accumulate, together with an
; additional predicate of one argument that specifies the
; filter. Write filtered-accumulate as a procedure.
; Show how to express the following using filtered-accumulate:

;  a. the sum of the squares of the prime numbers in the
;     interval a tob (assuming that you have a prime?
;     predicate already written)
;  b. the product of all the positive integers less than n that
;     are relatively prime ton (i.e., all positive integersi < n
;     such that GCD(i,n) = 1).

(define (filtered-accumulate filter combiner null-value
                             term a next b)
  (cond ((> a b) null-value)
        ((filter a)
         (combiner (term a)
                   (filtered-accumulate filter
                                        combiner
                                        null-value
                                        term
                                        (next a)
                                        next
                                        b)))
        (else (filtered-accumulate filter
                                   combiner
                                   null-value
                                   term
                                   (next a)
                                   next
                                   b))))
          
(define (smallest-divisor n) (find-divisor n 2))

; O(sqrt(n)) to test prime numbers
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b) (= (remainder b a) 0))

(define (square x) (* x x))

(define (prime? n)
  (if (<= n 1)
      #f
      (= n (smallest-divisor n))))

(define (sum-prime a b)
  (define (inc x) (+ x 1))
  (define (square x) (* x x))
  (filtered-accumulate prime? + 0 square a inc b))

(sum-prime 1 11)
