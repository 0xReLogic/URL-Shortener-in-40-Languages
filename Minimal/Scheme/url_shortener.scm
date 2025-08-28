(define urls '())

(define (generate-short-code length)
  (define chars "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
  (define (random-char)
    (string-ref chars (random (string-length chars))))
  (list->string (map (lambda (x) (random-char)) (iota length))))

(define (shorten-url url)
  (let ((short (generate-short-code 6)))
    (set! urls (cons (cons short url) urls))
    short))

(define (get-url short)
  (let ((entry (assoc short urls)))
    (if entry (cdr entry) #f)))

;; Example usage
(define short (shorten-url "https://www.example.com"))
(display "Short URL: ")
(display short)
(newline)

(define original (get-url short))
(display "Original URL: ")
(display (if original original "NOT FOUND"))
(newline)
