# XXX

<div class="row row-cols-md-2"><div>

* 2^10 = 1024 = Ko (kilo) = kibi
* 2^20 = 1 048 576 = Mo (méga) = mebi
* (new norm because confusing)

xxx

* big endian (0 at the left)
* little endian (0 at the right)

yyy

* word = 16 bits
* dword (double word) = 32 bits
* signed or unsigned
</div><div>

Floats

* precision (big number = v ; big number + small = v too...)
* errors (not associative: a + b + c is not the same as a + c + b, as there are truncating)
* overflow

Binary coded decimal (DCB) - floats

* we convert to hexa each 4-bits
* decimal(6,4): n number, 4 after the "."
* quite used in database (money)

Chars

* ASCII (7 bits) - used as the base for most
* Extended ASCII (8 bits) - the 8 bit page can be changed according to the language.
* UTF-8...
* Police: same character but drawn diffrently
* Collation: how characters are ordered, how convert convert up/lower, equivalences (a=à?)
* Fixed or variable (size or null char)

Dates

* Value relative to a date
* `x.6875` in excel = 16h30, `x,500`=12h...

No data

* NULL (4+NULL = NULL)
* NaN = 1/0
</div></div>