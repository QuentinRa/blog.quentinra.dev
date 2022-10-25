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

Note that you can add a port if no 80/443 with `:port` after the IP/URL. This tool can also append an extension to every word in the wordlist. For instance,

```bash
$ gobuster dir -u url_or_ip -w directory-list-2.3-small.txt -w php
$ gobuster dir -u url_or_ip -w directory-list-2.3-small.txt -w php,html
```

You can provide an username with `-U`, a password with `P`, use a proxy <nobr>(`-p`)</nobr>, and provide a cookie (`-c`) simulating that we are logged in.
</div><div>

[dirsearch](https://github.com/maurosoria/dirsearch) (8.7k ⭐) is a python web scanner. You can install it with `apt install dirsearch`, and there is an implementation in GO if you want to.

```bash
$ dirsearch -u ip_or_address
# use a special port
$ dirsearch -u ip_or_address:port
# test adding .php
$ dirsearch -u ip_or_address -e php
# ignore ...
$ dirsearch -u ip_or_address -e php -x 404
$ dirsearch -u ip_or_address -e php -x 404,500
```
</div></div>