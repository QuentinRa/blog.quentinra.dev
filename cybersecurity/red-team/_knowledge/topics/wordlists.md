# Red-Team Wordlists ⛪

[![passwordattacks](../../../_badges/thmp/passwordattacks.svg)](https://tryhackme.com/room/passwordattacks)

<div class="row row-cols-lg-2"><div>

Wordlists are files with one item per line, usually, a word.

They are mainly used to automate tasks. For instance, to perform a password attack, we will most likely use a wordlist will a list of usernames to test, and a password wordlist with common passwords.

* 🏝️ Find common (+hidden) directories on a web server
* 🔑 Test common passwords
* 🥷 Find hidden form parameters, headers, etc.
* ...

CTFs are usually using the infamous `rockout.txt` for passwords  <small>(from the data breach of rockyou.com in 2009)</small>. For default passwords, you might want to check out [cirt](https://cirt.net/passwords), [default-password](https://default-password.info/), and [data recovery](https://datarecovery.com/rd/default-passwords/).


</div><div>

[SecLists](https://github.com/danielmiessler/SecLists) (50.6k ⭐) is the most popular place to find wordlists.

```shell!
$ sudo apt-get install seclists
/usr/share/seclists/Passwords/darkweb2017-top10000.txt
/usr/share/seclists/Usernames/xato-net-10-million-usernames.txt
...
```

On Kali, we can install the package [wordlists](https://github.com/drtychai/wordlists) (0.1k ⭐) to access the most common wordlists excluding SecLists wordlists.

```shell!
$ sudo apt-get install wordlists
$ wordlists  # extract rockyou.txt, press Y
/usr/share/wordlists/rockyou.txt
/usr/share/wordlists/dirb/others/best1050.txt
/usr/share/wordlists/dirb/others/best110.txt
...
```
</div></div>

<hr class="sep-both">

## Custom Wordlists

<div class="row row-cols-md-2"><div>

#### Fast wordlist generation

See also: [cook](https://github.com/glitchedgitz/cook) (0.6k ⭐) or [CeWL](https://github.com/digininja/CeWL) (1.4k ⭐), [cupp](https://github.com/Mebus/cupp) (3.5k ⭐), [username_generator](https://github.com/shroudri/username_generator) (0.03k ⭐).

You can also use: [JohnTheReaper](/cybersecurity/cryptography/algorithms/hashing/cracking/john.md#wordlist-generation) or [hashcat](/cybersecurity/cryptography/algorithms/hashing/cracking/hashcat.md#wordlist-generation)!

```shell!
$ seq 0 99 > 0_to_99.lst
$ echo {A..Z} | tr ' ' '\n' > AZ.lst
$ echo user{0..9} | tr ' ' '\n' > user_0_to_9.lst
$ echo {admin,adm,user} | tr ' ' '\n' > simple_list.lst
$ cewl -w output.lst -d depth -m word_size URL
$ crunch minlength maxlength charset -o crunch.txt # BIG
$ python3 cupp.py -i # based on a profile
```
</div><div>

#### Tune wordlists

If the minimum length for a password is 6 characters, you may want to remove shorter passwords. Refer to the [regex](/tools-and-frameworks/knowledge/regex/index.md) section.

```shell!
$ # only keep 4 letters passwords
$ egrep '^.{4}$' /usr/share/wordlists/rockyou.txt > /tmp/4rock.lst
```

You may also want to merge wordlists...

```shell!
$ cat wordlist1 wordlist2 wordlist3 > wordlist123
$ uniq -u wordlist123 > uwordlist # duplicates
$ sort wordlist123 > swordlist # sort
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [big-list-of-naughty-strings](https://github.com/minimaxir/big-list-of-naughty-strings) <small>(45.5k ⭐)</small>
* [fuzzdb](https://github.com/fuzzdb-project/fuzzdb) <small>(7.8k ⭐, 2020 🪦)</small>
</div><div>
</div></div>