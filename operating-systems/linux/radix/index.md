# Radix/Bases (`bases`)

This is more of a mathematical course, but you will use binaries, octal, and hexadecimal numbers everywhere, as they are used by Linux. This course is about radix (`bases`), especially binaries (radix-2), octal (radix-8), decimal (radix-10), and hexadecimal (radix-16), along with how Linux is handling signed, and unsigned integers, and floating numbers.

* In a $radix-n$, values goes from $0$ to $n-1$
* After 9, we are using letters
* Radix-35 is the greatest radix we can have <small>(from 0 to Z)</small>
* $(n)_{k}$ means that the number $n$ is in a radix $k$

<hr class="sl">

## Commands

<div class="row row-cols-md-2 mt-4"><div>

<details class="details-e">
<summary><code>hexdump/xxd</code>: convert some text to octal/hexadecimal, and 🔁</summary>

* `-b`: to octal
* `-C`: to hexadecimal
* `-e`: customize

```bash
$ hexdump <<< "Hello, World" > hello_world.hex
$ cat hello_world.hex
0000000 6548 6c6c 2c6f 5720 726f 646c 000a
000000d
# letters were mixed (WTF!!?)
$ echo -e "\x65"
e
$ echo -e "\x48"
H
# here it works fine
$ xxd <<< "Hello, World" | tee hello_world.hex
00000000: 4865 6c6c 6f2c 2057 6f72 6c64 0a         Hello, World.
# reverse
$ xxd -r hello_world.hex
Hello, World
```
</details>
</div><div>

<details class="details-e">
<summary><code>k#n</code>: convert a number $n$ in radix-$k$ to decimal</summary>

```bash
$ echo $[2#101] # 5
```

</details>
</div></div>

<hr class="sr">

## Radix-10

Radix-10 numbers are called decimals, and you should already know them, as they are the numbers that you have been using every day, for instance $125$ is a number in radix-10.

<hr class="sl">

## Radix-2

A radix-2 number is called a binary number, and it's made of $0$, and $1$. For instance, $001$ is the binary for $1$.

<div class="row row-cols-md-2"><div>

