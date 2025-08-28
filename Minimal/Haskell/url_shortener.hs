import qualified Data.Map as Map
import System.Random

data URLShortener = URLShortener { urls :: Map.Map String String } deriving (Show)

emptyShortener :: URLShortener
emptyShortener = URLShortener Map.empty

shorten :: URLShortener -> String -> IO (String, URLShortener)
shorten shortener url = do
    short <- generateShortCode 6
    let newUrls = Map.insert short url (urls shortener)
    return (short, URLShortener newUrls)

getUrl :: URLShortener -> String -> Maybe String
getUrl shortener short = Map.lookup short (urls shortener)

generateShortCode :: Int -> IO String
generateShortCode n = do
    gen <- newStdGen
    let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    return $ take n $ randomRs (0, length characters - 1) gen >>= \i -> [characters !! i]

-- Example usage
main :: IO ()
main = do
    let shortener = emptyShortener
    (short, newShortener) <- shorten shortener "https://www.example.com"
    putStrLn $ "Short URL: " ++ short
    case getUrl newShortener short of
        Just original -> putStrLn $ "Original URL: " ++ original
        Nothing -> putStrLn "URL not found"
