import std.stdio;
import std.random;
import std.array;
import std.algorithm;

class URLShortener {
    private string[string] urls;
    
    string shorten(string url) {
        string shortCode = generateShortCode(6);
        urls[shortCode] = url;
        return shortCode;
    }
    
    string getUrl(string shortCode) {
        if (shortCode in urls) {
            return urls[shortCode];
        }
        return null;
    }
    
    private string generateShortCode(int length) {
        immutable string characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        string result = "";
        
        foreach (i; 0..length) {
            result ~= characters[uniform(0, characters.length)];
        }
        
        return result;
    }
}

void main() {
    auto shortener = new URLShortener();
    string shortCode = shortener.shorten("https://www.example.com");
    writeln("Short URL: ", shortCode);
    
    string original = shortener.getUrl(shortCode);
    if (original !is null) {
        writeln("Original URL: ", original);
    } else {
        writeln("URL not found");
    }
}
