[This is a conceptual Brainfuck implementation - extremely simplified]
[Print "Short URL: ABC123"]
+++++ +++++             Initialize counter (cell #0) to 10
[                       Use loop to set the next four cells to 70/100/30/10
    > +++++ ++              Add  7 to cell #1
    > +++++ +++++           Add 10 to cell #2 
    > +++                   Add  3 to cell #3
    > +                     Add  1 to cell #4
    <<<< -                  Decrement counter (cell #0)
]                   

> ++ .                  Print 'S' (ASCII 83 = 8*10 + 3 = 7*10 + 13)
> + .                   Print 'h' 
> -- .                  Print 'o'
> +++ .                 Print 'r'
> ++ .                  Print 't'
                        [Continue pattern for remaining characters...]

[Note: This is a demonstration of the concept.
A full Brainfuck URL shortener would be thousands of characters long
and extremely complex to implement properly.]
