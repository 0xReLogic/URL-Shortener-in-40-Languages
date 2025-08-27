import hashlib
import random
import string
import time
from typing import Optional, Dict


class URLShortener:
    def __init__(self, code_length: int = 6):
        self.code_length = code_length
        self.url_map: Dict[str, str] = {}
        self.reverse_map: Dict[str, str] = {}
        self.stats: Dict[str, Dict] = {}

    def _generate_code(self) -> str:
        while True:
            code = ''.join(random.choices(string.ascii_letters + string.digits, k=self.code_length))
            if code not in self.url_map:
                return code

    def shorten(self, url: str, custom_code: Optional[str] = None, deterministic: bool = False) -> str:
        if url in self.reverse_map:
            return self.reverse_map[url]

        if custom_code:
            if custom_code in self.url_map:
                raise ValueError("Custom code already in use.")
            code = custom_code
        elif deterministic:
            code = hashlib.md5(url.encode()).hexdigest()[:self.code_length]
            if code in self.url_map and self.url_map[code] != url:
                raise ValueError("Hash collision detected.")
        else:
            code = self._generate_code()

        self.url_map[code] = url
        self.reverse_map[url] = code
        self.stats[code] = {"hits": 0, "created": time.time()}
        return code

    def get_url(self, code: str) -> Optional[str]:
        url = self.url_map.get(code)
        if url:
            self.stats[code]["hits"] += 1
        return url

    def get_code(self, url: str) -> Optional[str]:
        return self.reverse_map.get(url)

    def get_stats(self, code: str) -> Optional[Dict]:
        return self.stats.get(code)


if __name__ == "__main__":
    shortener = URLShortener(code_length=8)

    # Random short code
    code1 = shortener.shorten("https://www.google.com")
    print(f"Short code: {code1}, URL: {shortener.get_url(code1)}")

    # Deterministic short code
    code2 = shortener.shorten("https://www.openai.com", deterministic=True)
    print(f"Short code: {code2}, URL: {shortener.get_url(code2)}")

    # Custom short code
    code3 = shortener.shorten("https://www.github.com", custom_code="gh1234")
    print(f"Short code: {code3}, URL: {shortener.get_url(code3)}")

    # Stats
    print("Stats for Google:", shortener.get_stats(code1))
