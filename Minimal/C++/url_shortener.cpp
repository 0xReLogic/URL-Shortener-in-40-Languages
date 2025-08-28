#include <iostream>
#include <map>
#include <string>
#include <random>
#include <algorithm>

class URLShortener {
private:
    std::map<std::string, std::string> urls;
    std::string generateShortCode() {
        const std::string charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        std::string result;
        std::random_device rd;
        std::mt19937 gen(rd());
        std::uniform_int_distribution<> dis(0, charset.size() - 1);
        for (int i = 0; i < 6; ++i) {
            result += charset[dis(gen)];
        }
        return result;
    }
public:
    std::string shorten(const std::string& url) {
        std::string short = generateShortCode();
        urls[short] = url;
        return short;
    }
    std::string getURL(const std::string& short) {
        auto it = urls.find(short);
        if (it != urls.end()) {
            return it->second;
        }
        return "";
    }
};

int main() {
    URLShortener shortener;
    std::string short = shortener.shorten("https://www.example.com");
    std::cout << "Short URL: " << short << std::endl;
    std::string original = shortener.getURL(short);
    std::cout << "Original URL: " << original << std::endl;
    return 0;
}
