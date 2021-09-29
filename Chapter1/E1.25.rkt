#lang sicp

; Alyssa P. Hacker complains that we went to
; a lot of extra work in writing expmod. After all, she says,
; since we already know how to compute exponentials, we
; could have simply written


(define (fast-expt b n)
  (cond ((= n 0) 1)
       ((even? n) (square (fast-expt b (/ n 2))))
       (else (* b (fast-expt b (- n 1))))))

(define (square x) (* x x))
(define (even? x) (= (remainder x 2) 0))

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

; Is she correct? Would this procedure serve as well for our
; fast prime tester? Explain.

; Answer: correct， but not effective
; base ^ exp may be is very larger number, will not effctive.
; (base ^ exp) % m = ((base % m) ^ exp) % m, so original expmod
; intermediate value will less m