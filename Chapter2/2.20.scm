(define nil '())

(define (same-parity first . left)
  (define (same-par x y)
    (even? (- x y)))
  (define (same-parity-with l)
    (if (null? l) nil
        (let ((ll (same-parity-with (cdr l))))
          (if (same-par first (car l))
              (cons (car l) ll)
              ll))))
  (cons first (same-parity-with left)))

(same-parity 1 2 3 4 5 6 7)

(same-parity 2 3 4 5 6 7)
