#lang sicp

; ϕ = (1 + sqrt(5)) / 2 ≈ 1.6180
; 1 / ϕ = 2 / (1 + sqrt(5))
(/ 2 (+ 1 (sqrt 5)))

; infinite continued fraction
(define (cont-frac-rec n d k)
  (define (cont-frac-rec-helper i)
    (if (>= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (cont-frac-rec-helper (+ i 1))))))
  (cont-frac-rec-helper 1))


; How large must you make k in order to get an approximation
; that is accurate to 4 decimal places? k = 11
(cont-frac-rec (lambda (i) 1.0)
               (lambda (i) 1.0)
               11)

; b. iterative process
(define (cont-frac-iter n d k)
  (define (cont-frac-iter-helper i result)
    (if (= i 0)
        result
        (cont-frac-iter-helper (- i 1)
                               (/ (n i) (+ (d i) result)))))
  (cont-frac-iter-helper k 0))

(cont-frac-iter (lambda (i) 1.0)
                (lambda (i) 1.0)
                11)