-- URL Shortener in SQL (PostgreSQL/MySQL compatible)

-- Create table
CREATE TABLE IF NOT EXISTS urls (
    id SERIAL PRIMARY KEY,
    short_code VARCHAR(6) UNIQUE NOT NULL,
    original_url TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Function to generate short code (conceptual - would need stored procedure)
-- INSERT INTO urls (short_code, original_url) VALUES ('ABC123', 'https://www.example.com');

-- Shorten URL (stored procedure concept)
DELIMITER //
CREATE PROCEDURE ShortenURL(IN input_url TEXT, OUT short_code VARCHAR(6))
BEGIN
    DECLARE code VARCHAR(6) DEFAULT 'ABC123';  -- In real implementation, generate random
    INSERT INTO urls (short_code, original_url) VALUES (code, input_url);
    SET short_code = code;
END //
DELIMITER ;

-- Get original URL
DELIMITER //
CREATE FUNCTION GetOriginalURL(input_short VARCHAR(6)) RETURNS TEXT
READS SQL DATA DETERMINISTIC
BEGIN
    DECLARE result TEXT DEFAULT NULL;
    SELECT original_url INTO result FROM urls WHERE short_code = input_short LIMIT 1;
    RETURN COALESCE(result, 'NOT FOUND');
END //
DELIMITER ;

-- Example usage (would be called from application)
-- CALL ShortenURL('https://www.example.com', @short);
-- SELECT @short AS 'Short URL', GetOriginalURL(@short) AS 'Original URL';
