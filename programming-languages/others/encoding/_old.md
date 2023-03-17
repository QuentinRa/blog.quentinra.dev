# Radix/Bases (`bases`)

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