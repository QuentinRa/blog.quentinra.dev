# Reverse Engineering

<div class="row row-cols-lg-2"><div>

Reverse engineering is the process of analyzing a program, or system to understand its structure, function, and behavior.

It often means getting back the original code/system using disassembling, decompiling, or similar methods.

It can be used to understand how a malware works 🛡️ or to find vulnerabilities in a program/system in a black-box assessment 💥.
</div><div>

[![mustacchio](../../_badges/thm-p/mustacchio.svg)](https://tryhackme.com/room/mustacchio)

For simple programs, we might be able to get the information we need using the commands below:

* `strace`: see every system call
* `strings`: extract every readable string, may not be installed
</div></div>

<hr class="sep-both">

## Code Obfuscation

[![javascriptdeobfuscation](../../../cybersecurity/_badges/htb/javascriptdeobfuscation.svg)](https://academy.hackthebox.com/course/preview/javascript-deobfuscation)

<div class="row row-cols-lg-2"><div>

Code obfuscation is an automated process to make the code less-readable for humans. A simple example would be by replacing variables names with less readable names such as `_0x565`.

Code obfuscation doesn't impact the program functionality, but it may impact its performance: obfuscated code is usually slower.
</div><div>

A few obfuscators for JavaScript:

* [beautifytools](http://beautifytools.com/javascript-obfuscator.php)
* [obfuscator.io](https://obfuscator.io/)
* [jjencode](https://utf-8.jp/public/jjencode.html)
* [aaencode](https://utf-8.jp/public/aaencode.html)

You may try [unpacker](https://matthewfl.com/unPacker.html) to un-obfuscate Javascript code.

</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* Minify code to make it less readable
* Use of encoding
* [scoding.de](https://scoding.de/uploads/r2_cs.pdf)
* [DOSfuscation](https://github.com/danielbohannon/Invoke-DOSfuscation)

```ps
Invoke-DOSfuscation> SET COMMAND type <path>
Invoke-DOSfuscation> encoding
Invoke-DOSfuscation\Encoding> 1
```
</div><div>

* [Bashfuscator](https://github.com/Bashfuscator/Bashfuscator)

```ps
$ bashfuscator -c 'cat /etc/passwd'
$ bashfuscator -c 'cat /etc/passwd' -s 1 -t 1 --no-mangling --layers 1
```
</div></div>