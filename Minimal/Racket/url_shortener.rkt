#lang racket

(define urls (make-hash))

(define (generate-short-code length)
  (define chars "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
  (list->string 
    (for/list ([i (in-range length)])
      (string-ref chars (random (string-length chars))))))

(define (shorten-url url)
  (define short (generate-short-code 6))
  (hash-set! urls short url)
  short)

(define (get-url short)
  (hash-ref urls short #f))

;; Example usage
(define short (shorten-url "https://www.example.com"))
(printf "Short URL: ~a\n" short)

(define original (get-url short))
(printf "Original URL: ~a\n" (if original original "NOT FOUND"))
