use std::collections::HashMap;
use rand::{Rng, thread_rng};
use rand::distributions::Alphanumeric;

fn generate_short_code() -> String {
    thread_rng()
        .sample_iter(&Alphanumeric)
        .take(6)
        .map(char::from)
        .collect()
}

struct URLShortener {
    urls: HashMap<String, String>,
}

impl URLShortener {
    fn new() -> Self {
        URLShortener {
            urls: HashMap::new(),
        }
    }

    fn shorten(&mut self, url: String) -> String {
        let short = generate_short_code();
        self.urls.insert(short.clone(), url);
        short
    }

    fn get_url(&self, short: &str) -> Option<&String> {
        self.urls.get(short)
    }
}

fn main() {
    let mut shortener = URLShortener::new();
    let short = shortener.shorten("https://www.example.com".to_string());
    println!("Short URL: {}", short);
    if let Some(original) = shortener.get_url(&short) {
        println!("Original URL: {}", original);
    }
}
