# Crack (insecure) passwords

[![encryptioncrypto101](../../../_badges/thm/encryptioncrypto101.svg)](https://tryhackme.com/room/encryptioncrypto101)
[![johntheripper0](../../../_badges/thmp/johntheripper0.svg)](https://tryhackme.com/room/johntheripper0)
[![hashingcrypto101](../../../_badges/thmp/hashingcrypto101.svg)](https://tryhackme.com/room/hashingcrypto101)
[![hash_cracking](../../../_badges/poat/hash_cracking.svg)](https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/Methodology%20and%20Resources/Hash%20Cracking.md)
[![crackthehash](../../../_badges/thm-p/crackthehash.svg)](https://tryhackme.com/room/crackthehash)

<div class="row row-cols-md-2"><div>

</div><div>

⚠️ Hash brute-forcing tools are (usually) using your CPU to compute results faster. On a VM, they may be less efficient, as the VM itself is taking a lot of resources.

> You can find the location of [password wordlists here](/_cybersecurity/exploitation/general/index.md#-wordlists-).<br>
> Reminder: CTFs are usually using `/usr/share/wordlists/rockyou.txt`.
</div></div>

<hr class="sep-both">

## Find which algorithm generated this hash

<div class="row row-cols-md-2"><div>

There are a few solutions to find which kind of hash algorithm was used to generate a hash. We consider in the following, that the hash is stored inside a file called "hash".

Historically, we used [hash-identifier](https://github.com/blackploit/hash-identifier) (0.3k⭐), but it's obsolete (2011).

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

[Name-that-hash](https://github.com/HashPals/Name-That-Hash) (1.1k ⭐, fork of hashID). There is an [online version](https://nth.skerritt.blog/). The program is giving you the format for john (JtR) and hashcat (hc)! 

```bash
# sudo apt install name-that-hash
$ nth -t "some_hash"
$ nth -f hash
```

[haiti](https://github.com/noraj/haiti/) (309 ⭐). Less famous than nth, but quite similar, as the program is also giving you the format for john (JtR) and hashcat (hc)!

```bash
# sudo gem install haiti-hash
$ haiti "some_hash"
```

* [hashes.com/hash_identifier](https://hashes.com/en/tools/hash_identifier) (website)
</div></div>

> You might have to do it manually too. Some well-known one are "\\$1\\$" <small>(crypt, cisco, old Linux)</small>, "\\$2\\$, \\$2a\\$, \\$2b\\$, \\$2x\\$, \\$2y\\$" <small>(bcrypt, web)</small>, or "$6" <small>(sha512crypt, modern Linux)</small>. You can find a lot of examples [on hashcat website](https://hashcat.net/wiki/doku.php?id=example_hashes).

<hr class="sep-both">

## Online password cracking

There are a lot of online websites that have big databases with tons of hashes matched with cracked passwords (rainbow tables). It's only helpful if the hash is recorded inside.

<div class="row row-cols-md-2"><div>

* [crackstation](https://crackstation.net/). Not many algorithms, but we can download their wordlist  🚀 (4Go / 15Go uncompressed).

* [MD5Hashing](https://md5hashing.net/). A ton of ads <small>(#team ublock)</small>. Quite a lot of algorithms. Can encrypt/decrypt.


</div><div>

* [decrypt.tools](https://decrypt.tools/). Very similar to MD5Hashing, but without ads. It's not very well known, so there aren't as many hashes as others.

* [hashkiller.io](https://hashkiller.io/listmanager) / [hashes.com](https://hashes.com/en/decrypt/hash) which can [generate](https://hashes.com/en/generate/hash) hashes too.
</div></div>

<hr class="sep-both">

## Generate Hash 🔑

<div class="row row-cols-md-2 mt-4"><div>

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
</div><div>

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
</div></div>

<hr class="sep-both">

## hashcat

<div class="row row-cols-md-2"><div>

[hashcat](https://github.com/hashcat/hashcat) (15.9k ⭐) is with john the ripper, a well-known, and popular tool to crack passwords. For convenience’s sake, we store the hash in a file `hash`.

```bash
# use quotes, so that $/... aren't interpreted
$ echo 'some_hash' > hash
```

Crack the password

```bash
$ hashcat -m code hash wordlist
$ hashcat -m code hash wordlist -o hashes_cracked
# in my case, hashcat started then stopped, 
# I had to use this awful option
$ hashcat -m code hash wordlist --force
```

Once the password was cracked, you can see it

```bash
$ hashcat -m code hash wordlist --show
```

You can use rules <small>(see John section for explanations)</small>

```bash
$ hashcat -m 0 hash wordlist -r /usr/share/hashcat/rules/best64.rule
```

</div><div>

**Token length exception**: I had this error so many times that I got crazy about it. There are many causes for this error, unfortunately.

* Try to look for your hash format [on hashcat website](https://hashcat.net/wiki/doku.php?id=example_hashes). There is an example of the output that hashcat is expecting. For instance, sometimes, you need a file with `hash:salt`.

* I don't know why, but it worked for me when I didn't use a file: `hashcat -m 160 hash:key wordlist`.

* <i><span>More patches to come 😭</small></i>

<br>

Hashcat stores cracked hashes in `~/.hashcat/hashcat.potfile`.

* `-m code`: the code identifying this algorithm, provided by nth/haiti
  * MD5 <small>(0)</small> / MD4 <small>(900)</small> / SHA1 <small>(100)</small> / NTLM <small>(1000)</small>
  * SHA256 <small>(1400)</small> / bcrypt <small>(3200)</small> / sha512crypt <small>(1800)</small>
  * See the hashcat reference in the help
* `-a code`: the kind of attack <small>(0=Straight...)</small>
* `-o output`: file to store cracked passwords
* `--show`: show cracked passwords
* `--remove`: remove cracked hashes
* `--username`: ignore username, in files `user:password`
</div></div>

<hr class="sep-both">

## John the Ripper

<div class="row row-cols-md-2"><div>

[John the Ripper](https://github.com/openwall/john) (<small>Jumbo</small>, 6.9 ⭐), a.k.a. **john**, is like hashcat, a tool to crack hashes. For convenience’s sake, we store the hash in a file `hash`.

```bash
# use quotes, so that $/... aren't interpreted
$ echo 'some_hash' > hash
```

You can use the default wordlist, and let john guess the format. Unfortunately, it doesn't work often, so provide at least the format.

```bash
# basic form with no format, and the default wordlist
$ john hash
$ john 'some_hash' # if you didn't use a file
```

List formats <small>(you don't need it with nth/haiti, as they give you the format)</small>. Note that standard formats, such as MD5, are starting with "raw-".

```bash
$ john --list=formats | grep -i "md5"
```

</div><div>

Provide the format

```bash
$ john hash --format=raw-md5
$ john hash --format=raw-md4
$ john hash --format=raw-sha1
```

You can provide a wordlist

```bash
$ john hash --format=raw-md4 --wordlist=/usr/share/wordlists/rockyou.txt
```

<details class="details-e mt-4">
<summary>Single Crack mode</summary>

This is one of the three modes of John. It won't use a wordlist, but a username instead, as the user may have used their username with some slight modifications as their password. For the username "toto", john will use both

* **Word Mangling**: Toto tOTo toto1 toto!
* **GECOS**: other (GECOS) fields that are provided

You will have to change the format of your file

```text
username:password
```

While you may add some other fields that john will use, separated with `:`, such as in the Linux passwd file.

```bash
$ john hash --single --format=raw-md5
```
</details>

<details class="details-e">
<summary>Custom rules</summary>

You may try to exploit "password complexity predictability", for instance, the first character is usually an uppercase, and the last character a number. If a symbol was required, then it's most likely the last character, after the number.

You may edit `/etc/john/john.conf`, and add your rules. You may make a copy, and use this configuration instead of the default one. You can use the regex operation `[]` inside quotes. `c` means that the character is capitalized. `Az` means appending character, while `A0` means prepending.

```text
[List.Rules:RuleName]
cAz"[0-9] [!$%@]"
```

```bash
# use a custom rule
$ john --rule=RuleName
# use another config file
$ john --config=FILE
```

</details>
</div></div>

<hr class="sep-both">

## Linux shadow hash cracking

[![linprivesc](../../../_badges/thm-p/linprivesc.svg)](https://tryhackme.com/room/linprivesc#task-12)

<div class="row row-cols-md-2"><div>

Modern Linux are using `sha512crypt`. Use name-that-hash, or any other tools to find the format if needed. The easy way is only passing the hash of the user you want

```bash
$ john hash --format=sha512crypt --wordlist=wordlist
```
</div><div>

But, there is a more complicated way. I think it's useful if using john "single" mode.

```bash
$ unshadow /path/to/stolen_passwd /path/to/stolen_shadow > hash
$ john hash --format=sha512crypt --wordlist=wordlist
```

Note that "unshadow" simply replaced the "x" in "passwd", with the password in "shadow", as you would find in some old Linux distros.
</div></div>

<hr class="sep-both">

## Windows password cracking

<div class="row row-cols-md-2"><div>

Modern Windows are using the hash format "NT", also referred to as "NTLM", because "LM" was the previous hash format.

```bash
$ john hash --format=nt --wordlist=wordlist
```
</div><div>
</div></div>

<hr class="sep-both">

## GPG passphrase cracking

<div class="row row-cols-md-2"><div>

The `gpg` tool can be used to encrypt files, using a passphrase, which is like a password. It can also be used to sign something. For instance, GitHub allows you to sign your commits using GPG keys.

To encrypt something, you could do this. It will generate a `file.gpg`

```bash
$ gpg --cipher-algo AES-256 --symmetric file
```

And, to decrypt <small>(no passphrase is asked if it is cached)</small>

```bash
$ gpg -d file.gpg
# generate back your file
```
</div><div>

You can **crack a gpg passphrase** using john too! But, you need to convert the gpg passphrase to a hash first.

```bash
$ sudo gpg2john file.pgp > hash
```

Then, use john as usual, with the format "gpg"

```bash
$ john --format=gpg hash --wordlist=wordlist 
```

> If by any means you got someone's private key that was used to encrypt this file <small>(a key may be used instead of a passphrase)</small>, then use `gpg --import xxx.key` to import it, and decrypt the file as usual.
</div></div>

<hr class="sep-both">

## SSH private key - passphrase cracking

[![basicpentestingjt](../../../_badges/thm-p/basicpentestingjt.svg)](https://tryhackme.com/room/basicpentestingjt)

<div class="row row-cols-md-2"><div>

Some users are using a key instead of a password while connecting to a server via SSH, because, as long as the key does not leak, it's more secure than sending credentials.

```bash
ssh login@ip -i key
```
</div><div>

The key is usually protected by a passphrase. You can use `ssh2john` to convert it to a file that `john` can try to break.

```bash
$ ssh2john key > hash
$ john --format=ssh hash --wordlist=wordlist
```
</div></div>

<hr class="sep-both">

## RAR password cracking

<div class="row row-cols-md-2"><div>

First convert the password to a file compatible with john.

```bash
$ rar2john hello.rar > hash
$ john hash --wordlist=wordlist
```
</div><div>

If you found the password, you can unrar your RAR with

```bash
$ unrar x hello.rar
# enter the password
```
</div></div>

<hr class="sep-both">

## ZIP password cracking

[![agentsudoctf](../../../_badges/thm-p/agentsudoctf.svg)](https://tryhackme.com/room/agentsudoctf)

<div class="row row-cols-md-2"><div>

First convert the password to a file compatible with john.

```bash
$ zip2john hello.zip > hash
$ john hash --wordlist=wordlist
```
</div><div>

If you found the password, you can unzip your ZIP with

```bash
$ unzip hello.zip
# enter the password
```

> There is also [fcrackzip](https://github.com/hyc/fcrackzip) (0.3k ⭐)
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* Hashcat

<details class="details-e">
<summary>Brute force</summary>

* Your device driver installation is probably broken. See also: https://hashcat.net/faq/wrongdriver

* https://hashcat.net/wiki/doku.php?id=mask_attack

```text
.\hashcat.exe -m 900 XXX -a 3 -o cracked.txt
.\hashcat.exe -m 900 XXX -a 3 -o cracked.txt --self-test-disable
hashcat (v6.2.6) starting

ATTENTION! Pure (unoptimized) backend kernels selected.
Pure kernels can crack longer passwords, but drastically reduce performance.
If you want to switch to optimized kernels, append -O to your commandline.
See the above message to find out about the exact limits.

Session..........: hashcat
Status...........: Exhausted
Hash.Mode........: 900 (MD4)
Hash.Target......: XXX
Kernel.Feature...: Pure Kernel
Guess.Mask.......: ?1 [1]
Guess.Charset....: -1 ?l?d?u, -2 ?l?d, -3 ?l?d*!$@_, -4 Undefined

Guess.Mask.......: ?1?2 [2]
Guess.Charset....: -1 ?l?d?u, -2 ?l?d, -3 ?l?d*!$@_, -4 Undefined

Guess.Mask.......: ?1?2?2 [3]
Guess.Charset....: -1 ?l?d?u, -2 ?l?d, -3 ?l?d*!$@_, -4 Undefined

Guess.Mask.......: ?1?2?2?2 [4]
Guess.Charset....: -1 ?l?d?u, -2 ?l?d, -3 ?l?d*!$@_, -4 Undefined

Guess.Mask.......: ?1?2?2?2?2 [5]
Guess.Charset....: -1 ?l?d?u, -2 ?l?d, -3 ?l?d*!$@_, -4 Undefined

Guess.Mask.......: ?1?2?2?2?2?2 [6]
Guess.Charset....: -1 ?l?d?u, -2 ?l?d, -3 ?l?d*!$@_, -4 Undefined

Guess.Mask.......: ?1?2?2?2?2?2?2 [7]
Guess.Charset....: -1 ?l?d?u, -2 ?l?d, -3 ?l?d*!$@_, -4 Undefined

Guess.Mask.......: ?1?2?2?2?2?2?2?3 [8]
Guess.Charset....: -1 ?l?d?u, -2 ?l?d, -3 ?l?d*!$@_, -4 Undefined
```
</details>
</div><div>


</div></div>