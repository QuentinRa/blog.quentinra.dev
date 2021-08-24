# Replace

[Go back](..#-and-now-mastering-it)

This is a list of the commands you will use to replace something.

<hr class="sl">

* `:s/old/new`: replace `old` by `new`
* `:s/old/new/g`: same, for all lines
* `:s/old/new/gc`: same but ask confirmation before
* `:n,ms/old/new/g`: same but only n to m lines

Replacement (ESC)
* `r` : replace character under the cursor
* `R` : replace characters while ESC not pressed

Replacement

* `s`: delete the character under the cursor, then switch to the insert mode
* `cc`: delete the current line, then switch to the insertion mode
* `cw`: delete characters starting from the cursor position until the end of the word. Then, switch to insertion mode.