**From radix-10 to radix-2** [online tool](https://www.binaryhexconverter.com/decimal-to-binary-converter)

You must know every small power of 2 like the back of your hand:

| $2^8$ | $2^7$ | $2^6$ | $2^5$ | $2^4$ | $2^3$ | $2^2$ | $2^1$ | $2^0$ |
|-------|-------|-------|-------|-------|-------|-------|-------|-------|
| 256   | 128   | 64    | 32    | 16    | 8     | 4     | 2     | 1     |

Every number can be expressed as a sum of powers of two. For instance, $125 = 64+32+16+8+4+1$ which means $125 = 2^6+2^5+2^4+2^3+2^2+2^0$. Now, to write the binary

* if you used a power of 2, then it's a $1$
* otherwise, it's $0$.

So it means that we have $125 = {\color{red} 1 *} 2^6+ {\color{red} 1 *} 2^5+ {\color{red} 1 *} 2^4+ {\color{red} 1 *} 2^3+ {\color{red} 1 *} 2^2 + {\color{green} 0 *} * 2^1 + {\color{red} 1 *}2^0$, giving us $(125)\_{10} = ({\color{red} 11111} {\color{green}0} {\color{red}1})\_{2}$

</div><div class="border-start border-dark">

**From radix-2 to radix-10** [online tool](https://www.binaryhexconverter.com/binary-to-decimal-converter)

You simply have to do the inverse of what you did, but to make things easier, you should start from the right, and go back to the left

* Given $(1111101)\_{2}$
* You have $1 * 2^0 + 0 * 2^1 + 1 * 2^2+ 1 * 2^3+ 1 * 2^4+ 1 * 2^5+ 1 * 2^6$
* Which is $1 + 0 + 4 + 8 + 16 + 32 + 64$
* Giving us $125$

Pretty easy, right?
</div></div>

<hr class="sr">

## Radix-8

A radix-8 number is called an octal number, and it's made of values from $0$, and $7$. In most languages, an octal number is starting with $0$.

<div class="row row-cols-md-2"><div>

**From radix-8 to radix-2** [online tool](https://www.binaryhexconverter.com/octal-to-binary-converter)

A digit in radix-2 is equals to 3 digits in radix-8 <small>($2^3=8$)</small>. You will use that to convert each radix-8 digit to a 3-digits binary, and convert back each 3-digits binary, to a radix-8 digit.

* Given $(175)\_{8}$
  * $(1)_8 = (1)_2$
  * $(7)_8 = (111)_2$
  * $(5)_8 = (101)_2$
* Giving us $(175)\_{8}=(1111101)\_{2}$

</div><div class="border-start border-dark">

**From radix-2 to radix-8** [online tool](https://www.binaryhexconverter.com/binary-to-octal-converter)

Your number of digits in base-2 should be a multiple of 3 to apply the previous formula, if not, add leading zeros.

* Given $(1111101)\_{2}$, we need 2 leading zeros
* $(001111101)\_{2}$
* Now, simply convert each group of 3 digits to radix-8, as you would for radix-10
  * $001$ is $1$
  * $111$ is $1+2+4=7$
  * $101$ is $1+4=5$
* So we have $(175)_{8}$ or $0175$

</div></div>

<hr class="sl">

## Radix-16

A radix-16 number is called a hexadecimal number, and it's made of values from $0$ to $9$, and letters from $A$ to $F$. In most languages, an octal number is starting with $\text{0x}$.

<div class="row row-cols-md-2"><div>

**From radix-16 to radix-2** [online tool](https://www.binaryhexconverter.com/hex-to-binary-converter)

A digit in radix-2 is equals to 4 digits in radix-8 <small>($2^4=16$)</small>. You will use that to convert each radix-16 digit to a 4-digits binary, and convert back each 4-digits binary, to a radix-16 digit.


| 10  | 11  | 12  | 13  | 14  | 15  |
|-----|-----|-----|-----|-----|-----|
| A   | B   | C   | D   | E   | F   |

* Given $(7D)_{16}$
  * $(7)_{16} = (111)_2$
  * $(D)\_{16} = (13)\_{10} = (1101)_2$
* Giving us $(7D)\_{16}=(1111101)\_{2}$

</div><div class="border-start border-dark">

**From radix-2 to radix-16** [online tool](https://www.binaryhexconverter.com/binary-to-hex-converter)

Your number of digits in base-2 should be a multiple of 4 to apply the previous formula, if not, add leading zeros.

* Given $(1111101)\_{2}$, we need 1 leading zeros
* $(01111101)\_{2}$
* Now, simply convert each group of 4 digits to radix-16, as you would for radix-10
  * $0111$ is $1+2+4=7$
  * $1101$ is $1+4+8=13$, but $13$ do not exist in radix-16, so we should use $D$
* So we have $(7D)_{16}$ or $\text{0x}7D$

</div></div>

<hr class="sr">

## Radix conversion without passing by radix-2

<div class="row row-cols-md-2"><div>

Every previous example was first converting radix-10 to radix-2, then radix-2 to radix-n. This is both inefficient, and not universal, as the same process can't be applied to radix-15, which isn't a multiple of 2...

Instead, here is another more universal, though possibly harder/longer

* $a = \text{your_number}$
* $n = \text{your_radix}$
* do while $a > 0$
  * $q_i = \frac{a}{n}$
  * $r_i = a\ mod\ n$
  * $a = q_i$

Using this algorithm, in the end, you have to convert every invalid $r_i$ to radix-n <small>(ex: 14 in radix-15 is E)</small>, and concatenate **in the reverse order** every value. You can [use rapid-table website to do it online](https://www.rapidtables.com/convert/number/base-converter.html).
</div><div>

* $a = 6072$
* $n = 15$
* do while $a > 0$
  * $q_0 = 6072 / 15 = 404$
  * $r_0 = 6072\ mod\ 15 = 12$
  * $q_1 = 404 / 15 = 26$
  * $r_1 = 404\ mod\ 15 = 14$
  * $q_2 = 26 / 15 = 1$
  * $r_2 = 26\ mod\ 15 = 11$
  * $q_3 = 1 / 15 = 0$
  * $r_3 = 1\ mod\ 15 = 1$
  * exit, $a$ is now 0

Then we are converting $12=C$, $14=E$, $11=B$, then concatenating in reverse order giving us $(6072)\_{10} = (1BEC)\_{15}$.
</div></div>

<hr class="sl">

## Integers arithmetic

<div class="row row-cols-md-2"><div>

We are considering

* **unsigned numbers**: $[0, 2^{n} - 1]$
* **signed numbers**: $]-2^{n-1}, 0] \cup ]0,2^{n-1}-1[$

$n$ is the number of bits that we have to store this value. For instance, it's usually $32$ for an `int`.

With signed numbers, we are using the leading bit <small>(or the trailing bit)</small>, to know the sign: 0 means positive, 1 means negative.

For positive numbers, regardless of whether they are signed or not, we only have to convert them to binary, and store them.
</div><div>

For negative numbers, we need to do an operation called [**Two's complement**](https://en.wikipedia.org/wiki/Two's_complement) (`complément à 2`).

<details class="details-e">
<summary>Two's complement</summary>

**Convert to positive**

1. convert to binary
2. inverse every bit (**Two's complement**)
3. add 1
4. store it

**Convert back to negative**

1. inverse every bit (**Two's complement**)
2. add 1
3. convert back to decimal
</details>

The most common problem that may occur when doing calculations is an **overflow** (`Débordement`). It means that the result is outside the bounds/range of values for the given number. An **overflow may be without any consequences**, meaning that the right result was returned.

<details class="details-e">
<summary>Addition / Subtraction</summary>

Actually, there is no such operation as subtracting, we can only do additions, but there is a trick: $a - b = a + (-b)$, and we can use the **Two's complement** to convert a positive number to a negative number.

<div class="row"><div class="col-md-3">

![addition](_images/addition.png)
</div><div class="col-md-9">

To add 5 (101) to 5 (101), you need to do like you would have in grad school.

* $0+0=0$
* $0+1=1+0=0$
* $1+1=0$ with a carry on the next (left-wise), as shown in green.
</div></div>

**Overflow**: there is an overflow if the last two carries (from right-to-left), highlighted in red, are different from one another. That's the case with the example of 5+5, if we only have 3 bits, we can't store a 10, as we need 4 bits. There is also an overflow, but without consequences, if the last two carries are 1.

See [Integer overflow](https://en.wikipedia.org/wiki/Integer_overflow).
</details>
</div></div>

<hr class="sr">

## Floating-point arithmetic

<div class="row row-cols-md-2"><div>

A floating-point can be identified by the **Radix point**, which is usually either `.` (dot), or `,` (comma). 

The first step is scientific notation. You should have heard of $1.3 * 10^n$, in radix-10, and our goal is something like $1.11 * 2^n$, so in radix-2.

**Note**: not every number can be written using scientific notation ⚠️

<details class="details-e">
<summary>Encoding floating numbers</summary>

* $e(a)$ extract the digits after the radix point of $a$ <small>(ex: 1.11 -> 0.11)</small>
* $a_i = \text{your_number}$
* do
  * $a_i = e(a_i) * 2$
  * $r_i = \text{if}\ a_i > 1.0\ \text{then}\ 1\ \text{else}\ 0$
* while $a_i \neq 1.0$

Simply concatenate the $r_i$ to get the floating part representation in base 2. Now, convert the decimal part, and the result is $(a.r)_2$.

For instance, with 5.75

* $a_0 = 0.75 * 2 = 1.5$
* $r_0 = 1$
* $a_0 = 0.5 * 2 = 1.0$
* $r_0 = 1$

As $5 = (101)_2$, and $.75=(.11)\_2$, we have $(5.75)\_{10}=(101.11)_2$.
</details>
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

As we explained before, $(5.75)_10=(101.11)_2$. You should have noticed that we have "1.M", so we have to move the radix point by **3 times** to the left, giving us $(101.11)_2 = (1.0111)_2 * 2^3$.

If we are using a float (simple precision).

* $S = 0$, because $5$ is positive
* $E = 130$: you need to solve $E - q = 3$, with $3$ the exponent, and $q=127$ for a float.
* $M = 0111$, as our number is $1.0111$, $M$ is the part after the radix point
</details>
</div></div>