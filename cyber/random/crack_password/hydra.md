# Bruteforce authentication services

<hr class="sl">

## Hydra

[![hydra](../../_badges/hydra.svg)](https://tryhackme.com/room/hydra)

<div class="row row-cols-md-2"><div>

[Hydra](https://github.com/vanhauser-thc/thc-hydra) (6.8k ⭐) is a well-known tool to bruteforce authentication services such SSH, FTP, RTP, MySQL... It can even be used for login forms, but that's convered somewhere else.

```bash
$ rockyou=/usr/share/wordlists/rockyou.txt
# use ssh, ftp...
$ hydra -l username -P $rockyou ssh://MACHINE_IP
# alternate forms
$ hydra -l username -P $rockyou MACHINE_IP ssh
```
</div><div>

* `-l username`: try this username
* `-L file`: try a list of usernames
* `-p password`: try this password
* `-P file`: try a list of passwords
* `-C file`: instead of L/P, provide a list of "username:password"
* `-s port`: use another port
* `-t n`: use $n$ threads
* `-V`: verbose
</div></div>