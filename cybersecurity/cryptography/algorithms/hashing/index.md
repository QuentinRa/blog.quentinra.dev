# Hashing algorithms

<div class="row row-cols-md-2 mt-4"><div>

A hashing algorithm is a one-way function taking data and generating a  hash/digest. They are mainly used to:

* 🔒 Store passwords
* ✒️ Ensure authenticity (digital signatures)
* 🥷 Ensure integrity (checksum)
* 🫧 In algorithms such as in hashing tables

As a hash function is one-way, there is no way to know what was the data, but given the same data, we can verify if it generated the hash.
</div><div>

**Problems in hashing algorithms**

* **Hash collision** 👎: two different data generate the same hash. Some well-known vulnerable algorithms are [SHA1](https://shattered.io/), [MD5](https://www.mscs.dal.ca/~selinger/md5collision/)...

* **Determinism** 🛣️: a hash function always generate the same hash given the same input. It allows attackers to precompute hashes for well-known passwords, and perform a **rainbow table** attack. A salt is usually added to generate different hashes given the same data.

➡️ They are also brute force attacks using dictionaries of passwords. 
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [old](_old.md)
</div><div>
</div></div>