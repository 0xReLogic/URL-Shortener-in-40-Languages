import scala.util.Random
import scala.collection.mutable

class URLShortener {
  private val urls = mutable.Map[String, String]()
  
  def shorten(url: String): String = {
    val short = generateShortCode(6)
    urls(short) = url
    short
  }
  
  def getUrl(short: String): Option[String] = {
    urls.get(short)
  }
  
  private def generateShortCode(length: Int): String = {
    val characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    (1 to length).map(_ => characters(Random.nextInt(characters.length))).mkString
  }
}

// Example usage
object URLShortenerApp extends App {
  val shortener = new URLShortener()
  val short = shortener.shorten("https://www.example.com")
  println(s"Short URL: $short")
  shortener.getUrl(short) match {
    case Some(original) => println(s"Original URL: $original")
    case None => println("URL not found")
  }
}
