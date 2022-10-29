# Crack (insecure) passwords

[![encryptioncrypto101](../../_badges/encryptioncrypto101.svg)](https://tryhackme.com/room/encryptioncrypto101)
[![johntheripper0](../../_badges/johntheripper0.svg)](https://tryhackme.com/room/johntheripper0)
[![hashingcrypto101](../../_badges/hashingcrypto101.svg)](https://tryhackme.com/room/hashingcrypto101)

<div class="row row-cols-md-2"><div>

Almost all the time, password are **hashed**. It means that some "clear text" is passed to a one-way function that returns (=digest) a hash. One-way means that you can't get back the password from the hash. But, we can check if a password has generated a hash, so it's a useful, and supposedly secure way of storing a password.
</div><div>

The most important use of hashing is for integrity. We generate a hash of file/..., and make it available with the file. Others can generate the hash of the file after they download it. If both are the same, then it means that the content was not tempered with.
</div></div>

> Some hashing functions are proven to be faulty, such as [SHA1](https://shattered.io/), or [MD5](https://www.mscs.dal.ca/~selinger/md5collision/), as two different password generated the same hash (hash collision), which means that using a different password that intended, you could log in into the victim account.

<hr class="sl">

## Find which algorithm generated this hash

<div class="row row-cols-md-2"><div>

There are a few solutions to find which kind a hash algorithm was used to generate a hash. We consider in the following, that the hash is stored inside a file called "hash".

Historically, there was [hash-identifier](https://github.com/blackploit/hash-identifier) (399⭐), but it's kinda old (2011).

```bash
$ cat hash | hash-identifier
$ hash-identifier "some_hash"
```

[hashID](https://github.com/psypanda/hashID) (1.2k ⭐, not updated since 2015)

```bash
$ cat hash | hashid
$ hashid "some_hash"
```
</div><div>

[Name-that-hash](https://github.com/HashPals/Name-That-Hash) (1.1k ⭐, fork of hashID). There is an [online version](https://nth.skerritt.blog/). The program is giving you john (JtR), and the hashcat (hc) format 🚀! 

```bash
# sudo apt install name-that-hash
$ nth -t "some_hash"
$ nth -f hash
```

[haiti](https://github.com/noraj/haiti/) (309 ⭐). The program is giving you john (JtR), and the hashcat (hc) format 🚀!

```bash
$ sudo gem install haiti-hash
$ haiti "some_hash"
```

* [hashes.com/hash_identifier](https://hashes.com/en/tools/hash_identifier) (website)
</div></div>

> You might have to do it manually too. Some well-known one are "\\$1\\$" <small>(cisco, old linux)</small>, "\\$2\\$, \\$2a\\$, \\$2b\\$, \\$2x\\$, \\$2y\\$" <small>(bcrypt, web)</small>, or "$6" <small>(sha512crypt, modern linux)</small>. You can find a lot of examples [on hashcat website](https://hashcat.net/wiki/doku.php?id=example_hashes).

<hr class="sr">

## Cracking a hash

<div class="row row-cols-md-2"><div>

You can use [**John the Ripper**](https://github.com/openwall/john) to try to bruteforce a hash.

Put the hash in a file, for instance "hash".

```bash
# md5
john --format=raw-md5 hash
john --format=raw-md4 hash
john --format=raw-sha1 hash
```

</div><div>

You can provide a wordlist

```bash
# on Kali
john --format=raw-md4 --wordlist=/usr/share/wordlists/rockyou.txt hash
```

**Notes**

* Merge wordlist: `cat wordlist1 wordlist2 wordlist3 > wordlist4`
</div></div>

<hr class="sl">

## GPG

<div class="row row-cols-md-2"><div>

The `gpg` tool can be used to encrypt files, using a passphrase, which is like a password. It can also be used to sign something. For instance, GitHub allow you to sign your commits using GPG keys.

To encrypt something, you could do this. It will generate a `file.gpg`

```bash
$ gpg --cipher-algo AES-256 --symmetric file
```

And, to decrypt <small>(no passphrase is asked if it is cached)</small>

```bash
$ gpg -d file.gpg
# generate back file
```
</div><div>

You can **crack a gpg passphrase** using john too! But, you need to convert the gpg passphrase to a hash first.

```bash
$ sudo gpg2john file.pgp > hash
```

Then, use john as usual, with the format "gpg"

```bash
$ john --format=gpg hash --wordlist=/usr/share/wordlists/rockyou.txt 
```

> If by any means you got someone's private key that was used to encrypt this file <small>(a key may be used instead of a passphrase)</small>, then use `gpg --import xxx.key` to import it, and decrypt the file as usual.
</div></div>

<hr class="sr">

## SSH private key

<div class="row row-cols-md-2"><div>

Some users are using a key instead of a password while connecting to a server via SSH, because, as long as the key do not leak, it's more secure than sending credentials.

```bash
ssh -i key
```
</div><div>

The key is usually protected by a passphrase. You can use `ssh2jhon` to convert it to a file that `john` can try to break.

```bash
$ ssh2jhon key > hash
$ john --format=ssh hash --wordlist=/usr/share/wordlists/rockyou.txt
```
</div></div>

<hr class="sl">

## RAR password cracking

<div class="row row-cols-md-2"><div>

As for SSH, first convert the password to a file compatible with john.

```bash
$ rar2john hello.rar > hash
$ john hash --wordlist=/usr/share/wordlists/rockyou.txt
```
</div><div>

If you found the password, you can unrar your rar with

```bash
$ unrar x hello.rar
# enter the password
```
</div></div>

<hr class="sr">

## ZIP password cracking

<div class="row row-cols-md-2"><div>

As for RAR, first convert the password to a file compatible with john.

```bash
$ zip2john hello.zip > hash
$ john hash --wordlist=/usr/share/wordlists/rockyou.txt
```
</div><div>

If you found the password, you can unzip your zip with

```bash
$ unzip hello.zip
# enter the password
```
</div></div>