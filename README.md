# URL Shortener in 40 Languages

A URL shortener implementation across 40 different programming languages, available in two versions:

## Project Structure

### Minimal Version
Simple, pure implementations focusing on core functionality only. Perfect for learning the basic concepts.

### Extended Version  
Enhanced versions with additional features for experimentation and advanced use cases.

## Languages Implemented

Both Minimal and Extended versions include all 40 languages:

**Modern Languages:**
- **Python**, **Rust**, **Go**, **Kotlin**, **Ruby**, **TypeScript**, **C++**, **C#**
- **PHP**, **Swift**, **Haskell**, **Zig**, **Dart**, **Scala**, **Elixir**
- **Lua**, **Perl**, **F#**, **Julia**, **Clojure**, **OCaml**, **Crystal**
- **Nim**, **V**, **Erlang**

**Classic & Specialty Languages:**
- **Assembly**, **COBOL**, **Fortran**, **Prolog**, **R**
- **Bash**, **PowerShell**, **AWK**, **Pascal**, **D**
- **Scheme**, **Racket**, **Smalltalk**, **Brainfuck**, **MATLAB**, **SQL**

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

**PHP**
```bash
php url_shortener.php
```

**Swift**
```bash
swift url_shortener.swift
```

**Haskell**
```bash
ghc url_shortener.hs && ./url_shortener
```

**Zig**
```bash
zig run url_shortener.zig
```

**Dart**
```bash
dart url_shortener.dart
```

**Scala**
```bash
scala url_shortener.scala
```

**Elixir**
```bash
elixir url_shortener.ex
```

**Lua**
```bash
lua url_shortener.lua
```

**Perl**
```bash
perl url_shortener.pl
```

**F#**
```bash
fsharpc url_shortener.fs && mono url_shortener.exe
```

**Julia**
```bash
julia url_shortener.jl
```

**Clojure**
```bash
clojure -M url_shortener.clj
```

**OCaml**
```bash
ocamlc -o url_shortener url_shortener.ml && ./url_shortener
```

**Crystal**
```bash
crystal run url_shortener.cr
```

**Nim**
```bash
nim c -r url_shortener.nim
```

**V**
```bash
v run url_shortener.v
```

**Erlang**
```bash
erl -compile url_shortener && erl -noshell -s url_shortener example -s init stop
```

**Assembly**
```bash
nasm -f elf64 url_shortener.asm && ld url_shortener.o && ./a.out
```

**COBOL**
```bash
cobc -x url_shortener.cob && ./url_shortener
```

**Fortran**
```bash
gfortran url_shortener.f90 -o url_shortener && ./url_shortener
```

**Prolog**
```bash
swipl -s url_shortener.pl
```

**R**
```bash
Rscript url_shortener.R
```

**Bash**
```bash
chmod +x url_shortener.sh && ./url_shortener.sh
```

**PowerShell**
```bash
pwsh url_shortener.ps1
```

**AWK**
```bash
awk -f url_shortener.awk
```

**Pascal**
```bash
fpc url_shortener.pas && ./url_shortener
```

**D**
```bash
dmd url_shortener.d && ./url_shortener
```

**Scheme**
```bash
scheme --load url_shortener.scm
```

**Racket**
```bash
racket url_shortener.rkt
```

**Smalltalk**
```bash
gst url_shortener.st
```

**Brainfuck**
```bash
bf url_shortener.bf
```

**MATLAB**
```bash
matlab -batch "url_shortener_demo"
```

**SQL**
```bash
mysql < url_shortener.sql
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
