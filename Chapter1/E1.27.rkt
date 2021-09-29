#lang sicp

; Demonstrate that the Carmichael numbers listed in Footnote 1.47
; really do fool the Fermat test. That is, write a procedure that
; takes an integer n and tests whether an is congruent to a modulo
; n for every a < n, and try your procedure on the given Carmichael
; numbers.

(define (square x) (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (test-carmichale-number n)
  (define (try-it a)
    (cond ((= a n) true)
          ((= (expmod a n n) a) (try-it (+ a 1)))
          (else false)))
  (newline)
  (display n)
  (cond ((prime? n) (display " is a prime number"))
        ((try-it 1) (display " is a carmichale number"))
        (else (display " is a not prime and carmichale numbers"))))


; prime?
(define (smallest-divisor n) (find-divisor n 2))

; O(sqrt(n)) to test prime numbers
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b) (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

; Carmichael numbers: 561, 1105, 1729, 2465, 2821, and 6601.
(test-carmichale-number 561)
(test-carmichale-number 1105)
(test-carmichale-number 1729)
(test-carmichale-number 2465)
(test-carmichale-number 2821)
(test-carmichale-number 6601)
(test-carmichale-number 2)
(test-carmichale-number 12)