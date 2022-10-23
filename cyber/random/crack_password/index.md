# Crack (insecure) passwords

<div class="row row-cols-md-2"><div>

Cryptography is used to **protect confidentiality** <small>(can someone eavesdrop on your conversations?)</small>, **ensure integrity** <small>(are the message exchanged untempered?)</small>, along with **authenticity** <small>(are you really exchanging with the person you believe to be exchanging?)</small>.

* [DamnVulnerableCryptoApp](https://damnvulnerablecryptoapp.github.io/DamnVulnerableCryptoApp/) might be worth the check
</div><div>

We are mostly using something called the **checksum** to ensure the integrity.

While we usually rely on **signatures**, and/or **certificates** used by trusted parties to ensure authenticity.
</div></div>

<hr class="sl">

## Cracking a hash

<div class="row row-cols-md-2"><div>

Almost all the time, password are **hashed**. It means that some "clear text" is passed to a one-way function that returns a hash. One-way means that you can't get back the password from the hash. But, we can check if a password has generated a hash, so it's a useful, and supposedly secure way of storing a password.

</div><div>

The most important use of hashing is for integrity. We generate a hash of file/..., and make it available with the file. Others can generate the hash of the file after they download it. If both are the same, then it means that the content was not tempered with.

> Some hashing functions are proven to be faulty, such as SHA1, or MD5, as two different password generated the same hash, which means that using a different password that intended, you could log in into the victim account.
</div></div>

<div class="row row-cols-md-2"><div>

You can use [**hash-identifier**](https://github.com/blackploit/hash-identifier) to find which kind a hash algorithm was used to generate a hash.

Put the hash in a file, for instance "hash".

```bash
$ cat hash | hash-identifier
# or
$ hash-identifier "some_hash"
```

You may also try your luck with [hashes.com/hash_identifier](https://hashes.com/en/tools/hash_identifier), or the new modern alternative to hash-identifier: [haiti](https://noraj.github.io/haiti/#/).
</div><div>

You can use [**John the Ripper**](https://github.com/openwall/john) to try to bruteforce a hash.

Put the hash in a file, for instance "hash".

```bash
# md 5
john --format=raw-md5 hash
john --format=raw-md4 hash
john --format=raw-sha1 hash
```

You can provide a wordlist

```bash
# on Kali
john --format=raw-md4 --wordlist=/usr/share/wordlists/rockyou.txt myHash.txt
```

**Notes**

* You can merge wordlist into one if needed (`cat wordlist1 wordlist2 wordlist3 > wordlist4`)
* If it takes a lot of time, you may try another algorithm, or maybe reversing the list
</div></div>

<hr class="sr">

## Base64

<div class="row row-cols-md-2"><div>

Base64 is only an encoding function. This isn't doing an encryption, or something cool like that, so it's not used for confidentiality. It could be used to write (encode) an image/... as a string.

> Most base64 strings are ending with "=", or "==".
</div><div>

```bash
$ echo "toto" | base64
dG90bwo=
$ echo "dG90bw=" | base64 -d
toto
```
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