# Operators

<div class="row row-cols-lg-2"><div>

Many programming languages implement the same operators for common operations, with some considerations:

* ☠️ The symbol may be different
* 💥 The logic may be different
* 💡 There may be a function instead of an operator
</div><div>

The most common operator is the **assignment** operator, which is usually `=`. It's used to store a value in a container called a variable.

```ps
x = 5
```

☠️ Some languages use `:=` or `<-`.
</div></div>

<hr class="sep-both">

## Arithmetic operators

<div class="row row-cols-lg-2"><div>

These operators represent arithmetic operations.

* x plus 1 → `x + 1`
* x minus 1 → `x - 1`
* x by 1 → `x * 1`
* x divided by 1 → `x / 1`

💥 Languages can handle numbers differently. If you try `5 / 2`, some languages will return `2.5` while others may return `2`.

🔥 Some languages may have implemented additional operators:

* Exponentiation <small>($x^n$)</small> is often `x ** n` or `x ^ n`
* Modulus <small>($a\mod b$)</small> is often `a % b`
</div><div>

When we are updating the variable of a variable, such as `x = x + 1`, some languages implemented shortcuts :

```cpp
x += 1     // same as "x = x + 1"
x -= 1     // same as "x = x - 1"
x *= 1     // same as "x = x * 1"
x /= 1     // same as "x = x / 1"
```

🔥 Some languages have a shortcut when the operand is `1`, which is common in loops: `x++` <small>(x = x + 1)</small> and `x--` <small>(x = x - 1)</small>.

🔥 Some languages may also implement `++x`, and `--x`. When using this variant, the operation has a higher priority than any other.

* `if (x++ == 1)`: we have `x == 1` then `x = x + 1`
* `if (++x == 1)`: we have `x = x + 1` then `x == 1`
</div></div>

<hr class="sep-both">

## Comparison operators

<div class="row row-cols-lg-2"><div>

Most of the time, we are executing a different code according to the value of a variable. We have operators to compare variables/values.

* x is greater than 1 → `x > 1`
* x is greater than or equal to 1 → `x >= 1`
* x is less than or equal to 1 → `x <= 1`
* x is less than 1 → `x < 1`
* x is equal to 1 → `x == 1`
* x is not equal to 1 → `x != 1` or `x <> 1` (☠️)

💥 Languages may implement strict comparison. Strict comparison will also check the type of the variable <small>(ex: 5.0 === 5 is false)</small>.

🔥 Languages may have more implementation-specific operators. For instance, many languages have an operator `in` to check if a variable is part of another variable <small>(ex: character in a string, value in an array...)</small>.
</div><div>

As we may chain multiple comparisons, we also have logical operators:

* `a && b`: true if both `a` and `b` are true
* `a || b`: true if at least one is true
* `!a`: negate the result <small>(false → true, true → false)</small>

☠️ Some languages use `and`/`or`/`not` instead of `&&`/`||`/`!`.

💥 Most languages have implemented [Short-circuit_evaluation](https://en.wikipedia.org/wiki/Short-circuit_evaluation). If we write `true || anythingElse`, then the rest of the condition is not evaluated, as we already know the result is `true`.
</div></div>