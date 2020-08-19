(define (make-rat x y)
  (if (< x 0)
      (cons (- x) (- y))
      (cons x y)))

(make-rat -1 -2)

(make-rat -2 3)
