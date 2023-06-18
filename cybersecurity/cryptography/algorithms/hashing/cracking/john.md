# John the Ripper

[![johntheripper0](../../../../_badges/thmp/johntheripper0.svg)](https://tryhackme.com/room/johntheripper0)
[![linuxstrengthtraining](../../../../_badges/thm/linuxstrengthtraining.svg)](https://tryhackme.com/room/linuxstrengthtraining)

<div class="row row-cols-md-2"><div>

[John the Ripper](https://github.com/openwall/john) (<small>Jumbo</small>, 7.4k ⭐), a.k.a. **john**, is like hashcat, a tool to crack hashes. For convenience's sake, we store the hash in `myhash`.

```ps
# use quotes, so that $/... aren't interpreted
$ echo 'some hash here' > myhash
```
</div><div>

List formats <small>(you don't need it with nth/haiti, as they give you the format)</small>. Note that standard formats, such as MD5, are starting with "raw-".

```shell!
$ john --list=formats | grep -i "md5"
```
</div></div>

<hr class="sep-both">

## Formats and wordlists

<div class="row row-cols-md-2 mt-3"><div>

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

<div class="row row-cols-md-2"><div>

The single crack mode is one of john the ripper modes. In this mode, we define rules 🔏 that are applied on the wordlist, to generate a new "enhanced" wordlist. 🔥 For instance, users tend to

* 🔤 capitalize the first letter
* 🔢 add a number at the end
* 🔣 add a symbol after the number <small>(if required)</small>

This is the default mode for john. It can be explicitely called with

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
; see the documentation
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

## Linux shadow hash cracking

[![linprivesc](../../../../_badges/thm-p/linprivesc.svg)](https://tryhackme.com/room/linprivesc#task-12)

<div class="row row-cols-md-2"><div>

Modern Linux distros are using `sha512crypt`. Use name-that-hash, or any other tools to find the format if needed. The easy way is only passing the hash of the user you want

```shell!
$ john myhash --format=sha512crypt --wordlist=wordlist
```
</div><div>

You can also use `unshadow`

```shell!
$ unshadow /path/to/passwd /path/to/shadow > myhash
$ john myhash --format=sha512crypt --wordlist=wordlist
```
</div></div>

<hr class="sep-both">

## Windows password cracking

<div class="row row-cols-md-2"><div>

Modern Windows are using the hash format "NT", also referred to as "NTLM", because "LM" was the previous hash format.

```shell!
$ john myhash --format=nt --wordlist=wordlist
$ john myhash --format=netntlmv2 --wordlist=wordlist
```

➡️ See also [LM, NTLM, and Net-NTLMv2](https://medium.com/@petergombos/lm-ntlm-net-ntlmv2-oh-my-a9b235c58ed4)
</div><div>
</div></div>

<hr class="sep-both">

## GPG passphrase cracking

[![networksecurityprotocols](../../../../_badges/thmp/networksecurityprotocols.svg)](https://tryhackme.com/room/networksecurityprotocols)
[![linuxstrengthtraining](../../../../_badges/thm/linuxstrengthtraining.svg)](https://tryhackme.com/room/linuxstrengthtraining)
[![encryptioncrypto101](../../../../_badges/thm/encryptioncrypto101.svg)](https://tryhackme.com/room/encryptioncrypto101)

<div class="row row-cols-md-2"><div>

The `gpg` tool can be used to encrypt files, using a passphrase, which is like a password. It can also be used to sign something. For instance, GitHub allows you to sign your commits using GPG keys.

To encrypt something, you could do this. It will generate a `file.gpg`

```shell!
$ gpg --cipher-algo AES-256 --symmetric file
```

And, to decrypt <small>(no passphrase is asked if it is cached)</small>

```shell!
$ gpg -d file.gpg
# generate back your file
```
</div><div>

You can **crack a gpg passphrase** using john too! But, you need to convert the gpg passphrase to a hash first.

```shell!
$ sudo gpg2john file.pgp > myhash
```

Then, use john as usual, with the format "gpg"

```shell!
$ john --format=gpg myhash --wordlist=wordlist 
```

> If by any means you got someone's private key that was used to encrypt this file <small>(a key may be used instead of a passphrase)</small>, then use `gpg --import xxx.key` to import it, and decrypt the file as usual.
</div></div>

<hr class="sep-both">

## SSH private key - passphrase cracking

[![encryptioncrypto101](../../../../_badges/thm/encryptioncrypto101.svg)](https://tryhackme.com/room/encryptioncrypto101)
[![basicpentestingjt](../../../../_badges/thm-p/basicpentestingjt.svg)](https://tryhackme.com/room/basicpentestingjt)

<div class="row row-cols-md-2"><div>

Some users are using a key instead of a password while connecting to a server via [SSH](/operating-systems/networking/protocols/ssh.md), because, as long as the key is not leaked, it's more secure than sending credentials.

```shell!
$ ssh login@ip -i /path/to/id_rsa
```
</div><div>

The key is usually protected by a passphrase. You can use `ssh2john` to convert it to a file that `john` can try to break.

```shell!
$ ssh2john key > myhash
$ john --format=ssh myhash --wordlist=wordlist
```
</div></div>

<hr class="sep-both">

## RAR password cracking

<div class="row row-cols-md-2"><div>

First convert the password to a file compatible with john.

```shell!
$ rar2john hello.rar > myhash
$ john myhash --wordlist=wordlist
```
</div><div>

If you found the password, you can unrar your RAR with

```shell!
$ unrar x hello.rar
# enter the password
```
</div></div>

<hr class="sep-both">

## ZIP password cracking

[![agentsudoctf](../../../../_badges/thm-p/agentsudoctf.svg)](https://tryhackme.com/room/agentsudoctf)

<div class="row row-cols-md-2"><div>

First convert the password to a file compatible with john.

```shell!
$ zip2john hello.zip > myhash
$ john myhash --wordlist=wordlist
```
</div><div>

If you found the password, you can unzip your ZIP with

```ps
$ unzip hello.zip
# enter the password
```

➡️ There is also [fcrackzip](https://github.com/hyc/fcrackzip) (0.4k ⭐)
</div></div>