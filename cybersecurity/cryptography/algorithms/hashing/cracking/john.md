# John the Ripper

[![johntheripper0](../../../../_badges/thmp/johntheripper0.svg)](https://tryhackme.com/room/johntheripper0)
[![linuxstrengthtraining](../../../../_badges/thm/linuxstrengthtraining.svg)](https://tryhackme.com/room/linuxstrengthtraining)
[![password_attacks](../../../../_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)

<div class="row row-cols-lg-2"><div>

[John the Ripper](https://github.com/openwall/john) (<small>Jumbo</small>, 7.4k ⭐), a.k.a. **john**/**JtR** is, like hashcat, a tool to crack hashes. For convenience's sake, we store the hash in `myhash`.

```ps
# use single quotes, so that $/... aren't interpreted
$ echo 'some hash here' > myhash
```

List hash formats. Standard formats such as MD5 start with "raw-".

```shell!
$ john --list=formats | grep -i "md5"
```
</div><div>

Cracked passwords are usually stored in `~/.john/john.pot`. If a hash was already cracked, you can show it using:

```shell!
$ john myhash --show
hash:password
```
</div></div>

<hr class="sep-both">

## Formats and wordlists

<div class="row row-cols-lg-2"><div>

Reminder: the wordlist is the list of passwords to test, while the format is the kind of hash, such as MD5.

👉 With an incorrect hash <small>(improperly formatted)</small>, or an incorrect format <small>(MD5 specified, but it was MD4...)</small>, john will mostly likely start then stop.

* 🥉 Let john guess the format and use the default wordlist

```shell!
$ john myhash
$ john 'some hash here' # if you didn't use a file
```

</div><div>

* 🥈 Give the format but use john default wordlist

```shell!
$ john myhash --format=raw-md5
$ john myhash --format=raw-md4
$ john myhash --format=raw-sha1
```

* 🏆 Give both the format and the wordlist

```shell!
$ john hash --format=raw-md4 --wordlist=/usr/share/wordlists/rockyou.txt
```

⚠️ It seems that now, you must call `john hash --format=XXX --show` after cracking a hash, to see the password. Remove the leading "`?:`".
</div></div>

<hr class="sep-both">

## Single crack mode 

[![passwordattacks](../../../../_badges/thmp/passwordattacks.svg)](https://tryhackme.com/room/passwordattacks)
[![password_attacks](../../../../_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)

<div class="row row-cols-lg-2"><div>

The single crack mode is one of JtR modes. In this mode, we define rules 🔏 that are applied to the wordlist, to generate a new "enhanced" wordlist. 🔥 For instance, users tend to

* 🔤 capitalize the first letter
* 🔢 add a number at the end
* 🔣 add a symbol after the number <small>(if required)</small>

This is the default mode. It can be explicitly called with:

```shell!
$ john myhash --single [...]
```

👉 Default rules are stored in `/etc/john/john.conf`.

➡️ See Word Mangling, and GECOS fields.
</div><div>

#### Custom rules

Create a file `xxx.rules` with some rules inside:

```ini!
[List.Rules:RuleName]
; refer to the documentation
```

```shell!!
$ john myhash --single --rules=xxx.rules [...]
```

#### Wordlist generation

By adding `--stdout` to john, and not providing a hash, john will output a wordlist after applying a rule:

```shell!!
$ john --wordlist=xxx --rules=yyy --stdout > wordlist
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* `--incremental` mode
</div><div>
</div></div>