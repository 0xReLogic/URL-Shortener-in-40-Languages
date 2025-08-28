" URL Shortener in Smalltalk "

Object subclass: URLShortener [
    | urls |
    
    initialize [
        urls := Dictionary new.
    ]
    
    generateShortCode: length [
        | characters result |
        characters := 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'.
        result := ''.
        1 to: length do: [ :i |
            result := result, (characters at: (Random between: 1 and: characters size)).
        ].
        ^ result
    ]
    
    shortenUrl: url [
        | short |
        short := self generateShortCode: 6.
        urls at: short put: url.
        ^ short
    ]
    
    getUrl: short [
        ^ urls at: short ifAbsent: [ nil ]
    ]
]

" Example usage "
| shortener short original |
shortener := URLShortener new initialize.
short := shortener shortenUrl: 'https://www.example.com'.
('Short URL: ', short) printNl.

original := shortener getUrl: short.
('Original URL: ', (original ifNil: ['NOT FOUND'])) printNl.
