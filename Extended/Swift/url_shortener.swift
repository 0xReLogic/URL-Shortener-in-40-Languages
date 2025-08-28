import Foundation

class URLShortener {
    private var urls: [String: String] = [:]
    
    func shorten(_ url: String) -> String {
        let short = generateShortCode(length: 6)
        urls[short] = url
        return short
    }
    
    func getUrl(_ short: String) -> String? {
        return urls[short]
    }
    
    private func generateShortCode(length: Int) -> String {
        let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map { _ in characters.randomElement()! })
    }
}

// Example usage
let shortener = URLShortener()
let short = shortener.shorten("https://www.example.com")
print("Short URL: \(short)")
if let original = shortener.getUrl(short) {
    print("Original URL: \(original)")
}
