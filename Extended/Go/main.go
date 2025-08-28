package main

import (
    "fmt"
    "math/rand"
    "time"
)

type URLShortener struct {
    urls map[string]string
}

func NewURLShortener() *URLShortener {
    return &URLShortener{urls: make(map[string]string)}
}

func (u *URLShortener) Shorten(url string) string {
    rand.Seed(time.Now().UnixNano())
    short := generateShortCode()
    u.urls[short] = url
    return short
}

func (u *URLShortener) GetURL(short string) string {
    return u.urls[short]
}

func generateShortCode() string {
    const charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    b := make([]byte, 6)
    for i := range b {
        b[i] = charset[rand.Intn(len(charset))]
    }
    return string(b)
}

func main() {
    shortener := NewURLShortener()
    short := shortener.Shorten("https://www.example.com")
    fmt.Println("Short URL:", short)
    original := shortener.GetURL(short)
    fmt.Println("Original URL:", original)
}
