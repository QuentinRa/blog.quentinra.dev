# Encoding

<div class="row row-cols-md-2"><div>

Encoding 🖼️️ is a way of presenting data. Unlike encryption 🔒, anyone that can identify the algorithm used can decode the message.

A radix or a base is a number of unique digits that we can use to encode a message. The most well-known ones are

* binary <small>(radix 2, $[0-1]$)</small>
* octal <small>(radix 8, $[0-7]$)</small>
* hexadecimal <small>(radix 16, $[0-9]$ and $[A-F]$)</small>
* base32 <small>($[A-Z]$ and $[2-7]$ or $[A-V]$ and $[0-9]$)</small>
* base64 <small>($[A-Z]$ and  $[0-9]$ and $[+/]$ and "=" for padding)</small>
</div><div>

**Some common rules** 📌

* In a $radix\ n$, values goes from $0$ to $n-1$
* After 9, we are using letters
* After 35, we are using symbols
* ...
* $(n)_{k}$ means that the number $n$ is in a radix $k$

**Some tools to detect the encoding/decode/encode** 🚀

* [CyberChef](https://github.com/gchq/CyberChef) (19.2k ⭐) | [Online version](https://gchq.github.io/CyberChef/)
* Burp Suite Decoder
* [Decodify](https://github.com/s0md3v/Decodify) (0.8k ⭐)
</div></div>

<hr class="sep-both">

## Base64

<div class="row row-cols-md-2"><div class="align-self-center">

Base64 is usually used to encode an image/..., so that we can transfer it as a string. Most base64 strings are ending with "=", or "==".

* [base64encode](https://www.base64encode.org/)
* [base64decode](https://www.base64decode.org/)
</div><div>

```bash
$ echo "toto" | base64
dG90bwo=
$ echo "dG90bw=" | base64 -d
toto
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

URL encoding

* [urlencoder](https://www.urlencoder.io/)
* add a section here about URL encoding, instead of having it in many places
* [old](_old.md)
</div><div>

</div></div>