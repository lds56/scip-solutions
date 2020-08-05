(define (approx-integral f a b n)
  (define h (/ (- b a) n ))
  (define (sum-iter k sum)
    (define x (+ a (* k h)))
    (if (= k n) (+ sum (f x))
        (sum-iter (+ k 1)
                  (+ sum (if (even? k)
                             (* 2 (f x))
                             (* 4 (f x)))))))
  (* (sum-iter 1 (f a)) (/ h 3)))

(define (cube x) (* x x x))

(approx-integral cube 0 1 100)
