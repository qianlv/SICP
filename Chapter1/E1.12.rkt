#lang sicp

; The following paern of numbers is called Pascal’s triangle.
; 1
; 1 1
; 1 2 1
; 1 3 3 1
; 1 4 6 4 1
;    ...

; The numbers at the edge of the triangle are all 1, and each
; number inside the triangle is the sum of the two numbers
; above it. Write a procedure that computes elements of
; Pascal’s triangle by means of a recursive process.

(define (pascal-triangle row col)
  (cond ((= col 0) 1)
        ((= row col) 1)
        (else (+ (pascal-triangle (- row 1) col)
                 (pascal-triangle (- row 1) (- col 1))))))

(pascal-triangle 4 0)
(pascal-triangle 4 1)
(pascal-triangle 4 2)
(pascal-triangle 4 3)
(pascal-triangle 4 4)

; 迭代版本, 参考: https://sicp.readthedocs.io/en/latest/chp1/12.html
; 直接用公式

; 或是通过记忆化, 提高效率, 减少重复