(define (pascal-tri row col)
  (cond ((or  (= col 0) (= col (+ row 1))) 0)
        ((and (= col 1) (= row 1)) 1)
        (else (+ (pascal-tri (- row 1) col)
                 (pascal-tri (- row 1) (- col 1))))))

(pascal-tri 1 1)
(pascal-tri 5 3)
