# Hashing algorithms

[![encryptioncrypto101](../../../_badges/thm/encryptioncrypto101.svg)](https://tryhackme.com/room/encryptioncrypto101)
[![johntheripper0](../../../_badges/thmp/johntheripper0.svg)](https://tryhackme.com/room/johntheripper0)
[![hashingcrypto101](../../../_badges/thmp/hashingcrypto101.svg)](https://tryhackme.com/room/hashingcrypto101)
[![hash_cracking](../../../_badges/poat/hash_cracking.svg)](https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/Methodology%20and%20Resources/Hash%20Cracking.md)
[![crackthehash](../../../_badges/thm-p/crackthehash.svg)](https://tryhackme.com/room/crackthehash)

<div class="row row-cols-md-2 mt-4"><div>

A hashing algorithm is a one-way function taking data and generating a  hash/digest. They are mainly used to:

* 🔒 Store passwords
* ✒️ Ensure authenticity <small>(digital signatures)</small>
* 🥷 Ensure integrity <small>(checksum)</small>
* 🫧 In algorithms such as in hashing tables

As a hash function is one-way, there is no way to know what was the data, but given the same data, we can verify if it generated the hash.
</div><div>

**Problems in hashing algorithms**

* **Hash collision** 👎: two different data generate the same hash. Some well-known vulnerable algorithms are [SHA1](https://shattered.io/), [MD5](https://www.mscs.dal.ca/~selinger/md5collision/)...

* **Determinism** 🛣️: a hash function always generate the same hash given the same input. It allows attackers to precompute hashes for well-known passwords, and perform a **rainbow table** attack. A salt is usually added to generate different hashes given the same data.

➡️ They are also brute force attacks using dictionaries of passwords. 
</div></div>

<hr class="sep-both">

## Generate a hash 🔑

<div class="row row-cols-md-2"><div>

👉 There are many language specific functions that should be wiser choice, but you can use these for testing.

* ➡️ Using `openssl`

```bash
# list formats
$ openssl list --digest-commands
md4 md5 sha1 [...]
# generate
$ echo -n "toto" | openssl dgst -md4
```

* ➡️compute and check XXX message digest ([gnu](https://www.gnu.org/software/coreutils/manual/html_node/Summarizing-files.html))

```bash
# if you don't use -n, it won't work
$ echo -n 'toto' | sha1sum
$ echo -n 'toto' | md5sum
$ echo -n 'toto' | sha256sum
$ echo -n 'toto' | sha512sum
```
</div><div>

* ➡️ Using `mkpasswd`

```bash
# list formats
$ mkpasswd -m help
bcrypt          bcrypt
sha512crypt     SHA-512
sha256crypt     SHA-256
md5crypt        MD5
nt              NT-Hash
[...]
# generate
$ mkpasswd -m sha512crypt toto
# or you can use htpasswd
$ htpasswd -bnBC 10 "" toto | tr -d ':\n' # bcrypt
```

* ➡️ Online tools

For instance, [decrypt.tools](https://decrypt.tools/encrypt) <small>(not many algos)</small> or [hashes.com](https://hashes.com/en/generate/hash) <small>(many algos)</small>.
</div></div>

<hr class="sep-both">

## Find the hash algorithm

<div class="row row-cols-md-2"><div>

Let's say we got some hash, and we want to find which algorithm generated this hash, such as MD5, SHA1...

```bash!
$ echo -n "some hash here" > myhash
```

* ➡️ Historically, we used [hash-identifier](https://github.com/blackploit/hash-identifier) (0.4k⭐). Obsolete (2011).

```bash
$ cat myhash | hash-identifier
```

* ➡️ [hashID](https://github.com/psypanda/hashID) (1.2k ⭐). Not updated since 2015.

```bash
$ cat myhash | hashid
```

* ➡️ [Name-that-hash](https://github.com/HashPals/Name-That-Hash) (1.2k ⭐). [Online version here](https://nth.skerritt.blog/). Gives the John (JtR) and the hashcat (hc) format for each.

```bash
# sudo apt install name-that-hash
$ nth -t "some hash here"
$ nth -f myhash
```
</div><div>

* ➡️ [haiti](https://github.com/noraj/haiti/) (0.4k ⭐). Similar to Name-that-hash, different results.

```bash
# sudo gem install haiti-hash
$ haiti "some hash here"
```

* ➡️ Online tools

For instance, [hashes.com](https://hashes.com/en/tools/hash_identifier) or [md5hashing.net](https://md5hashing.net/hash_type_checker).

* ➡️ Manually

Some tools may provide an incorrect format, or not support the format you are looking for. Some hashes are starting with well-known patterns:  "\\$1\\$" <small>(crypt, cisco, old Linux)</small>, "\\$2\\$, \\$2a\\$, \\$2b\\$, \\$2x\\$, \\$2y\\$" <small>(bcrypt, web)</small>, or "$6" <small>(sha512crypt, modern Linux)</small>. 

👉 You can find a lot of examples [on hashcat website](https://hashcat.net/wiki/doku.php?id=example_hashes).
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [old](_old.md)
</div><div>
</div></div>