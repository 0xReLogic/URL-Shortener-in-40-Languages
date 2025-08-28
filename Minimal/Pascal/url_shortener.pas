program URLShortener;
uses SysUtils;

type
  TURLEntry = record
    ShortCode: string[6];
    URL: string[200];
  end;

var
  URLs: array[1..100] of TURLEntry;
  URLCount: Integer;

function GenerateShortCode: string;
const
  Characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
var
  i: Integer;
  Result: string;
begin
  Result := '';
  Randomize;
  for i := 1 to 6 do
  begin
    Result := Result + Characters[Random(Length(Characters)) + 1];
  end;
  GenerateShortCode := Result;
end;

function ShortenURL(const URL: string): string;
var
  ShortCode: string;
begin
  ShortCode := GenerateShortCode;
  Inc(URLCount);
  URLs[URLCount].ShortCode := ShortCode;
  URLs[URLCount].URL := URL;
  ShortenURL := ShortCode;
end;

function GetURL(const ShortCode: string): string;
var
  i: Integer;
begin
  GetURL := 'NOT FOUND';
  for i := 1 to URLCount do
  begin
    if URLs[i].ShortCode = ShortCode then
    begin
      GetURL := URLs[i].URL;
      Break;
    end;
  end;
end;

var
  Short: string;
  Original: string;

begin
  URLCount := 0;
  
  Short := ShortenURL('https://www.example.com');
  WriteLn('Short URL: ', Short);
  
  Original := GetURL(Short);
  WriteLn('Original URL: ', Original);
end.
