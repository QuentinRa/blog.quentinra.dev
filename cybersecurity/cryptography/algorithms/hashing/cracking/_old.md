# XXX


<div class="row row-cols-lg-2"><div>
</div><div>

**Token length exception**: I had this error so many times that I got crazy about it. There are many causes for this error, unfortunately.

* 🧐 Try to look for your hash format [on hashcat website](https://hashcat.net/wiki/doku.php?id=example_hashes). There is an example of the output that hashcat is expecting. For instance, sometimes, you need a file with `hash:salt`.

* 🪲 I don't know why, but it worked for me when I didn't use a file: `hashcat -m 160 hash:key wordlist`.
</div></div>

<hr class="sep-both">

## Wordlist generation

[![passwordattacks](../../../../_badges/thmp/passwordattacks.svg)](https://tryhackme.com/room/passwordattacks)

<div class="row row-cols-lg-2"><div>

You can create a wordlist using hashcat using:

```ps
$ hashcat -a 3 <format> --stdout > wordlist
```
</div><div>

The format is a string with meta-character such as:

* `?l`: lower characters (a-z)
* `?u`: upper characters (A-Z)
* `?d`: number (0-9)
* ...

For instance, `?d?d?d` means 3 numbers.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* Your device driver installation is probably broken. See also: https://hashcat.net/faq/wrongdriver

* https://hashcat.net/wiki/doku.php?id=mask_attack
</div><div>
</div></div>