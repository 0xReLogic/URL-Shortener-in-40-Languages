import 'dart:math';

class URLShortener {
  Map<String, String> _urls = {};
  
  String shorten(String url) {
    String short = _generateShortCode(6);
    _urls[short] = url;
    return short;
  }
  
  String? getUrl(String short) {
    return _urls[short];
  }
  
  String _generateShortCode(int length) {
    const String characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Random random = Random();
    String short = '';
    
    for (int i = 0; i < length; i++) {
      short += characters[random.nextInt(characters.length)];
    }
    
    return short;
  }
}

// Example usage
void main() {
  URLShortener shortener = URLShortener();
  String short = shortener.shorten("https://www.example.com");
  print("Short URL: $short");
  String? original = shortener.getUrl(short);
  print("Original URL: $original");
}
