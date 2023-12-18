# GnuPG (GPG)

[![networksecurityprotocols](../../_badges/thmp/networksecurityprotocols.svg)](https://tryhackme.com/room/networksecurityprotocols)
[![linuxstrengthtraining](../../_badges/thm/linuxstrengthtraining.svg)](https://tryhackme.com/room/linuxstrengthtraining)
[![encryptioncrypto101](../../_badges/thm/encryptioncrypto101.svg)](https://tryhackme.com/room/encryptioncrypto101)

<div class="row row-cols-lg-2"><div>

The `gpg` tool can be used to encrypt files, using a passphrase, which is like a password. It can also be used to sign something. For instance, GitHub allows you to sign your commits using GPG keys.

To encrypt something, you could do this. It will generate a `file.gpg`

```shell!
$ gpg --cipher-algo AES-256 --symmetric file
```

And, to decrypt <small>(no passphrase is asked if it is cached)</small>

```ps
$ gpg -d file.gpg
# generate back your file
```
</div><div>

A **private key** can be used instead of a passphrase. To decrypt a file that was encrypted using a private key:

```ps
$ gpg --import xxx.key [...]
```

🔐 To crack a gpg encrypted file, refer to [password brute force](/cybersecurity/cryptography/algorithms/hashing/index.md#gpg-passphrase-cracking).
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* PGP (Pretty Good Privacy). GnuPG/GPG = implementation from the GNU project.
</div><div>
</div></div>