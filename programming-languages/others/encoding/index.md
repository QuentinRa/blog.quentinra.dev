# Encoding

<div class="row row-cols-md-2"><div>

Encoding, unlike encryption, is simply another way of presenting data. Anyone that knows the algorithm used for encryption, can easily decode the message. In most cases, it's usually

* base32 <small>[A-Z] and [2-7] or [A-V] and [0-9]...</small>
* base64 <small>(a-Z, 0-9, +, /, and "=" for padding)</small> 📌
* hexadecimal <small>(radix/base 16)</small>
</div><div>

You can use [CyberChef](https://github.com/gchq/CyberChef) (19.2k ⭐) to encode/decode a message. They have an [online version here](https://gchq.github.io/CyberChef/).

You can use [Burp Suite Decoder](/_cybersecurity/exploitation/web/burpsuite/index.md#decoder-tab).

There is also a python tool called [Decodify](https://github.com/s0md3v/Decodify) (0.8k ⭐).
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