# Radix/Bases (`bases`)

This is more of a mathematical course, but you will use binaries, octal, hexadecimal numbers everywhere, as they are used by Linux. This course is about radix (`bases`), especially binaries (radix-2), octal (radix-8), decimal (radix-10), and hexadecimal (radix-16), along with how Linux is handling signed, and unsigned integers, and floating numbers.

* In a $radix-n$, values goes from $0$ to $n-1$
* After 9, we are using letters
* Radix-35 is the greatest radix we can have <small>(from 0 to Z)</small>
* $(n)_{k}$ means that the number $n$ is in a radix $k$

<hr class="sl">

## Radix-10

Radix-10 numbers are called decimals, and you should already know them, as they are the numbers that you have been using every day, for instance $125$ is a number in radix-10.

<hr class="sr">

## Radix-2

A radix-2 number is called binary number, and it's made of $0$, and $1$. For instance $001$ is the binary for $1$.

<div class="row row-cols-md-2"><div>

**From radix-10 to radix-2**

You must know every small power of 2 like the back of your hand:

| $2^8$ | $2^7$ | $2^6$ | $2^5$ | $2^4$ | $2^3$ | $2^2$ | $2^1$ | $2^0$ |
|-------|-------|-------|-------|-------|-------|-------|-------|-------|
| 256   | 128   | 64    | 32    | 16    | 8     | 4     | 2     | 1     |

Every number can be expressed as a sum of power of two. For instance, $125 = 64+32+16+8+4+1$ which means $125 = 2^6+2^5+2^4+2^3+2^2+2^0$. Now, to write the binary

* if you used a power of 2, then it's a $1$
* otherwise, it's $0$.

So it means that we have $125 = {\color{red} 1 *} 2^6+ {\color{red} 1 *} 2^5+ {\color{red} 1 *} 2^4+ {\color{red} 1 *} 2^3+ {\color{red} 1 *} 2^2 + {\color{green} 0 *} * 2^1 + {\color{red} 1 *}2^0$, giving us $(125)\_{10} = ({\color{red} 11111} {\color{green}0} {\color{red}1})\_{2}$

</div><div>

**From radix-2 to radix-10**

You simply have to do the inverse of what you did, but to make things easier, you should start from the right, and go back to the left

* Given $(1111101)\_{2}$
* You have $1 * 2^0 + 0 * 2^1 + 1 * 2^2+ 1 * 2^3+ 1 * 2^4+ 1 * 2^5+ 1 * 2^6$
* Which is $1 + 0 + 4 + 8 + 16 + 32 + 64$
* Giving us $125$

Pretty easy, right?
</div></div>

<hr class="sr">

## Radix-8

A radix-8 number is called octal number, and it's made of values from $0$, and $7$. In most languages, an octal number is starting with $0$.

<div class="row row-cols-md-2"><div>

**From radix-8 to radix-2**

A digit in radix-2 is equals to 3 digits in radix-8 <small>($2^3=8$)</small>. You will that to convert each radix-8 digit to a 3-digits binary, and convert back each 3-digits binary, to a radix-8 digit.

* Given $(175)\_{8}$
  * $(1)_8 = (1)_2$
  * $(7)_8 = (111)_2$
  * $(5)_8 = (101)_2$
* Giving us $(175)\_{8}=(1111101)\_{2}$

</div><div>

**From radix-2 to radix-8**

You number of digits in base-2 should be a multiple of 3 to apply the previous formula, if not, add leading zeros.

* Given $(1111101)\_{2}$, we need 2 leading zeros
* $(001111101)\_{2}$
* Now, simply convert each group of 3 digits to radix-8, as you would for radix-10
  * $001$ is $1$
  * $111$ is $1+2+4=7$
  * $101$ is $1+4=5$
* So we have $(175)_{8}$, or $0175$

</div></div>