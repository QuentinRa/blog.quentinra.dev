# Encoding

<hr class="sr">

## Base64

<div class="row row-cols-md-2"><div>

Base64 is only an encoding function. This isn't doing an encryption, or something cool like that, so it's not used for confidentiality. It could be used to write (encode) an image/... as a string.

> Most base64 strings are ending with "=", or "==".
</div><div>

```bash
$ echo "toto" | base64
dG90bwo=
$ echo "dG90bw=" | base64 -d
toto
```
</div></div>