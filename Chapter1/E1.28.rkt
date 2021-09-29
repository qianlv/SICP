#lang sicp
; One variant of the Fermat test that cannot
; be fooled is called the Miller-Rabin test (Miller 1976; Rabin
; 1980). This starts from an alternate form of Fermat’s Little
; Theorem, which states that if n is a prime number and a is
; any positive integer less thann, thena raised to the (n−1)-st
; power is congruent to 1 modulo n. To test the primality of a
; number n by the Miller-Rabin test, we pick a random num-
; ber a < n and raise a to the (n −1)-st power modulo n using
; the expmod procedure. However, whenever we perform the
; squaring step in expmod, we check to see if we have discov-
; ered a “nontrivial square root of 1 modulon,” that is, a num-
; ber not equal to 1 orn−1 whose square is equal to 1 modulo
; n. It is possible to prove that if such a nontrivial square root
; of 1 exists, then n is not prime. It is also possible to prove
; that ifn is an odd number that is not prime, then, for at least
; half the numbers a < n, computing an−1 in this way will
; reveal a nontrivial square root of 1 modulo n. (This is why
; the Miller-Rabin test cannot be fooled.) Modify the expmod
; procedure to signal if it discovers a nontrivial square root
; of 1, and use this to implement the Miller-Rabin test with
; a procedure analogous to fermat-test. Check your pro-
; cedure by testing various known primes and non-primes.
; Hint: One convenient way to make expmod signal is to have
; it return 0.

(define (square x) (* x x))

(define (nontrivial-square-root x rx m)
  (cond ((= x 1) rx)
        ((= x (- m 1)) rx)
        ((= rx 1) 0)
        (else rx)))

; (base ^ exp) mod m
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (nontrivial-square-root
           (expmod base (/ exp 2) m)
           (remainder (square (expmod base (/ exp 2) m)) m)
           m))
        (else
         (remainder (* base (expmod base (- exp 1) m)) m))))

; random a in [1, n-1]
; test (a ^ n) mod  == a
(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

; probabilistic method
; There are 255 Carmichael numbers below 100,000,000.
; The smallest few are 561, 1105, 1729, 2465, 2821, and 6601.
(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((miller-rabin-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (test-carmichale-number n)
  (newline)
  (display n)
  (cond ((fast-prime? n 10) (display " is a prime number"))
        (else (display " is a not prime"))))

; Carmichael numbers: 561, 1105, 1729, 2465, 2821, and 6601.
(test-carmichale-number 561)
(test-carmichale-number 1105)
(test-carmichale-number 1729)
(test-carmichale-number 2465)
(test-carmichale-number 2821)
(test-carmichale-number 6601)
(test-carmichale-number 2)
(test-carmichale-number 12)