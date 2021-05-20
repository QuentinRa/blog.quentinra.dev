# Delete

[Go back](..)

Delete characters

* `x`: delete characters under cursor
* `X`: delete characters before cursor
* `nx` or `nX`: same as before but for `n` characters
* `d^`: delete all characters of the line until cursor
* `D` or `d$`: delete all characters of the line from cursor
until the end

Delete lines

* `dd`: delete current line
* `ndd`: delete n lines since current
* `:n,md`: delete lines from `n` to `m`
* `:n,.d`: delete all lines from `n` to cursor line
* `:.,$d`: delete all lines from cursor line until the end