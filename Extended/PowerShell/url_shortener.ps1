# URL Shortener in PowerShell

class URLShortener {
    [hashtable]$urls = @{}
    
    [string] Shorten([string]$url) {
        $short = $this.GenerateShortCode(6)
        $this.urls[$short] = $url
        return $short
    }
    
    [string] GetUrl([string]$short) {
        if ($this.urls.ContainsKey($short)) {
            return $this.urls[$short]
        }
        return $null
    }
    
    [string] GenerateShortCode([int]$length) {
        $characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        $result = ""
        
        for ($i = 0; $i -lt $length; $i++) {
            $index = Get-Random -Maximum $characters.Length
            $result += $characters[$index]
        }
        
        return $result
    }
}

# Example usage
$shortener = [URLShortener]::new()
$short = $shortener.Shorten("https://www.example.com")
Write-Host "Short URL: $short"

$original = $shortener.GetUrl($short)
if ($original) {
    Write-Host "Original URL: $original"
} else {
    Write-Host "URL not found"
}
