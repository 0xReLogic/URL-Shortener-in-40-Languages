# URL Shortener in R

URLShortener <- function() {
  urls <- list()
  
  list(
    shorten = function(url) {
      # Generate random 6-character short code
      short <- paste0(sample(c(letters, LETTERS, 0:9), 6, replace = TRUE), collapse = "")
      urls[[short]] <<- url
      return(short)
    },
    
    get_url = function(short) {
      if (short %in% names(urls)) {
        return(urls[[short]])
      } else {
        return(NULL)
      }
    }
  )
}

# Example usage
shortener <- URLShortener()
short <- shortener$shorten("https://www.example.com")
cat("Short URL:", short, "\n")

original <- shortener$get_url(short)
if (!is.null(original)) {
  cat("Original URL:", original, "\n")
} else {
  cat("URL not found\n")
}
