function url_shortener_demo()
    % URL Shortener in MATLAB
    
    % Create persistent storage using global variable
    global urls_db;
    if isempty(urls_db)
        urls_db = containers.Map();
    end
    
    % Example usage
    url = 'https://www.example.com';
    short = shorten_url(url);
    fprintf('Short URL: %s\n', short);
    
    original = get_url(short);
    fprintf('Original URL: %s\n', original);
end

function short = shorten_url(url)
    global urls_db;
    short = generate_short_code(6);
    urls_db(short) = url;
end

function url = get_url(short)
    global urls_db;
    if urls_db.isKey(short)
        url = urls_db(short);
    else
        url = 'NOT FOUND';
    end
end

function short = generate_short_code(length)
    chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    indices = randi([1 length(chars)], 1, length);
    short = chars(indices);
end
