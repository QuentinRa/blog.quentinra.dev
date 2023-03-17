# Architecture 🌱

<div class="row row-cols-md-2"><div>

This page try to gather notes related to how systems operate at low-level/near the machine.

* 🦆 operating system
* 🗃️ databases
* 🔦 programming languages
* ...
</div><div>

This includes stuff such as:

* 📦 storage (numbers, strings...)
* 🍎 arithmetic
* ...
</div></div>

<hr class="sep-both">

## Numbers 🔢

<div class="row row-cols-md-2"><div>

While systems typically offer types such as `boolean`, `integer`, `float`, and `string`, for a machine, there are usually 4 types:

* **bit**: 0 or 1. Often used for booleans.
* **byte**: 8 bits.
* **word**: width of a register. 16, 32, or 64 bits <small>(modern computers)</small>.
* **dword** (double word): usually 32 or 64 bits

Refer to the [Encoding | Binary](/programming-languages/others/encoding/index.md#radix-2---) to learn more how numbers are represented using 0 and 1.

<br>

#### Signed or unsigned?

Numbers can be signed or unsigned. If a number is signed, it means that the first bit is the sign: $0$ = positive, $1$ = negative.

Given $n$ bits, we can represent values between

* $[2^{n-1}, 2^{n-1}-1]$ for a signed number
* $[0, 2^{n} - 1]$ for an unsigned number

👉 The position of the first bit is determined by the data type.
</div><div>

#### Endianness

Numbers are stored and read according to the endianness of the machine. For instance, given $(10)_2$

* **Big endian**: we will store/read $1$ then $0$
* **Little endian**: we will store/read $0$ then $1$

The same number could have two different value according to the endianness of the one that stored it, and the one that read it.

👉 This do not include the sign bit whose position is fixed.

<br>

#### Arithmetic operations

Operations are between positive binaries. You will have to use the **two's complement** to use negative values in operations.

The only operation possible is the addition. `a-b` is handled as `a+(-b)`.

<details class="details-n">
<summary>Two's complement - negative numbers</summary>

The two's complement is an "upgrade" to the One's complement, which has the default of having two representation for the number zero. It's as simple as that:

* Invert all bits
* Add 1
</details>

<details class="details-n">
<summary>Example of addition</summary>

<div class="row"><div class="col-md-3">

![addition](_images/addition.png)
</div><div class="col-md-9">

To add 5 (101) to 5 (101), you need to do like you would have in grad school, with a carry.

* $1+1=0$ with $carry={\color{cyan}1}$
* $0+0+{\color{cyan}1}=1$ with $carry={\color{red}0}$
* $1+1+{\color{red}0}=0$ with $carry={\color{orange}1}$
* $0+0+{\color{orange}1}=1$ with $carry=0$
</div></div>
</details>

<br>

#### Problems

<p></p>

* 🔥 [**Overflow**](https://en.wikipedia.org/wiki/Integer_overflow): an overflow occur when the result of a calculation is outside the range of values that can be stored with our number of bits. An overflow is without consequences if the result is valid.
</div></div>

<hr class="sep-both">

## Strings 💬

<div class="row row-cols-md-2"><div>

A string is an array of characters, such as `'a'`. A character is mapped to a number using a table, as we can only store integers.

A string could have a fixed length, or a variable length. For the latter, we may use a null character such as `\0` to mark the end.

**ASCII table (7 bits)**

The ASCII table is the most well-known table. `'a'` in ASCII is the number `97`. 7 bits are not enough to store every character, so it's less used than in its prime. 

**Extended ASCII table (8 bits)**

This is an extension of the ASCII table adding 128 characters. The set of character is NOT fixed. For instance, the character `130` can be a different character according to how the extended table is defined.
</div><div>

**Unicode (UTF)**

UFT-8 and other variants are mainly used in international applications. UTF-8 characters are stored on 4 bytes.

<br>

#### Fonts

A font is a set of glyphs to render a character. Given two fonts, one could render the letter 'a' as `a` while another could render it as `+`.

<br>

#### Collation (database)

This is a set of rules defining how characters are ordered, compared, how the case is handled <small>(is it case-sensitive?)</small>, and how special characters are treated <small>(à==a? before "a"? after "a"?)</small>.
</div></div>

<hr class="sep-both">

## Others

<div class="row row-cols-md-2"><div>

#### Null value

There is usually a null value to indicate that something exist, but is empty. In most languages, it's `NULL` or `null`.


<br>

#### Not A Number

There may be a value to indicate that a value is not a number. For instance, `1/0`. It's usually `NaN`.

<br>

#### Size

* **1 Ko** (kilo): $2^{10} = 1024$
* **1 Mo** (mega): $2^{20} = 1,048,576$
* **1 Go** (giga): $2^{30} = 1,073,741,824$
* **1 To** (tera): $2^{40} = 1,099,511,627,776$
* ...
</div><div>

#### Dates

Most dates are a number of seconds/milliseconds since a starting point/epoch. In many languages/system, it is the **1st of January 1970**.

In some applications/systems, the number may be a number of days. To represent the time, We add a fraction of the day to the number of days. For instance, `12 h = 1/2`, so the day of epoch (`0`) at 12 h (`.5`) would be `0.5`.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [old](_old.md)
</div><div>


</div></div>