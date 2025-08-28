# URL Shortener in 8 Languages

A URL shortener implementation across 8 different programming languages, available in two versions:

## Project Structure

### Minimal Version
Simple, pure implementations focusing on core functionality only. Perfect for learning the basic concepts.

### Extended Version  
Enhanced versions with additional features for experimentation and advanced use cases.

## Languages Implemented

Both Minimal and Extended versions include:
- **Python** 
- **Rust**
- **Go**
- **Kotlin** 
- **Ruby** 
- **TypeScript**
- **C++**
- **C#**

## Core Features

- Generate random 6-character short code for URLs
- Store URL mappings in memory
- Retrieve original URL from short code
- Simple CLI interface

## Example Output

```
Short URL: 5zezLq
Original URL: https://www.example.com
```

## How to Run

Choose either Minimal or Extended version, then navigate to the language folder:

### Minimal Version (Simple Implementation)
```bash
cd Minimal/[Language]
# Then run the appropriate command below
```

### Extended Version (Advanced Features)
```bash
cd Extended/[Language]
# Then run the appropriate command below
```

### Language-Specific Commands

**Python**
```bash
python url_shortener.py
```

**Rust**
```bash
cargo run
```

**Go**
```bash
go run main.go
```

**Kotlin**
```bash
kotlin Main.kt
```

**Ruby**
```bash
ruby url_shortener.rb
```

**TypeScript**
```bash
node url_shortener.js
```

**C++**
```bash
g++ url_shortener.cpp -o url_shortener
./url_shortener
```

**C#**
```bash
csc Program.cs
Program.exe
```

## Contributing & Experimentation

For those who want to contribute or experiment with advanced features, use the **Extended** folder:

- Add new features like web APIs, database persistence, custom short codes, etc.
- Experiment with different algorithms or data structures
- Add unit tests and error handling
- Implement additional functionality while keeping the core concept intact

The Extended versions are perfect for trying out new ideas and improvements.

## Notes

- Basic implementation for learning purposes
- No persistence (in-memory only)
- Extendable to databases/web APIs
