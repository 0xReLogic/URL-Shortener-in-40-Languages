import kotlin.random.Random

class URLShortener {
    private val urls = mutableMapOf<String, String>()

    fun shorten(url: String): String {
        val short = generateShortCode()
        urls[short] = url
        return short
    }

    fun getURL(short: String): String? {
        return urls[short]
    }

    private fun generateShortCode(): String {
        val charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return (1..6)
            .map { charset.random() }
            .joinToString("")
    }
}

fun main() {
    val shortener = URLShortener()
    val short = shortener.shorten("https://www.example.com")
    println("Short URL: $short")
    val original = shortener.getURL(short)
    println("Original URL: $original")
}
