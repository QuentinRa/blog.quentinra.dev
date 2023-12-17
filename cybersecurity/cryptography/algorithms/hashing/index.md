# Hashing algorithms

[![encryptioncrypto101](../../../_badges/thm/encryptioncrypto101.svg)](https://tryhackme.com/room/encryptioncrypto101)
[![hashingcrypto101](../../../_badges/thmp/hashingcrypto101.svg)](https://tryhackme.com/room/hashingcrypto101)
[![hash_cracking](../../../_badges/poat/hash_cracking.svg)](https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/Methodology%20and%20Resources/Hash%20Cracking.md)
[![crackthehash](../../../_badges/thm-p/crackthehash.svg)](https://tryhackme.com/room/crackthehash)
[![c4ptur3th3fl4g](../../../_badges/thm-p/c4ptur3th3fl4g.svg)](https://tryhackme.com/room/c4ptur3th3fl4g)
[![corridor](../../../_badges/thm-p/corridor.svg)](https://tryhackme.com/room/corridor)

<div class="row row-cols-lg-2"><div>

A hashing algorithm is a one-way function taking data and generating a  hash/digest. They are mainly used to:

* 🔒 Store passwords
* ✒️ Ensure authenticity <small>(digital signatures)</small>
* 🥷 Ensure integrity <small>(checksum)</small>
* 🫧 In algorithms such as in hashing tables

Since a hash function is one-way, it's impossible to know the original data. However, we can use a hash function to verify if some data matches a corresponding hash.
</div><div>

**Problems in hashing algorithms**

* **Hash collision** 👎: two different data generate the same hash. Some well-known vulnerable algorithms are [SHA1](https://shattered.io/), [MD5](https://www.mscs.dal.ca/~selinger/md5collision/)...

* **Determinism** 🛣️: a hash function always generates the same hash given the same data. It allows attackers to precompute hashes for well-known passwords, and perform a **rainbow table** attack. A salt is a parameter <small>(usually, a random string)</small> added to generate different hashes given the same data. Only calling the hash function with the same salt results in the same output.

➡️ They may use brute force with a dictionary of passwords too.
</div></div>

<hr class="sep-both">

## Generate a hash 🔑

<div class="row row-cols-lg-2"><div>

👉 There are many language-specific functions, but you can use these commands for testing.

```
$ echo -n 'password' | <command> | cut -f1 -d' ' > myhash
```

* ➡️ Using `openssl`

```ps
# list formats
$ openssl list --digest-commands
md4 md5 sha1 [...]
# generate
$ echo -n "toto" | openssl dgst -md4
```

* ➡️compute and check XXX message digest ([gnu](https://www.gnu.org/software/coreutils/manual/html_node/Summarizing-files.html))

```ps
# if you don't use -n, it won't work
$ echo -n 'toto' | sha1sum
$ echo -n 'toto' | md5sum
$ echo -n 'toto' | sha256sum
$ echo -n 'toto' | sha512sum
```
</div><div>

* ➡️ Using `mkpasswd`

```ps
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

For instance, [decrypt.tools](https://decrypt.tools/encrypt) <small>(not many algos)</small>, [hashes.com](https://hashes.com/en/generate/hash) <small>(many algos)</small>, or [tunnelsup](https://www.tunnelsup.com/hash-analyzer/).
</div></div>

<hr class="sep-both">

## Find the hash algorithm

[![linuxstrengthtraining](../../../_badges/thm/linuxstrengthtraining.svg)](https://tryhackme.com/room/linuxstrengthtraining)

<div class="row row-cols-lg-2"><div>

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

Some tools may suggest an incorrect format or not support the format you are looking for. You can still try to do it manually.

Some hashes are starting with well-known formats: `$id$salt$hash` or `hash:salt`. Some known values for `id` are: `1` <small>(crypt, cisco, old Linux)</small>, `2`/`2a`/`2b`/`2x`/`2y` <small>(bcrypt, web)</small>, `5` <small>(sha256crypt)</small>, `6` <small>(sha512crypt, modern Linux)</small>.

Apache uses `$apr1$hash` while WordPress uses `$P$hash`.

Some hashes can be identified by their length.

👉 You can find a lot of examples [on hashcat website](https://hashcat.net/wiki/doku.php?id=example_hashes).
</div></div>

<hr class="sep-both">

## Hash cracking

<div class="row row-cols-lg-2"><div>

Hash cracking usually involves a dictionary with a list of potential passwords a.k.a. [wordlist](/cybersecurity/red-team/_knowledge/index.md#wordlists-) <small>(Rainbow tables may be used for older systems)</small>.

👉 CTFs are usually using `/usr/share/wordlists/rockyou.txt`.

* ➡️ [hashcat](/cybersecurity/cryptography/algorithms/hashing/cracking/hashcat.md) (hc)


* ➡️ [John the Ripper](/cybersecurity/cryptography/algorithms/hashing/cracking/john.md) (JtR)
</div><div>

* ➡️ Online tools

For instance, [crackstation](https://crackstation.net/) <small>(you can download their wordlist!)</small>, [MD5Hashing](https://md5hashing.net/), [decrypt.tools](https://decrypt.tools/), [hashkiller.io](https://hashkiller.io/listmanager), or [hashes.com](https://hashes.com/en/decrypt/hash).

⚠️ Hash cracking tools are usually using your CPU to compute results faster. On a virtual machine, they may be less efficient, as the VM itself takes a lot of resources.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [Hash-Buster](https://github.com/s0md3v/Hash-Buster)
* Blowfish and BCrypt (rounds of Blowfish)
* Use a smaller targeted wordlist for bcrypt
* Argon2
</div><div>
</div></div>