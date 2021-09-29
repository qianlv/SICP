#lang sicp

; There is a clever algorithm for computing
; the Fibonacci numbers in a logarithmic number of steps.
; Recall the transformation of the state variables a and b in
; the fib-iter process of Section 1.2.2: a <- a +b and b <- a.
; Call this transformation T, and observe that applying T
; over and over againn times, starting with 1 and 0, produces
; the pair Fib(n + 1) and Fib(n). In other words, the Fibonacci
; numbers are produced by applying T^n, the nth power of the
; transformation T, starting with the pair (1, 0). Now consider
; T to be the special case of p = 0 and q = 1 in a family of
; transformations Tpq, where Tpq transforms the pair (a,b)
; according to a <- bq + aq + ap and b <- bp + aq. Show
; that if we apply such a transformation Tpq twice, the effect
; is the same as using a single transformation Tp′q′ of the
; same form, and compute p′ and q′ in terms of p and q. This
; gives us an explicit way to square these transformations,
; and thus we can compute T n using successive squaring, as
; in the fast-expt procedure. Put this all together to com-
; plete the following procedure, which runs in a logarithmic
; number of steps: 

; a <- bq + aq + ap
; b <- bp + aq
; T^2:
; a' <- (bp + aq)q + (bq + aq + ap)q + (aq + aq + ap)p
; 整理:
; a' <- b(2pq + q^2) + a(2pq + q^2) + a(p^2 + q^2)
; 得到:
; q' <- 2pq + q^2
; p' <- p^2 + q^2

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (square x) (* x x))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
       ((even? count)
        (fib-iter a
                  b
                  (+ (square p) (square q)) ; compute p' 
                  (+ (* 2 p q) (square q))  ; compute q'
                  (/ count 2)))
       (else (fib-iter (+ (* b q) (* a q) (* a p))
                       (+ (* b p) (* a q))
                       p
                       q
                       (- count 1)))))

; 还有一种解放:
; 这里解法 Fibonacci 的转换为求矩阵快速幂
; [[1 1] [1 0]] * [a b] = [a + b b]
; 转化为 [[1 1] [1 0]]^n 
