# hydra

[![hydra](../../../../_badges/thm/hydra.svg)](https://tryhackme.com/room/hydra)
[![adventofcyber4](../../../../_badges/thm/adventofcyber4/day5.svg)](https://tryhackme.com/room/adventofcyber4)
[![protocolsandservers2](../../../../_badges/thmp/protocolsandservers2.svg)](https://tryhackme.com/room/protocolsandservers2)
[![passwordattacks](../../../../_badges/thmp/passwordattacks.svg)](https://tryhackme.com/room/passwordattacks)
[![loginbruteforcing](../../../../../cybersecurity/_badges/htb/loginbruteforcing.svg)](https://academy.hackthebox.com/course/preview/login-brute-forcing)

<div class="row row-cols-lg-2"><div>

[Hydra](https://github.com/vanhauser-thc/thc-hydra) (8.6k ⭐) is a well-known tool to [brute force authentication](/cybersecurity/red-team/s2.discovery/techniques/network/auth.md) services such SSH, FTP, RDP, MySQL... It can even be used on login forms too, but that's uncommon.

```ps
$ wordlist=/usr/share/wordlists/rockyou.txt
# use ssh, ftp...
$ hydra -l username -P $wordlist ssh://IP
$ hydra -l username -P $wordlist ssh://IP:port
$ hydra -l username -P $wordlist ftp://IP
$ hydra -l username -P $wordlist rdp://IP
$ hydra -l xxx@xxx.xxx -P $wordlist smtp://IP
$ [...]
# alternate form
$ hydra -l username -P $wordlist IP ssh -s port
```

➡️ I use a variable `$wordlist` to write shorter commands. <br>
 You can learn more about [wordlists here](/cybersecurity/red-team/_knowledge/topics/wordlists.md) 🖋️.

⚠️ If you don't provide an username, hydra will try to find as many working credentials as possible. To stop at the first one, use `-f`.
</div><div class="align-self-center">

* `-l username`: try this username
* `-L file`: try a list of usernames
* `-p password`: try this password
* `-P file`: try a list of passwords
* `-C file`: instead of L/P, provide a list of "username:password"
* `-s port`: use another port
* `-t n`: use $n$ threads <small>(default: 16)</small> | `4` for services
* `-v` / `-d` : verbose / debug
* `-V`: show login+password for every attempt
* `-e [values]` such as `-e nsr` for all three
    * `n`: try null password
    * `s`: try login as pass
    * `r`: try reversed login
* `-f`: quit on first log in found
* `-u`: try all usernames for each password
</div></div>

<hr class="sep-both">

## Special uses

<div class="row row-cols-lg-2"><div>

#### form brute force

Try to brute force the account "toto". `^USER^`/`^PASS^` mean replace with the username/password. `username=`/`password=` are the name of the fields. `F=` is a word in the answer indicates a failure. See also: `S=`.

```shell!
$ hydra -l toto -P wordlist IP http-get-form "/login.php:username=^USER^&password=^PASS^:F=incorrect" -V
$ hydra -l toto -P wordlist IP http-post-form "/login.php:username=^USER^&password=^PASS^:F=incorrect" -V
```
</div><div>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* HTTP Basic Auth: `[...] IP http-get /`
</div><div>
</div></div>