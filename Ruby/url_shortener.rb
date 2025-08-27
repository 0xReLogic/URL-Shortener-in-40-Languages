class URLShortener
  def initialize
    @urls = {}
  end

  def shorten(url)
    short = generate_short_code
    @urls[short] = url
    short
  end

  def get_url(short)
    @urls[short]
  end

  private
  def generate_short_code
    (0...6).map { (('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a).sample }.join
  end
end

shortener = URLShortener.new
short = shortener.shorten("https://www.example.com")
puts "Short URL: #{short}"
original = shortener.get_url(short)
puts "Original URL: #{original}"
