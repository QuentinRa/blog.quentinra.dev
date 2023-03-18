# Floating-point arithmetic

<div class="row row-cols-md-2"><div>

Then, convert the decimal part, and the result is $(a.r)_2$

As $5 = (101)_2$, and $.75=(.11)\_2$, we have $(5.75)\_{10}=(101.11)_2$.

Floats

* precision (big number = v ; big number + small = v too...)
* errors (not associative: a + b + c is not the same as a + c + b, as there are truncating)
* overflow
</div><div>

[**IEEE754**](https://en.wikipedia.org/wiki/IEEE_754) is the norm modern computers are using to store a floating-point number. 3 integers are needed to do so:

<table class="table table-bordered table-striped border-dark">
<thead>
<tr><th></th><th>float<br>(32 bits)</th><th>double<br>(64 bits)</th></tr>
</thead>
<tbody>

<tr><td>

**S**: the sign, 0=positive, 1=negative
</td><td colspan="2">1 bit</td></tr>

<tr><td>

**E**: exponent bias (`exposant décalé`)
</td><td>8 bits</td><td>11 bits</td></tr>

<tr><td>

**M**: significand, mantissa, or coefficient (`mantisse`)
</td><td>23 bits</td><td>52 bits</td></tr>

<tr><td></td><td>$q = 127$</td><td>$q=1023$</td></tr>
</tbody></table>

To find the numerical value, evaluate $(-1)^S * 1.M * 2^{E - q}$.

<details class="details-e">
<summary>Find S, E, and M</summary>

As we explained before, $(5.75)_{10}=(101.11)_2$. You should have noticed that we have "1.M", so we have to move the radix point by **3 times** to the left, giving us $(101.11)_2 = (1.0111)_2 * 2^3$.

If we are using a float (simple precision).

* $S = 0$, because $5$ is positive
* $E = 130$: you need to solve $E - q = 3$, with $3$ the exponent, and $q=127$ for a float.
* $M = 0111$, as our number is $1.0111$, $M$ is simply a copy of the part after the radix point
</details>
</div></div>