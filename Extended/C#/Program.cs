using System;
using System.Collections.Generic;

class URLShortener {
    private Dictionary<string, string> urls = new Dictionary<string, string>();

    public string Shorten(string url) {
        string short = GenerateShortCode();
        urls[short] = url;
        return short;
    }

    public string GetURL(string short) {
        if (urls.ContainsKey(short)) {
            return urls[short];
        }
        return null;
    }

    private string GenerateShortCode() {
        const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        Random random = new Random();
        char[] result = new char[6];
        for (int i = 0; i < 6; i++) {
            result[i] = chars[random.Next(chars.Length)];
        }
        return new string(result);
    }
}

class Program {
    static void Main() {
        URLShortener shortener = new URLShortener();
        string short = shortener.Shorten("https://www.example.com");
        Console.WriteLine("Short URL: " + short);
        string original = shortener.GetURL(short);
        Console.WriteLine("Original URL: " + original);
    }
}
