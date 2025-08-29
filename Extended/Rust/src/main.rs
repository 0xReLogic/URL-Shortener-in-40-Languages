use axum::{
    routing::{get, post}, 
    Router, 
    Json, 
    extract::Path, 
    http::StatusCode, 
    response::IntoResponse, 
    Extension
};
use serde::{Deserialize, Serialize};
use std::{sync::Arc, collections::HashMap};
use tokio::sync::RwLock;
use sqlx::{Row, PgPool, postgres::PgPoolOptions};
use chrono::Utc;
use clap::Parser;
use thiserror::Error;
use anyhow::Context;

#[derive(Parser, Debug)]
#[command(author, version, about, long_about = None)]
struct Args {
    /// Database URL
    #[arg(short, long, default_value = "postgresql://localhost/url_shortener")]
    database_url: String,

    /// Server host
    #[arg(short = 'H', long, default_value = "127.0.0.1")]
    host: String,

    /// Server port
    #[arg(short, long, default_value = "3000")]
    port: u16,

    /// Enable in-memory mode (no database)
    #[arg(long)]
    in_memory: bool,
}

#[derive(Serialize, Deserialize)]
struct ShortenRequest {
    url: String,
}

#[derive(Serialize, Deserialize)]
struct ShortenResponse {
    short_code: String,
}

struct AppState {
    urls: RwLock<HashMap<String, String>>,
    db_pool: Option<PgPool>,
}

async fn shorten_url(
    Extension(state): Extension<Arc<AppState>>,
    Json(payload): Json<ShortenRequest>,
) -> impl IntoResponse {
    let short_code = if let Some(db_pool) = &state.db_pool {
        shorten_url_db(db_pool, &payload.url, None).await.unwrap()
    } else {
        let mut urls = state.urls.write().await;
        let short_code = generate_short_code();
        urls.insert(short_code.clone(), payload.url);
        short_code
    };
    Json(ShortenResponse { short_code })
}

async fn redirect_url(
    Extension(state): Extension<Arc<AppState>>,
    Path(code): Path<String>,
) -> impl IntoResponse {
    let url = if let Some(db_pool) = &state.db_pool {
        get_url_db(db_pool, &code).await.unwrap()
    } else {
        let urls = state.urls.read().await;
        urls.get(&code).cloned()
    };
    match url {
        Some(url) => axum::response::Redirect::temporary(&url).into_response(),
        None => (StatusCode::NOT_FOUND, "URL not found").into_response(),
    }
}

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    let args = Args::parse();

    let db_pool = if args.in_memory {
        None
    } else {
        Some(PgPoolOptions::new()
            .max_connections(5)
            .connect(&args.database_url)
            .await
            .context("Failed to connect to database")?)
    };

    if let Some(db_pool) = &db_pool {
        create_tables(db_pool).await?;
    }

    let state = Arc::new(AppState {
        urls: RwLock::new(HashMap::new()),
        db_pool,
    });

    let app = Router::new()
        .route("/shorten", post(shorten_url))
        .route("/:code", get(redirect_url))
        .layer(Extension(state));

    let listener = tokio::net::TcpListener::bind(format!("{}:{}", args.host, args.port)).await?;
    axum::serve(listener, app).await?;
    Ok(())
}

fn generate_short_code() -> String {
    use rand::{Rng, thread_rng};
    use rand::distributions::Alphanumeric;

    thread_rng()
        .sample_iter(&Alphanumeric)
        .take(6)
        .map(char::from)
        .collect()
}

#[derive(sqlx::FromRow)]
#[allow(dead_code)]
struct UrlEntry {
    short_code: String,
    original_url: String,
    hits: i64,
    created_at: chrono::DateTime<Utc>,
    last_accessed: Option<chrono::DateTime<Utc>>,
}

async fn create_tables(pool: &PgPool) -> Result<(), sqlx::Error> {
    sqlx::query(
        r#"
        CREATE TABLE IF NOT EXISTS urls (
            short_code VARCHAR(10) PRIMARY KEY,
            original_url TEXT NOT NULL,
            hits BIGINT DEFAULT 0,
            created_at TIMESTAMPTZ DEFAULT NOW(),
            last_accessed TIMESTAMPTZ
        )
        "#
    ).execute(pool).await?;
    Ok(())
}

async fn shorten_url_db(
    pool: &PgPool, 
    url: &str,
    custom_code: Option<&str>
) -> Result<String, sqlx::Error> {
    let code = match custom_code {
        Some(code) => code.to_string(),
        None => generate_short_code()
    };
    
    sqlx::query(
        "INSERT INTO urls (short_code, original_url) VALUES ($1, $2)"
    )
    .bind(code.clone())
    .bind(url)
    .execute(pool)
    .await?;
    
    Ok(code.to_string())
}

async fn get_url_db(
    pool: &PgPool, 
    code: &str
) -> Result<Option<String>, sqlx::Error> {
    let result = sqlx::query(
        "UPDATE urls SET hits = hits + 1, last_accessed = NOW() 
         WHERE short_code = $1 RETURNING original_url"
    )
    .bind(code)
    .fetch_optional(pool)
    .await?;
    
    Ok(result.map(|row| row.get::<String, _>("original_url")))
}

#[derive(Error, Debug)]
enum AppError {
    #[error("Database error: {0}")]
    DatabaseError(#[from] sqlx::Error),
}
