import hashlib
import random
import string

class URLShortener:
    def __init__(self):
        self.urls = {}

    def shorten(self, url):
        # Generate random short code (6 characters)
        short = ''.join(random.choices(string.ascii_letters + string.digits, k=6))
        self.urls[short] = url
        return short

    def get_url(self, short):
        return self.urls.get(short)

# Example usage
if __name__ == "__main__":
    shortener = URLShortener()
    short = shortener.shorten("https://www.example.com")
    print(f"Short URL: {short}")
    original = shortener.get_url(short)
    print(f"Original URL: {original}")