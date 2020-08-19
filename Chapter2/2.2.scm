(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (make-segment p1 p2)
  (cons p1 p2))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (midpoint-segment s)
  (let ((avg (lambda (a b) (/ ( + a b) 2))))
    (make-point (avg (x-point (start-segment s))
                     (x-point (end-segment s)))
                (avg (y-point (start-segment s))
                     (y-point (end-segment s))))))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(print-point (midpoint-segment
              (make-segment (make-point 1 1)
                            (make-point 3 3))))
