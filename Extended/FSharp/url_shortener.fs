open System
open System.Collections.Generic

type URLShortener() =
    let urls = Dictionary<string, string>()
    let random = Random()
    
    member this.Shorten(url: string) =
        let short = this.GenerateShortCode(6)
        urls.[short] <- url
        short
    
    member this.GetUrl(short: string) =
        match urls.TryGetValue(short) with
        | true, url -> Some url
        | false, _ -> None
    
    member private this.GenerateShortCode(length: int) =
        let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let chars = Array.init length (fun _ -> characters.[random.Next(characters.Length)])
        String(chars)

// Example usage
[<EntryPoint>]
let main argv =
    let shortener = URLShortener()
    let short = shortener.Shorten("https://www.example.com")
    printfn "Short URL: %s" short
    
    match shortener.GetUrl(short) with
    | Some original -> printfn "Original URL: %s" original
    | None -> printfn "URL not found"
    
    0
