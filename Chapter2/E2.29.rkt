#lang sicp

; A binary mobile consists of two branches, a let branch and a right branch.
; Each branch is a rod of a certain length, from which hangs either a weight
; or another binary mobile. We can represent a binary mobile using compound
; data by constructing it from two branches
; (for example, using list):

(define (make-mobile left right)
  (list left right))

; A branch is constructed from a length (which must be a number) together with
; a structure, which may be either a number (representing a simple weight) or 
; another mobile:

(define (make-branch length structure)
  (list length structure))

; a. Write the corresponding selectors left-branch and right-branch, which
; return the branches of a mobile, and branch-length and branch-structure,
; which return the components of a branch.

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))

; b. Using your selectors, define a procedure total-weight that returns the
; total weight of a mobile.

(define (total-weight mobile)
  (if (not (pair? mobile))
    mobile
    (+ (total-weight (branch-structure (left-branch mobile)))
       (total-weight (branch-structure (right-branch mobile))))))

(define x (make-mobile (make-branch 1 2) (make-branch 3 4)))
(define y (make-mobile (make-branch 1 x) (make-branch 4 5)))
(define z (make-mobile (make-branch 3 y) (make-branch 4 x)))
(total-weight x)
(total-weight y)
(total-weight z)

; c. A mobile is said to be balanced if the torque applied by its top-left branch
; is equal to that applied by its top-right branch (that is, if the length of the
; left rod multiplied by the weight hanging from that rod is equal to the
; corresponding product for the right side) and if each of the submobiles hanging
; off its branches is balanced. Design a predicate that tests whether a binary
; mobile is balanced.

(define (weight-length-branch branch)
  (* (branch-length branch)
     (total-weight (branch-structure branch))))

(define (balanced? mobile)
  (if (not (pair? mobile))
    #t
    (let ((left (left-branch mobile))
          (right (right-branch mobile)))
      (if (= (weight-length-branch left)
             (weight-length-branch right))
        (and (balanced? (branch-structure left))
             (balanced? (branch-structure right)))
        #f))))

(define a (make-mobile (make-branch 2 3) (make-branch 2 3))) 
(total-weight a) 

(define d (make-mobile (make-branch 10 a) (make-branch 12 5))) 
(balanced? d) 

 (define m1 (make-mobile 
              (make-branch 4 6) 
              (make-branch 5 
                           (make-mobile 
                             (make-branch 3 7) 
                             (make-branch 9 8))))) 
(balanced? m1)
(define m2 (make-mobile 
             (make-branch 4 6) 
             (make-branch 2 
                          (make-mobile 
                            (make-branch 5 8) 
                            (make-branch 10 4)))))
(balanced? m2)
