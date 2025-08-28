<?php

class URLShortener {
    private $urls = [];

    public function shorten($url) {
        // Generate random 6-character short code
        $short = $this->generateShortCode(6);
        $this->urls[$short] = $url;
        return $short;
    }

    public function getUrl($short) {
        return isset($this->urls[$short]) ? $this->urls[$short] : null;
    }

    private function generateShortCode($length) {
        $characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
        $short = '';
        for ($i = 0; $i < $length; $i++) {
            $short .= $characters[rand(0, strlen($characters) - 1)];
        }
        return $short;
    }
}

// Example usage
if (basename(__FILE__) == basename($_SERVER["SCRIPT_NAME"])) {
    $shortener = new URLShortener();
    $short = $shortener->shorten("https://www.example.com");
    echo "Short URL: " . $short . "\n";
    $original = $shortener->getUrl($short);
    echo "Original URL: " . $original . "\n";
}

?>
