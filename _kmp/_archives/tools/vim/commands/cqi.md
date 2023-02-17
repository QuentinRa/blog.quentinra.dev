# CQI syntax

[Go back](..#-and-now-mastering-it)

You can use powerful commands and some regex/patterns using the `cqi` syntax.

* `c`: a command
* `q`: a quantity
* `i`: an indicator

in a sentence, for example, we could say `delete (=c) 10 (=q) lines (=i)`. Indicators would be

* `$`: command from the cursor until the end of the line
* `e`: end of the word
* `.`: under the cursor
* `c`: a line
* `^`: from the cursor until the start of the line

You may use that in previous commands.