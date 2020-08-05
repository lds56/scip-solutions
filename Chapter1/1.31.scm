(define (product term a next b)
  (if (> a b) 1
      (* (product term (next a) next b)
         (term a))))

(define (identity x) x)

(define (inc x) (+ x 1))

(product identity 1 inc 4)

;; (define (pi-term x))

;; (define (pi-next x)
  ;;(if (< ((car x) (cdr x)))
  ;;    ((+ (car x) 2) (cdr x))
  ;;    ((car x) (+ (cdr x) 2))))

(define (pi-term x)
  (exact->inexact
   (if (= (remainder x 4) 1)
       (/ (/ (- x 1) 2) (/ (+ x 1) 2))
       (/ (/ (+ x 1) 2) (/ (- x 1) 2)))))

(define (pi-next x) (+ x 2))

(define (approx-pi n)
  (product pi-term 5 pi-next (+ (* n 2) 3)))

(* (approx-pi 1000) 4)
