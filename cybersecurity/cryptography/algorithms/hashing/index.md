# Hashing algorithms

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

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [old](_old.md)
</div><div>
</div></div>