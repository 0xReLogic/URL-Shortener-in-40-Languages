mutable struct URLShortener
    urls::Dict{String, String}
    
    URLShortener() = new(Dict{String, String}())
end

function shorten!(shortener::URLShortener, url::String)
    short = generate_short_code(6)
    shortener.urls[short] = url
    return short
end

function get_url(shortener::URLShortener, short::String)
    return get(shortener.urls, short, nothing)
end

function generate_short_code(length::Int)
    characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    short = ""
    
    for i in 1:length
        index = rand(1:length(characters))
        short *= characters[index]
    end
    
    return short
end

# Example usage
shortener = URLShortener()
short = shorten!(shortener, "https://www.example.com")
println("Short URL: $short")

original = get_url(shortener, short)
if original !== nothing
    println("Original URL: $original")
else
    println("URL not found")
end
