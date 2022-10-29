# Encoding

<div class="row row-cols-md-2"><div>

Encoding, unlike encryption, is simply another way of presenting data. Anyone that know the algorithm used for encryption, can easily decode the message. In most cases, it's usually either base64, or hexadecimal that is used.
</div><div>

You can use [CyberChef](https://github.com/gchq/CyberChef) (19.2k ⭐) to encode/decode a message. They have an [online version here](https://gchq.github.io/CyberChef/).
</div></div>

<hr class="sl">

## Base64

<div class="row row-cols-md-2"><div class="align-self-center">

Base64 is usually used to encode an image/..., so that we can transfer it as a string. Most base64 strings are ending with "=", or "==".
</div><div>

```bash
$ echo "toto" | base64
dG90bwo=
$ echo "dG90bw=" | base64 -d
toto
```
</div></div>