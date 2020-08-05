(define (fast-mult a b)
  (define (double x) (+ x x))
  (define (halve  x) (/ x 2))
  (cond ((= b 1) a)
        ((even? b) (double (fast-mult a (halve b))))
        (else (+ (double (fast-mult a (halve (- b 1)))) a))))

(fast-mult 10 5)
