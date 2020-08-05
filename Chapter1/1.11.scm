(define (recursive-f n)
  (cond ((< n 3) n)
        (else (+ (recursive-f (- n 1))
                 (* 2 (recursive-f (- n 2)))
                 (* 3 (recursive-f (- n 3)))))))

(recursive-f 10)


(define (iterative-f n)
  (define (iter-f n f1 f2 f3)
  (if (= n 0) f3
      (iter-f (- n 1)
              (+ f1 (* 2 f2) (* 3 f3))
              f1
              f2)))
  (iter-f n 2 1 0))

(iterative-f 10)
