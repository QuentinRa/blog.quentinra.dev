# Radix/Bases (`bases`)

This is more of a mathematical course, but you will use binaries, octal, hexadecimal numbers everywhere, as they are used by Linux. This course is about radix (`bases`), especially binaries (radix-2), octal (radix-8), decimal (radix-10), and hexadecimal (radix-16), along with how Linux is handling signed, and unsigned integers, and floating numbers.

* In a $radix-n$, values goes from $0$ to $n-1$
* After 9, we are using letters
* Radix-35 is the greatest radix we can have <small>(from 0 to Z)</small>

<hr class="sr">

## Radix-10

You should know them, as they are the numbers that you have been using every day, for instance $125$ is a number in radix-10.

<hr class="sl">

## Radix-2

A radix-2 number is called binary numbers, and it's made of $0$, and $1$. For instance $001$ is the binary for $1$.

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

...
</div></div>