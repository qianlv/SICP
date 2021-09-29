#lang sicp

; Modify the timed-prime-test procedure of Exercise 1.22 to
; use fast-prime? (the Fermat method), and test each of the
; 12 primes you found in that exercise. Since the Fermat test
; has Θ(logn) growth, how would you expect the time to test
; primes near 1,000,000 to compare with the time needed to
; test primes near 1000? Do your data bear this out? Can you
; explain any discrepancy you find?

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

; random a in [1, n-1]
; test (a ^ n) mod  == a
(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

; probabilistic method
; There are 255 Carmichael numbers below 100,000,000.
; The smallest few are 561, 1105, 1729, 2465, 2821, and 6601.
(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 12)
      (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (next-odd n)
  (if (even? n)
      (+ n 1)
      (+ n 2)))

(define (search-for-primes start end)
  (cond ((> start end) (display "\nend"))
        (else
         (timed-prime-test start)
         (search-for-primes (next-odd start) end))))


; run in time 按 log(1000000) / log(1000) 约等于 2
(search-for-primes 1000 1020)
(search-for-primes 1000000 1000037)