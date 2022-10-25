# Server-side exploits

<hr class="sl">

## Server enumeration

*The goal is to find "hidden" files/directories.*

<div class="row row-cols-md-2"><div>

[GoBuster](https://github.com/OJ/gobuster) (6.7k ⭐) is a tool in GO, which given a wordlist of directories, will try to find if this server has any of them.

```bash
# kali
$ cd /usr/share/wordlists/dirbuster/
$ gobuster dir -u url_or_ip -w directory-list-2.3-small.txt
```

This tool can also append an extension to every word in the wordlist. For instance,

```bash
$ gobuster dir -u url_or_ip -w directory-list-2.3-small.txt -w php
$ gobuster dir -u url_or_ip -w directory-list-2.3-small.txt -w php,html
```
</div><div>

...
</div></div>