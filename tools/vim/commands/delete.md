# Delete

[Go back](..#-and-now-mastering-it)

This is a list of the commands you will use to delete characters or lines.

<hr class="sl">

## Delete characters

* `x`: delete characters under cursor
* `X`: delete characters before the cursor
* `nx` or `nX`: same as before but for `n` characters
* `d^`: delete all characters of the line until the cursor
* `D` or `d$`: delete all characters of the line from the cursor until the end

<hr class="sr">

## Delete lines

* `dd`: delete current line
* `ndd`: delete n lines since current
* `:n,md`: delete lines from `n` to `m`
* `:n,.d`: delete all lines from `n` to cursor line
* `:.,$d`: delete all lines from cursor line until the end