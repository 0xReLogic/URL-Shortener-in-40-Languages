-- URLShortener class
URLShortener = {}
URLShortener.__index = URLShortener

function URLShortener:new()
    local obj = {
        urls = {}
    }
    setmetatable(obj, URLShortener)
    return obj
end

function URLShortener:shorten(url)
    local short = self:generateShortCode(6)
    self.urls[short] = url
    return short
end

function URLShortener:getUrl(short)
    return self.urls[short]
end

function URLShortener:generateShortCode(length)
    local characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    local short = ""
    
    math.randomseed(os.time())
    
    for i = 1, length do
        local index = math.random(1, #characters)
        short = short .. string.sub(characters, index, index)
    end
    
    return short
end

-- Example usage
local shortener = URLShortener:new()
local short = shortener:shorten("https://www.example.com")
print("Short URL: " .. short)
local original = shortener:getUrl(short)
print("Original URL: " .. (original or "nil"))
