(define (attach-tag type data)
  (if (number? data) data
      (cons type data)))

(define (type-tag num)
  (cond ((pair? num) (car num))
        ((number? num) num)
        (else (error "bad num" num))))

(define (content num)
  (cond ((pair? num) (cdr num))
        ((number? num) num)
        (else (error "bad num" num))))
