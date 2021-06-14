# Operators

[Go back](..)

Aside from the fact that operators for ``int`` variables are different that
operators for ``float`` variables, everything else should not be new.

* **int**: ``+``, `-`, `*`, `/`, `mod`
* **float**: `+.`, `-.`, `*.`, `/.`, `**` (power)
* **string**: `^` (concatenation)
* **bool**: `&&` `||` and `not`

And for all

* ``=`` : assign or test equality
* ``>=``, ``>``, ``<=``, `<``
* ``<>``: test difference

> **Note**: Some folks are using `!=` to test the difference. That's working in most cases
> but this operators is comparing the addresses and that's in most cases not what
> you want.