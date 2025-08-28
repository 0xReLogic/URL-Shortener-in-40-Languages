class URLShortener {
    constructor() {
        this.urls = new Map();
    }

    shorten(url) {
        const short = this.generateShortCode();
        this.urls.set(short, url);
        return short;
    }

    getURL(short) {
        return this.urls.get(short);
    }

    generateShortCode() {
        const charset = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
        let result = '';
        for (let i = 0; i < 6; i++) {
            result += charset[Math.floor(Math.random() * charset.length)];
        }
        return result;
    }
}

const shortener = new URLShortener();
const short = shortener.shorten("https://www.example.com");
console.log("Short URL:", short);
const original = shortener.getURL(short);
console.log("Original URL:", original);
