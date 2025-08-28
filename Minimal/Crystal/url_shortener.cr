class URLShortener
  def initialize
    @urls = {} of String => String
  end

  def shorten(url : String) : String
    short = generate_short_code(6)
    @urls[short] = url
    short
  end

  def get_url(short : String) : String?
    @urls[short]?
  end

  private def generate_short_code(length : Int32) : String
    characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    result = ""
    length.times do
      result += characters[Random.rand(characters.size)]
    end
    result
  end
end

# Example usage
shortener = URLShortener.new
short = shortener.shorten("https://www.example.com")
puts "Short URL: #{short}"

if original = shortener.get_url(short)
  puts "Original URL: #{original}"
else
  puts "URL not found"
end
