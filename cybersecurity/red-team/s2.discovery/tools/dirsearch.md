# dirsearch

<div class="row row-cols-md-2"><div>

[dirsearch](https://github.com/maurosoria/dirsearch) (9.5k ⭐) can be installed with `apt install dirsearch`, and there is an implementation in GO if you want to.

```bash!
$ dirsearch -u URL # use default wordlist
$ dirsearch -u URL -w wordlist
```

Ignore some error codes

```bash!
$ dirsearch [...] -x 404
$ dirsearch [...] -x 404,500
```
</div><div>

You can append some extensions

```bash
$ dirsearch [...] -e php
$ dirsearch [...] -e php,html
```
</div></div>