#!/usr/bin/awk -f

# URL Shortener in AWK

BEGIN {
    srand()  # Seed random number generator
    
    # Example usage
    url = "https://www.example.com"
    short = shorten_url(url)
    printf "Short URL: %s\n", short
    
    original = get_url(short)
    printf "Original URL: %s\n", original
}

function generate_short_code(length) {
    chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    result = ""
    
    for (i = 1; i <= length; i++) {
        pos = int(rand() * length(chars)) + 1
        result = result substr(chars, pos, 1)
    }
    
    return result
}

function shorten_url(url) {
    short = generate_short_code(6)
    urls[short] = url
    return short
}

function get_url(short) {
    if (short in urls) {
        return urls[short]
    } else {
        return "NOT FOUND"
    }
}
