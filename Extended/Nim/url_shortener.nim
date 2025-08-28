import tables, random, strutils

type
  URLShortener = ref object
    urls: Table[string, string]

proc newURLShortener(): URLShortener =
  URLShortener(urls: initTable[string, string]())

proc generateShortCode(length: int): string =
  const characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
  result = ""
  for i in 0..<length:
    result.add(characters[rand(characters.high)])

proc shorten(shortener: URLShortener, url: string): string =
  let short = generateShortCode(6)
  shortener.urls[short] = url
  return short

proc getUrl(shortener: URLShortener, short: string): Option[string] =
  if shortener.urls.hasKey(short):
    some(shortener.urls[short])
  else:
    none(string)

# Example usage
when isMainModule:
  randomize()
  let shortener = newURLShortener()
  let short = shortener.shorten("https://www.example.com")
  echo "Short URL: ", short
  
  let original = shortener.getUrl(short)
  if original.isSome:
    echo "Original URL: ", original.get()
  else:
    echo "URL not found"
