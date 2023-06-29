# Operators

<div class="row row-cols-md-2"><div>

Many programming languages implement the same operators for common operations, with some considerations:

* ☠️ the symbol may be different
* 🔥 the logic may be different
* 💡 there may be a function instead of an operator
</div><div>

The most common operator is the **assignment** operator, which is usually `=`. It's used to store a value in a container called variable.

```ps
x = 5
```
</div></div>

<hr class="sep-both">

## Arithmetic operators

<div class="row row-cols-md-2"><div>

These operators represent arithmetic operations.

* x plus 1 → `x + 1`
* x minus 1 → `x - 1`
* x by 1 → `x * 1`
* x divided by 1 → `x / 1`

☠️ Languages can handle numbers differently. If you try `5 / 2`, some languages will return `2.5` while others may return `2`.

⭐ Some languages may have implemented additional operators:

* Exponentiation <small>($x^n$)</small> is often `x ** n` or `x ^ n`
* Modulus <small>($a \mod b$)</small> is often `a % b`
</div><div>

When we are updating the variable of a variable, such as `x = x + 1`, some languages implemented shortcuts :

```cpp
x += 1     // same as "x = x + 1"
x -= 1     // same as "x = x - 1"
x *= 1     // same as "x = x * 1"
x /= 1     // same as "x = x / 1"
```
</div></div>