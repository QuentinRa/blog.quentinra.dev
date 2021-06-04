# Replace

[Go back](..)

* `:s/old/new`: replace `old` by `new`
* `:s/old/new/g`: same, for all lines
* `:s/old/new/gc`: same but ask confirmation before
* `:n,ms/old/new/g`: same but only n to m lines

Replacement (ESC)
* `r` : replace character under cursor
* `R` : replace characters while ESC not pressed

Replacement

* `s`: delete the character under cursor then switch to insert mode
* `cc`: delete line then switch to insertion mode
* `cw`: delete from the cursor until the end of the word 
  then switch to insertion mode