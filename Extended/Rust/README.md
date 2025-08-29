# URL Shortener in Rust

A high-performance URL shortener service built with Rust, Axum, and SQLx.

## Features

- Shorten long URLs to short, memorable links
- Redirect short URLs to original URLs
- In-memory mode for testing (no database required)
- PostgreSQL support for production use
- RESTful API

## Prerequisites

- Rust (latest stable version)
- Cargo
- PostgreSQL (optional, for production use)

## Installation

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd url-shortener
   ```

2. Build the project:
   ```bash
   cargo build --release
   ```

## Usage

### Running in in-memory mode (no database required)

```bash
cargo run -- --in-memory
```

### Running with PostgreSQL

1. Make sure PostgreSQL is running
2. Create a database for the URL shortener
3. Run the server with the database URL:

```bash
cargo run -- --database-url "postgresql://username:password@localhost/url_shortener"
```

### API Endpoints

#### Shorten a URL

```bash
POST /shorten
Content-Type: application/json

{
    "url": "https://example.com/very/long/url"
}
```

Response:
```json
{
    "short_code": "abc123"
}
```

#### Access a shortened URL

```
GET /{short_code}
```

This will redirect to the original URL.

#### Health Check

```
GET /health
```

## Configuration

You can configure the server using command-line arguments:

- `--host` or `-H`: Server host (default: 127.0.0.1)
- `--port` or `-p`: Server port (default: 3000)
- `--database-url` or `-d`: PostgreSQL connection URL
- `--in-memory`: Use in-memory storage instead of database

## License

MIT
