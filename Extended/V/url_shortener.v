import rand
import time

struct URLShortener {
mut:
    urls map[string]string
}

fn new_url_shortener() URLShortener {
    return URLShortener{
        urls: map[string]string{}
    }
}

fn (mut s URLShortener) shorten(url string) string {
    short := generate_short_code(6)
    s.urls[short] = url
    return short
}

fn (s URLShortener) get_url(short string) ?string {
    return s.urls[short] or { none }
}

fn generate_short_code(length int) string {
    characters := 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
    mut result := ''
    
    rand.seed(time.now().unix_time())
    
    for _ in 0..length {
        index := rand.int_in_range(0, characters.len) or { 0 }
        result += characters[index].ascii_str()
    }
    
    return result
}

// Example usage
fn main() {
    mut shortener := new_url_shortener()
    short := shortener.shorten('https://www.example.com')
    println('Short URL: ${short}')
    
    if original := shortener.get_url(short) {
        println('Original URL: ${original}')
    } else {
        println('URL not found')
    }
}
