module URLShortener = struct
  type t = (string, string) Hashtbl.t
  
  let create () = Hashtbl.create 16
  
  let generate_short_code length =
    let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789" in
    let char_count = String.length characters in
    let result = Bytes.create length in
    for i = 0 to length - 1 do
      let index = Random.int char_count in
      Bytes.set result i characters.[index]
    done;
    Bytes.to_string result
  
  let shorten shortener url =
    let short = generate_short_code 6 in
    Hashtbl.add shortener short url;
    short
  
  let get_url shortener short =
    try Some (Hashtbl.find shortener short)
    with Not_found -> None
end

(* Example usage *)
let () =
  Random.self_init ();
  let shortener = URLShortener.create () in
  let short = URLShortener.shorten shortener "https://www.example.com" in
  Printf.printf "Short URL: %s\n" short;
  match URLShortener.get_url shortener short with
  | Some original -> Printf.printf "Original URL: %s\n" original
  | None -> Printf.printf "URL not found\n"
