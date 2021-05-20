# Replace

[Go back](..)

* `:s/old/new`: replace `old` by `new`
* `:s/old/new/g`: same, for all lines
* `:s/old/new/gc`: same but ask confirmation before
* `:n,ms/old/new/g`: same but only n to m lines

Remplacement (ESC)
* `r` : replace character under cursor
* `R` : replace characters while ESC not pressed

Remplacement

* `s`: delete character under cursor then switch to insert mode
* `cc`: delete line then switch to insertion mode
* `cw`: delete from cursor until the end of the word 
  then switch to insertion mode