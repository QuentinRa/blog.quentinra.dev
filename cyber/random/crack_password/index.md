# Crack (weak) passwords

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
</div></div>