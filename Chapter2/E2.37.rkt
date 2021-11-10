#lang sicp

; matrix like ((1 2 3 4) (4 5 6 6) (6 7 8 9))
; dot-product

(define w '((1 2 3 4) (4 5 6 6) (6 7 8 9)))
(define v '(1 2 3 4))

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
    nil
    (cons (accumulate op init (map car seqs))
          (accumulate-n op init (map cdr seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(dot-product v v)

(define (matrix-*-vector m v)
  (map (lambda (t) (dot-product t v)) m))

(matrix-*-vector w v)

(define (transpose mat)
  (accumulate-n cons nil mat))

(transpose w)

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row) (matrix-*-vector cols row)) m)))

(matrix-*-matrix w (transpose w))
