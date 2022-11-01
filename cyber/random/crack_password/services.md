# Bruteforce authentication services

<hr class="sl">

## Hydra

[![hydra](../../_badges/hydra.svg)](https://tryhackme.com/room/hydra)

<div class="row row-cols-md-2"><div>

[Hydra](https://github.com/vanhauser-thc/thc-hydra) (6.8k ⭐) is a well-known tool to bruteforce authentication services such SSH, FTP, RDP, MySQL... It can even be used for login forms, but that's convered somewhere else.

```bash
$ wordlist=/usr/share/wordlists/rockyou.txt
# use ssh, ftp...
$ hydra -l username -P $wordlist ssh://MACHINE_IP
# alternate forms
$ hydra -l username -P $wordlist MACHINE_IP ssh
# without using a variable
$ hydra -l username -P /usr/share/wordlists/rockyou.txt ssh://MACHINE_IP
```
</div><div class="align-self-center">

* `-l username`: try this username
* `-L file`: try a list of usernames
* `-p password`: try this password
* `-P file`: try a list of passwords
* `-C file`: instead of L/P, provide a list of "username:password"
* `-s port`: use another port
* `-t n`: use $n$ threads (default: 16)
* `-v`: verbose
* `-V`: show login+password for each attempt
* `-e [values]` such as `-e nsr`
  * `n`: try null password
  * `s`: try login as pass
  * `r`: try reversed login
</div></div>

<hr class="sr">

## Nmap

<div class="row row-cols-md-2"><div>

```bash
$ nmap IP -p 22 --script ssh-brute --script-args userdb=users.lst,passdb=pass.lst
```

> More services? See [nmap brute list of NSE scripts](https://nmap.org/nsedoc/categories/brute.html).
</div><div>

Both `.lst` files are literally files with one username/password per line, and nmap will try the cartesian product of both files <small>(i.g. the first username with every password, the second username with every password...)</small>.
</div></div>