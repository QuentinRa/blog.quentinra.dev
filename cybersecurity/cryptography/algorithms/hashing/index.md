# Hashing algorithms

[![encryptioncrypto101](../../../_badges/thm/encryptioncrypto101.svg)](https://tryhackme.com/room/encryptioncrypto101)
[![hashingcrypto101](../../../_badges/thmp/hashingcrypto101.svg)](https://tryhackme.com/room/hashingcrypto101)
[![hash_cracking](../../../_badges/poat/hash_cracking.svg)](https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/Methodology%20and%20Resources/Hash%20Cracking.md)

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

#### Manually Find The Type Of Hash

Some tools may suggest an incorrect format or not support the format you are looking for. You can still try to do it manually.

Some hashes are starting with well-known formats: `$id$salt$hash` or `hash:salt`. Some known values for `id` are: `1` <small>(crypt, cisco, old Linux)</small>, `2`/`2a`/`2b`/`2x`/`2y` <small>(bcrypt, web)</small>, `5` <small>(sha256crypt)</small>, `6` <small>(sha512crypt, modern Linux)</small>.

Apache uses `$apr1$hash` while WordPress uses `$P$hash`.

Some hashes can be identified by their length.

👉 You can find a lot of examples [on hashcat website](https://hashcat.net/wiki/doku.php?id=example_hashes).

<br>

#### Find The Type Of Hash Online

You could use [hashes.com](https://hashes.com/en/tools/hash_identifier) or [md5hashing.net](https://md5hashing.net/hash_type_checker).
</div><div>

#### Find The Type Of Hash With A Tool

* [Name-that-hash](https://github.com/HashPals/Name-That-Hash)/nth <small>(1.4k ⭐)</small>. [Online version here](https://nth.skerritt.blog/). Gives the John (JtR) and the hashcat (hc) format for each.

```ps
# sudo apt install name-that-hash
$ nth -t "some hash here"
$ nth -f myhash
```

* [haiti](https://github.com/noraj/haiti/) <small>(0.6k ⭐)</small>. Similar to Name-that-hash, different results.

```ps
# sudo gem install haiti-hash
$ haiti "some hash here"
```

* [hashID](https://github.com/psypanda/hashID) <small>(1.3k ⭐, 2015 🪦)</small>

```ps
$ cat myhash | hashid
```

* [hash-identifier](https://github.com/blackploit/hash-identifier) <small>(0.4k⭐, 2011 🪦)</small>

```shell!
$ cat myhash | hash-identifier
```
</div></div>

<hr class="sep-both">

## Hash cracking

[![crackthehash](../../../_badges/thm-p/crackthehash.svg)](https://tryhackme.com/room/crackthehash)
[![c4ptur3th3fl4g](../../../_badges/thm-p/c4ptur3th3fl4g.svg)](https://tryhackme.com/room/c4ptur3th3fl4g)
[![corridor](../../../_badges/thm-p/corridor.svg)](https://tryhackme.com/room/corridor)
[![agentsudoctf](../../../_badges/thm-p/agentsudoctf.svg)](https://tryhackme.com/room/agentsudoctf)
[![basicpentestingjt](../../../_badges/thm-p/basicpentestingjt.svg)](https://tryhackme.com/room/basicpentestingjt)
[![netsecchallenge](../../../_badges/thmp-p/netsecchallenge.svg)](https://tryhackme.com/room/netsecchallenge)
[![mustacchio](../../../_badges/thm-p/mustacchio.svg)](https://tryhackme.com/room/mustacchio)
[![chillhack](../../../_badges/thm-p/chillhack.svg)](https://tryhackme.com/room/chillhack)
[![cowboyhacker](../../../_badges/thm-p/cowboyhacker.svg)](https://tryhackme.com/room/cowboyhacker)
[![cyborgt8](../../../_badges/thm-p/cyborgt8.svg)](https://tryhackme.com/room/cyborgt8)
[![devvortex](../../../_badges/htb-p/devvortex.svg)](https://app.hackthebox.com/machines/Devvortex)
[![cozyhosting](../../../_badges/htb-p/cozyhosting.svg)](https://app.hackthebox.com/machines/CozyHosting)
[![file_pkzip](../../../_badges/rootme/cryptanalysis/file_pkzip.svg)](https://www.root-me.org/en/Challenges/Cryptanalysis/File-PKZIP)
[![hash_dcc](../../../_badges/rootme/cryptanalysis/hash_dcc.svg)](https://www.root-me.org/en/Challenges/Cryptanalysis/Hash-DCC)
[![hash_dcc2](../../../_badges/rootme/cryptanalysis/hash_dcc2.svg)](https://www.root-me.org/en/Challenges/Cryptanalysis/Hash-DCC2)
[![hash_lm](../../../_badges/rootme/cryptanalysis/hash_lm.svg)](https://www.root-me.org/en/Challenges/Cryptanalysis/Hash-LM)
[![hash_md5](../../../_badges/rootme/cryptanalysis/hash_md5.svg)](https://www.root-me.org/en/Challenges/Cryptanalysis/Hash-Message-Digest-5)
[![hash_nt](../../../_badges/rootme/cryptanalysis/hash_nt.svg)](https://www.root-me.org/en/Challenges/Cryptanalysis/Hash-NT)

<div class="row row-cols-lg-2"><div>

Hash cracking usually involves a dictionary with a list of potential passwords a.k.a. [wordlist](/cybersecurity/red-team/_knowledge/topics/wordlists.md) <small>(Rainbow tables may be used for older systems)</small>.

* ➡️ [hashcat](/cybersecurity/cryptography/algorithms/hashing/cracking/hashcat.md) (hc)

* ➡️ [John the Ripper](/cybersecurity/cryptography/algorithms/hashing/cracking/john.md) (JtR)

⚠️ Hash cracking tools may be able to use your GPU to compute results faster. On a virtual machine, they may be less efficient, as the VM itself takes a lot of resources. Consider using your host.
</div><div>

* ➡️ Online tools

For instance, [crackstation](https://crackstation.net/) <small>(you can download their wordlist!)</small>, [MD5Hashing](https://md5hashing.net/), [decrypt.tools](https://decrypt.tools/), [hashkiller.io](https://hashkiller.io/listmanager), or [hashes.com](https://hashes.com/en/decrypt/hash).


👉 CTFs usually use the wordlist `/usr/share/wordlists/rockyou.txt`.
</div></div>

<hr class="sep-both">

## Special cracking cases

<div class="row row-cols-lg-2"><div>

Some special cases of using john/hashcat along other tools.

#### Linux shadow hash cracking

[![password_attacks](../../../_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)
[![linprivesc](../../../_badges/thm-p/linprivesc.svg)](https://tryhackme.com/room/linprivesc#task-12)

To crack the whole shadow file, you may use `unshadow`:

```shell!
$ # hash format is $id$salt$hashed
$ unshadow /path/to/passwd /path/to/shadow > hashes
$ john hashes --format=sha512crypt --wordlist=wordlist
$ hashcat -m 1800 -a 0 hashes wordlist
```

<br>

#### Windows password hash cracking

[![password_attacks](../../../_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)
[![active_directory_enumeration_attacks](../../../_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)
[![hash_dcc](../../../_badges/rootme/cryptanalysis/hash_dcc.svg)](https://www.root-me.org/en/Challenges/Cryptanalysis/Hash-DCC)
[![hash_dcc2](../../../_badges/rootme/cryptanalysis/hash_dcc2.svg)](https://www.root-me.org/en/Challenges/Cryptanalysis/Hash-DCC2)
[![hash_lm](../../../_badges/rootme/cryptanalysis/hash_lm.svg)](https://www.root-me.org/en/Challenges/Cryptanalysis/Hash-LM)
[![hash_nt](../../../_badges/rootme/cryptanalysis/hash_nt.svg)](https://www.root-me.org/en/Challenges/Cryptanalysis/Hash-NT)

Modern Windows are using the hash format "NT", also referred to as "NTLM", because "LM" was the previous hash format.

```shell!
$ john myhash --format=nt --wordlist=wordlist
$ john myhash --format=netntlmv2 --wordlist=wordlist
$ hashcat -a 0 -m 1000 myhash # NTLM
$ hashcat -a 0 -m 3000 myhash # LM
$ hashcat -a 0 -m 5600 myhash # NetNTLMv2
```

There are also Domain Cached Credentials.

```ps
$ hashcat -a 0 -m 1100 myhash wordlist # password:username
$ hashcat -a 0 -m 2100 myhash wordlist # $DCC2$salt#username#hash
```

<br>

#### Windows DPAPI Masterkey file

[![chrome](../../../_badges/thm-p/chrome.svg)](https://tryhackme.com/room/chrome)

To get the user password from the [DPAPI](/operating-systems/windows/security/index.md#dump-credentials-protected-by-the-dpapi) Master key file, assuming the SID is `S-A-B-C-D-E-F-G` and the filename is `H-I-J-K-L`:

```shell!
$ /usr/share/john/DPAPImk2john.py --masterkey H-I-J-K-L --sid S-A-B-C-D-E-F-G --context local > myhash
$ john myhash --wordlist=wordlist
```

<br>

#### GPG passphrase cracking

[![networksecurityprotocols](../../../_badges/thmp/networksecurityprotocols.svg)](https://tryhackme.com/room/networksecurityprotocols)
[![linuxstrengthtraining](../../../_badges/thm/linuxstrengthtraining.svg)](https://tryhackme.com/room/linuxstrengthtraining)
[![encryptioncrypto101](../../../_badges/thm/encryptioncrypto101.svg)](https://tryhackme.com/room/encryptioncrypto101)
[![tomghost](../../../_badges/thm-p/tomghost.svg)](https://tryhackme.com/room/tomghost)

To crack the passphrase of [GPG encrypted files](/cybersecurity/cryptography/commands/gpg.md), you must convert the file to a crackable file for john:

```shell!
$ gpg2john file.pgp > myhash
$ john --format=gpg myhash --wordlist=wordlist 
```

<br>

#### SSH private key - passphrase cracking

[![password_attacks](../../../_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)
[![encryptioncrypto101](../../../_badges/thm/encryptioncrypto101.svg)](https://tryhackme.com/room/encryptioncrypto101)
[![basicpentestingjt](../../../_badges/thm-p/basicpentestingjt.svg)](https://tryhackme.com/room/basicpentestingjt)
[![mustacchio](../../../_badges/thm-p/mustacchio.svg)](https://tryhackme.com/room/mustacchio)
[![gamingserver](../../../_badges/thm-p/gamingserver.svg)](https://tryhackme.com/room/gamingserver)

SSH may have been configured to use a passphrase-protected [ssh keys](/operating-systems/networking/protocols/ssh.md). You must convert the file to a crackable file for john:

```shell!
$ ssh2john key > myhash
$ john --format=ssh myhash --wordlist=wordlist
```

<br>

#### Documents - password cracking

[![password_attacks](../../../_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)

You can crack [Office](https://en.wikipedia.org/wiki/Microsoft_Office) documents and [PDF](https://en.wikipedia.org/wiki/PDF) documents using:

```shell!
$ office2john xxx.docx > myhash
$ john myhash --wordlist=wordlist
$ john myhash --show
```

```shell!
$ pdf2john xxx.pdf > myhash
$ john myhash --wordlist=wordlist
```
</div><div>

#### RAR password cracking

You must convert the RAR file to a crackable file for john:

```shell!
$ rar2john hello.rar > myhash
$ john myhash --wordlist=wordlist
$ unrar x hello.rar # enter password
```

#### 7ZIP password cracking

[![crackingpasswordswithhashcat](../../../_badges/htb/crackingpasswordswithhashcat.svg)](https://academy.hackthebox.com/course/preview/cracking-passwords-with-hashcat)

You must convert the RAR file to a crackable file for john/hashcat:

```shell!
$ 7z2john test.7z > myhash
$ hashcat -m 11600 [...]
```

#### ZIP password cracking

[![password_attacks](../../../_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)
[![crackingpasswordswithhashcat](../../../_badges/htb/crackingpasswordswithhashcat.svg)](https://academy.hackthebox.com/course/preview/cracking-passwords-with-hashcat)
[![agentsudoctf](../../../_badges/thm-p/agentsudoctf.svg)](https://tryhackme.com/room/agentsudoctf)
[![chillhack](../../../_badges/thm-p/chillhack.svg)](https://tryhackme.com/room/chillhack)
[![file_pkzip](../../../_badges/rootme/cryptanalysis/file_pkzip.svg)](https://www.root-me.org/en/Challenges/Cryptanalysis/File-PKZIP)

You must convert the ZIP file to a crackable file for john:

```shell!
$ zip2john hello.zip > myhash
$ john myhash --wordlist=wordlist
$ unzip hello.zip # enter password
```

➡️ There is also [fcrackzip](https://github.com/hyc/fcrackzip) <small>(0.4k ⭐)</small>

👉 The same tool can be used with `hashcat`, but ensure you only keep the hash. See the references, modes `17200-17230`.

#### Wireless password cracking

[![crackingpasswordswithhashcat](../../../_badges/htb/crackingpasswordswithhashcat.svg)](https://academy.hackthebox.com/course/preview/cracking-passwords-with-hashcat)
[![wifihacking101](../../../../cybersecurity/_badges/thm-p/wifihacking101.svg)](https://tryhackme.com/room/wifihacking101)

For [Wi-Fi](/operating-systems/networking/others/technologies/wi-fi.md) password cracking, use [hcxtools](https://github.com/ZerBea/hcxtools) to create a crackable file: 

```shell!
$ sudo apt-get install hcxtools
$ hcxpcapngtool xxx.cap -o hash
$ hcxpcapngtool xxx.hccapx -o hash
$ hashcat -m 22000 [...]
$ john --format=wpapsk [...]
$ hcxpcaptool -j hash xxx.cap        # alternative?
$ /usr/lib/hashcat-utils/cap2hccapx.bin in.cap out.hccapx
$ hccapx2john out.hccapx > hash      # only for john
```

#### OpenSSL Key Cracking (GZIP example)

[![password_attacks](../../../_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)

GZIP (GNU Zip) is a file compression and decompression utility. The result can then be encrypted using tools such as [openssl](/cybersecurity/cryptography/commands/openssl.md) or [gpg](/cybersecurity/cryptography/commands/gpg.md).

```shell!
$ gzip id_rsa # => id_rsa.gz
$ openssl enc -aes-256-cbc -salt -in id_rsa.gz -out xxx.gzip -k SomeKey
$ openssl enc -d -aes-256-cbc -in xxx.gzip -out id_rsa.gz -k SomeKey
$ gzip -d id_rsa.gz # If the key is correct, terminate with code 0
```

I am not aware of any tool to automate this when `openssl` was used.

#### Others converters

* `bitlocker2john`: bitlocker protected drive, refer to [Bitlocker](/operating-systems/windows/security/index.md#bitlocker-encrypted-drive) notes
* `keepass2john`: keepass files, refer to [KeePass](/cybersecurity/blue-team/tools/passwords/keepass.md#keepass-pentester-notes-) notes
</div></div>

<hr class="sep-both">

## Random Notes

<div class="row row-cols-lg-2"><div>

#### File Checksum

The same functions we use to generate hashes may also be used to generate a checksum for a file. Two identical files have the same checksum. MD5 is not reliable, but often used:

```ps
$ md5sum /etc/passwd
$ cat /etc/passwd | md5sum
$ Get-FileHash .\file.txt -Algorithm MD5
```
</div><div>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [Hash-Buster](https://github.com/s0md3v/Hash-Buster)
* [password_cracking_rules](https://github.com/NotSoSecure/password_cracking_rules) and [OneRuleToRuleThemStill](https://github.com/stealthsploit/OneRuleToRuleThemStill)
* Blowfish and BCrypt (rounds of Blowfish)
* Use a smaller targeted wordlist for bcrypt
* Argon2
* [penglab](https://github.com/mxrch/penglab)
</div><div>

[![easypeasyctf](../../../_badges/thm-p/easypeasyctf.svg)](https://tryhackme.com/room/easypeasyctf)

Russian government GOST Hash Function

* `john hash --format=gost --wordlist=wordlist.txt`
</div></div>