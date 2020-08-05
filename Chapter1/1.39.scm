; definition of pi
(define pi (* 4 (atan 1.0)))

; degree -> radian
(define (radian deg)
  (* deg (/ pi 180.0)))

(define (tan-cf x n)
  (define (tantan x k n)
    (let ((num (- (* 2 k) 1)))
      (if (= k n) num
          (- num
             (/ (* x x)
                (tantan x (+ k 1) n))))))
  (/ x (tantan x 1 n)))

(tan-cf (radian 45) 100)
