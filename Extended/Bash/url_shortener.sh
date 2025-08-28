#!/bin/bash

# URL Shortener in Bash
declare -A urls

generate_short_code() {
    local length=${1:-6}
    local chars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    local result=""
    
    for ((i=0; i<$length; i++)); do
        result+=${chars:$((RANDOM % ${#chars})):1}
    done
    
    echo "$result"
}

shorten_url() {
    local url="$1"
    local short=$(generate_short_code)
    urls["$short"]="$url"
    echo "$short"
}

get_url() {
    local short="$1"
    echo "${urls[$short]}"
}

# Example usage
url="https://www.example.com"
short=$(shorten_url "$url")
echo "Short URL: $short"

original=$(get_url "$short")
echo "Original URL: $original"
