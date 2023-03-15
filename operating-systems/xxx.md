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

Operating system

* kernel (system services: pilotes...)
* user services
* an application can't access another one in memory? but we can create a zone in which two can access? Swap: store on the disk.
</div></div>

<hr class="sep-both">

## XXX

<div class="row row-cols-md-2"><div>

App

* Presentation
* Core
* Storage

Monolithic: 3 in one process.

Centralized storage: 2 in one process and a centralized storage.

Client-server: only presentation, and a centralized storage/core.

Distributed: one machine for each.

* variants: some calculations near the database
* variants: some pre-computation of the presentation near the core

Between app and storage: ODBC, JDBC, ADO, Java beans...

Between presentation and app: Sockets, RPC, TCP/UDP, HTML/SHTML...
</div><div>

Point to Point. N systems directly linked to n others. If we change one, we need to change xxx connections too.

Bus: everyone only interact with a bus. Only two connections to handle.

Sync/Async. Async: with a bus and its database. Each actor ask the bus, but the bus isn't the one initiating the request.

Sync on event: X send data to bus, bus store it. Y and Z subscribe to the bus for events. X trigger an event. The bus notify subscribers. If offline, the bus keep the message until subscriber notify the bus that they are back. Producer-consumer subscriber?

Messages: binaries. Fixed-size format. csv. xml. json. OAS (swagger OpenAPI).

Service Oriented Architecture. SOAP/WSDL (services), Rest (resources), OData (Open Data). micro-services.

Between companies: Point-to-point > EDI standard > API.
</div></div>

<hr class="sep-both">

## W

<div class="row row-cols-md-2"><div>

OSI

* session: between apps
* transport: between computers

Quality/Debit=freq to select UDP/TCP.

* 1024 to 49151: reserved
* dynamic ports
</div><div>

...
</div></div>