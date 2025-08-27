# URL Shortener Experiment

Experiment implementing a simple URL shortener in 8 different programming languages.

## Languages Implemented

- **Python** (`Python/url_shortener.py`)
- **Rust** (`Rust/`)
- **Go** (`Go/main.go`)
- **Kotlin** (`Kotlin/Main.kt`)
- **Ruby** (`Ruby/url_shortener.rb`)
- **TypeScript** (`TypeScript/url_shortener.js`)
- **C++** (`C++/url_shortener.cpp`)
- **C#** (`C#/Program.cs`)

## Features

- Generate random 6-character short code for URLs
- Store mappings in memory (dict/map)
- Retrieve original URL from short code

## How to Run

### Python
```bash
cd Python
python url_shortener.py
```

### Rust
```bash
cd Rust
cargo run
```

### Go
```bash
cd Go
go run main.go
```

### Kotlin
```bash
cd Kotlin
kotlin Main.kt
```
(or compile with kotlinc and run JAR)

### Ruby
```bash
cd Ruby
ruby url_shortener.rb
```

### TypeScript/JavaScript
```bash
cd TypeScript
node url_shortener.js
```

### C++
```bash
cd C++
g++ url_shortener.cpp -o url_shortener
./url_shortener
```

### C#
```bash
cd C#
csc Program.cs
Program.exe
```

## Example Output

```
Short URL: 5zezLq
Original URL: https://www.example.com
```

## Notes

- This is a basic implementation for educational purposes.
- No persistence; URLs are stored in memory only.
- Can be extended with databases, web APIs, etc.
