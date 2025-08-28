-module(url_shortener).
-export([start/0, shorten/2, get_url/2, generate_short_code/1]).

% Start a new URL shortener process
start() ->
    spawn(fun() -> loop(#{}) end).

% Shorten a URL
shorten(Pid, Url) ->
    Pid ! {shorten, Url, self()},
    receive
        {short_code, ShortCode} -> ShortCode
    after 5000 ->
        timeout
    end.

% Get original URL from short code
get_url(Pid, ShortCode) ->
    Pid ! {get_url, ShortCode, self()},
    receive
        {url, Url} -> Url;
        not_found -> not_found
    after 5000 ->
        timeout
    end.

% Generate random short code
generate_short_code(Length) ->
    Characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789",
    generate_short_code(Length, Characters, []).

generate_short_code(0, _Characters, Acc) ->
    lists:reverse(Acc);
generate_short_code(Length, Characters, Acc) ->
    Index = rand:uniform(length(Characters)),
    Char = lists:nth(Index, Characters),
    generate_short_code(Length - 1, Characters, [Char | Acc]).

% Main process loop
loop(UrlMap) ->
    receive
        {shorten, Url, From} ->
            ShortCode = generate_short_code(6),
            NewUrlMap = maps:put(ShortCode, Url, UrlMap),
            From ! {short_code, ShortCode},
            loop(NewUrlMap);
        {get_url, ShortCode, From} ->
            case maps:find(ShortCode, UrlMap) of
                {ok, Url} ->
                    From ! {url, Url};
                error ->
                    From ! not_found
            end,
            loop(UrlMap)
    end.

% Example usage
example() ->
    Shortener = start(),
    ShortCode = shorten(Shortener, "https://www.example.com"),
    io:format("Short URL: ~s~n", [ShortCode]),
    case get_url(Shortener, ShortCode) of
        not_found ->
            io:format("URL not found~n");
        Url ->
            io:format("Original URL: ~s~n", [Url])
    end.
