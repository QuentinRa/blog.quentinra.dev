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
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [old](_old.md)
</div><div>


</div></div>