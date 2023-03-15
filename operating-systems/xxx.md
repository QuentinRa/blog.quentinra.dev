# XXX

<div class="row row-cols-md-2"><div>

* 2^10 = 1024 = Ko (kilo) = kibi
* 2^20 = 1 048 576 = Mo (méga) = mebi
* (new norm because confusing)

xxx

* big endian (0 at the left)
* little endian (0 at the right)

yyy

* word = 16 bits
* dword (double word) = 32 bits
* signed or unsigned
</div><div>

Floats

* precision (big number = v ; big number + small = v too...)
* errors (not associative: a + b + c is not the same as a + c + b, as there are truncating)
* overflow

Binary coded decimal (DCB) - floats

* we convert to hexa each 4-bits
* decimal(6,4): n number, 4 after the "."
* quite used in database (money)

Chars

* ASCII (7 bits) - used as the base for most
* Extended ASCII (8 bits) - the 8 bit page can be changed according to the language.
* UTF-8...
* Police: same character but drawn diffrently
* Collation: how characters are ordered, how convert convert up/lower, equivalences (a=à?)
* Fixed or variable (size or null char)

Dates

* Value relative to a date
* `x.6875` in excel = 16h30, `x,500`=12h...

No data

* NULL (4+NULL = NULL)
* NaN = 1/0
</div></div>

<hr class="sep-both">

## XXX

<div class="row row-cols-md-2"><div>

CPU

* Registers
* Cache
* Control unit (core functions, assembly functions)
* Calcul unit (ALU)

Bus to share data (3 chanel: send instructions, address, information)

Memory

* RAW (volatile)
  * DRAM => SDRAM, EDO DRAM, BEDO DRAM, DDR SDRAM
  * Static (SRAM)
  * Cache
* ROW (not volatile)
  * ROM => PROM, EPROM, EEPROM
  * Flash (USB...)

Memory leaks: missing free... Overflow
=> program add the return address to the stack, then the parameters. The procedure, read all, generate and put the result. Then the program read the result, and unstack the return address. With overflow, a parameter overflow and replace the return address.

Controllers I/O

* USB
* Network
* Video
* Storage
* Keyboard/mouse
</div><div>

Registers

* MAR
* MDR
* CIR
* AC0
* AC1
</div></div>