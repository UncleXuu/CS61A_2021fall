(define (my-filter func lst)
  (if (null? lst)
    lst
    (if (func (car lst))
      (cons (car lst) (my-filter func (cdr lst)))
      (my-filter func (cdr lst))
    )
  )
)

(define (interleave s1 s2)
  (if (null? s1)
    (if (null? s2)
      nil
      s2
    )
    (if (null? s2)
      s1
      (cons (car s1) (cons (car s2) (interleave (cdr s1) (cdr s2))))
    )
  )
)

(define (accumulate merger start n term)
  (if (< n 1)
  start
  (merger (term n) (accumulate merger start (- n 1) term))
  )
)

(define (no-repeats lst)
  (if (null? lst)
    lst
    (cons (car lst)
      (no-repeats
        (my-filter (lambda (x) (not (= x (car lst))))
          (cdr lst)))))
)
