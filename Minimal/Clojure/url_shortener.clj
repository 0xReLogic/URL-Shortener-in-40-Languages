(ns url-shortener.core)

(defn generate-short-code [length]
  (let [characters "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"]
    (->> characters
         (repeatedly #(rand-nth %))
         (take length)
         (apply str))))

(defn create-shortener []
  (atom {}))

(defn shorten! [shortener url]
  (let [short (generate-short-code 6)]
    (swap! shortener assoc short url)
    short))

(defn get-url [shortener short]
  (get @shortener short))

;; Example usage
(defn -main []
  (let [shortener (create-shortener)
        short (shorten! shortener "https://www.example.com")]
    (println (str "Short URL: " short))
    (if-let [original (get-url shortener short)]
      (println (str "Original URL: " original))
      (println "URL not found"))))

(-main)
