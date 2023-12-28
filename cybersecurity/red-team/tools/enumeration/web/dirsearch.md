# dirsearch

<div class="row row-cols-lg-2"><div>

[dirsearch](https://github.com/maurosoria/dirsearch) (10.6k ⭐) can be installed with `apt install dirsearch`, and there is an implementation in GO if you want to.

```ps
$ dirsearch -u URL # use default wordlist
$ dirsearch -u URL -w wordlist
```

Ignore some error codes

```ps
$ dirsearch [...] -x 404
$ dirsearch [...] -x 404,500
```
</div><div>

You can append some extensions

```ps
$ dirsearch [...] -e php
$ dirsearch [...] -e php,html
```
</div></div>