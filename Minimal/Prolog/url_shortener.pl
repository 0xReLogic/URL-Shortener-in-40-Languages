% URL Shortener in Prolog
% Database to store URL mappings
:- dynamic url_mapping/2.

% Generate a simple short code (in real implementation, this would be random)
generate_short_code('ABC123').

% Shorten URL predicate
shorten_url(LongUrl, ShortCode) :-
    generate_short_code(ShortCode),
    assertz(url_mapping(ShortCode, LongUrl)).

% Get original URL from short code
get_original_url(ShortCode, LongUrl) :-
    url_mapping(ShortCode, LongUrl).

% Example usage
demo :-
    LongUrl = 'https://www.example.com',
    shorten_url(LongUrl, ShortCode),
    format('Short URL: ~w~n', [ShortCode]),
    get_original_url(ShortCode, OriginalUrl),
    format('Original URL: ~w~n', [OriginalUrl]).

% Run the demo
:- demo.
