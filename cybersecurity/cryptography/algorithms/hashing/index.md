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
[![wordpresscve202129447](../../../_badges/thm-p/wordpresscve202129447.svg)](https://tryhackme.com/r/room/wordpresscve202129447)
[![bruteit](../../../_badges/thm-p/bruteit.svg)](https://tryhackme.com/r/room/bruteit)
[![chrome](../../../_badges/thm-p/chrome.svg)](https://tryhackme.com/room/chrome)
[![memoryforensics](../../../_badges/thm-p/memoryforensics.svg)](https://tryhackme.com/r/room/memoryforensics)
[![attacktivedirectory](../../../_badges/thm-p/attacktivedirectory.svg)](https://tryhackme.com/r/room/attacktivedirectory)
[![devvortex](../../../_badges/htb-p/devvortex.svg)](https://app.hackthebox.com/machines/Devvortex)
[![cozyhosting](../../../_badges/htb-p/cozyhosting.svg)](https://app.hackthebox.com/machines/CozyHosting)
[![file_pkzip](../../../_badges/rootme/cryptanalysis/file_pkzip.svg)](https://www.root-me.org/en/Challenges/Cryptanalysis/File-PKZIP)
[![hash_dcc](../../../_badges/rootme/cryptanalysis/hash_dcc.svg)](https://www.root-me.org/en/Challenges/Cryptanalysis/Hash-DCC)
[![hash_dcc2](../../../_badges/rootme/cryptanalysis/hash_dcc2.svg)](https://www.root-me.org/en/Challenges/Cryptanalysis/Hash-DCC2)
[![hash_lm](../../../_badges/rootme/cryptanalysis/hash_lm.svg)](https://www.root-me.org/en/Challenges/Cryptanalysis/Hash-LM)
[![hash_md5](../../../_badges/rootme/cryptanalysis/hash_md5.svg)](https://www.root-me.org/en/Challenges/Cryptanalysis/Hash-Message-Digest-5)
[![hash_nt](../../../_badges/rootme/cryptanalysis/hash_nt.svg)](https://www.root-me.org/en/Challenges/Cryptanalysis/Hash-NT)
[![sql_injection_file_reading](../../../_badges/rootme/web_server/sql_injection_file_reading.svg)](https://www.root-me.org/en/Challenges/Web-Server/SQL-injection-File-reading)

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
[![bruteit](../../../_badges/thm-p/bruteit.svg)](https://tryhackme.com/r/room/bruteit)

To crack the whole shadow file, you may use `unshadow`:

```shell!
$ # hash format is $id$salt$hashed
$ unshadow /path/to/passwd /path/to/shadow > hashes
$ john hashes --format=sha512crypt --wordlist=wordlist
$ hashcat -m 1800 -a 0 hashes wordlist
```

#### Windows password hash cracking

[![password_attacks](../../../_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)
[![active_directory_enumeration_attacks](../../../_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)
[![breachingad](../../../_badges/thm/breachingad.svg)](https://tryhackme.com/r/room/breachingad)
[![memoryforensics](../../../_badges/thm-p/memoryforensics.svg)](https://tryhackme.com/r/room/memoryforensics)
[![hash_dcc](../../../_badges/rootme/cryptanalysis/hash_dcc.svg)](https://www.root-me.org/en/Challenges/Cryptanalysis/Hash-DCC)
[![hash_dcc2](../../../_badges/rootme/cryptanalysis/hash_dcc2.svg)](https://www.root-me.org/en/Challenges/Cryptanalysis/Hash-DCC2)
[![hash_lm](../../../_badges/rootme/cryptanalysis/hash_lm.svg)](https://www.root-me.org/en/Challenges/Cryptanalysis/Hash-LM)
[![hash_nt](../../../_badges/rootme/cryptanalysis/hash_nt.svg)](https://www.root-me.org/en/Challenges/Cryptanalysis/Hash-NT)

Modern Windows are using the hash format "NT", also referred to as "NTLM", because it is used with the NTLM protocol.

* **LM**: previous format. Maximum of 14 characters. Each split into block of 7, uppercased, padded, encrypted using DES, and the two ciphertext are concatenated to form the hash. 
* **NT**: convert the plaintext to a UTF-16 string and hash it using MD4

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

➡️ See also: [NetNTLMtoSilverTicket](https://github.com/NotMedic/NetNTLMtoSilverTicket).

#### Windows DPAPI Masterkey file

[![chrome](../../../_badges/thm-p/chrome.svg)](https://tryhackme.com/room/chrome)

To get the user password from the [DPAPI](/operating-systems/windows/security/index.md#dump-credentials-protected-by-the-dpapi) Master key file, assuming the SID is `S-A-B-C-D-E-F-G` and the filename is `H-I-J-K-L`:

```shell!
$ /usr/share/john/DPAPImk2john.py --masterkey H-I-J-K-L --sid S-A-B-C-D-E-F-G --context local > myhash
$ john myhash --wordlist=wordlist
```

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

#### SSH private key - passphrase cracking

[![password_attacks](../../../_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)
[![encryptioncrypto101](../../../_badges/thm/encryptioncrypto101.svg)](https://tryhackme.com/room/encryptioncrypto101)
[![basicpentestingjt](../../../_badges/thm-p/basicpentestingjt.svg)](https://tryhackme.com/room/basicpentestingjt)
[![mustacchio](../../../_badges/thm-p/mustacchio.svg)](https://tryhackme.com/room/mustacchio)
[![gamingserver](../../../_badges/thm-p/gamingserver.svg)](https://tryhackme.com/room/gamingserver)
[![bruteit](../../../_badges/thm-p/bruteit.svg)](https://tryhackme.com/r/room/bruteit)

SSH may have been configured to use a passphrase-protected [ssh keys](/operating-systems/networking/protocols/ssh.md). You must convert the file to a crackable file for john:

```shell!
$ ssh2john key > myhash
$ john --format=ssh myhash --wordlist=wordlist
```

#### Kerberos tickets cracking

[![active_directory_enumeration_attacks](../../../_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)

If you have a kirbi file, you need to convert it to a hash:

```shell!
$ kirbi2john cn.kirbi > hash
```

Once you have a hash, you can crack it using:

```shell!
$ john --format="krb5tgs" rc4hash --wordlist=wordlist
$ hashcat -m 13100 rc4hash wordlist
$ hashcat -m 19700 aeshash wordlist
```

⚠️ If john doesn't find any hash, try `$krb5tgs$23$*cn*$<hash_here>`.

#### Kerberos Pre Auth cracking

[![attacktivedirectory](../../../_badges/thm-p/attacktivedirectory.svg)](https://tryhackme.com/r/room/attacktivedirectory)

You can crack Kerberos Pre Auth hashes using:

```shell!
$ john hash --wordlist=wordlist
$ hashcat -m 18200 hash wordlist
```
</div><div>

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
[![wifihacking101](../../../_badges/thm-p/wifihacking101.svg)](https://tryhackme.com/room/wifihacking101)

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
* For the APOP challenge and hash, refer to [APOP](/operating-systems/networking/protocols/pop3.md#apop)
* For Django hashes, refer to [Django](/programming-languages/web/others/frameworks/django/index.md)
</div></div>

<hr class="sep-both">

## SHA-1 For Signatures 🪦

<div class="row row-cols-lg-2"><div>

You should not use SHA-1 to verify the integrity of a message as it has vulnerabilities that can allow an attacker to forge messages.

The class `SHA1Helper` implements the internals of SHA-1.

<details class="details-n">
<summary>SHA1Helper Python Class</summary>

````python
class SHA1Helper:
    # SHA-1 Defaults
    K = [0x5A827999, 0x6ED9EBA1, 0x8F1BBCDC, 0xCA62C1D6]

    def left_rotate(self, n, b):
        return ((n << b) | (n >> (32 - b))) & 0xFFFFFFFF

    def sha1_process_chunk(self, chunk, h):
        import struct

        w = [0] * 80
        for i in range(16):
            w[i] = struct.unpack('>I', chunk[i*4:(i+1)*4])[0]
        for i in range(16, 80):
            w[i] = self.left_rotate(w[i-3] ^ w[i-8] ^ w[i-14] ^ w[i-16], 1)

        a, b, c, d, e = h

        for i in range(80):
            if 0 <= i < 20:
                f = (b & c) | (~b & d)
                k = self.K[0]
            elif 20 <= i < 40:
                f = b ^ c ^ d
                k = self.K[1]
            elif 40 <= i < 60:
                f = (b & c) | (b & d) | (c & d)
                k = self.K[2]
            else:
                f = b ^ c ^ d
                k = self.K[3]

            temp = (self.left_rotate(a, 5) + f + e + k + w[i]) & 0xFFFFFFFF
            e = d
            d = c
            c = self.left_rotate(b, 30)
            b = a
            a = temp

        # Add the compressed chunk to the current hash value
        h[0] = (h[0] + a) & 0xFFFFFFFF
        h[1] = (h[1] + b) & 0xFFFFFFFF
        h[2] = (h[2] + c) & 0xFFFFFFFF
        h[3] = (h[3] + d) & 0xFFFFFFFF
        h[4] = (h[4] + e) & 0xFFFFFFFF

        return h

    def pad_sha1(self, data):
        import struct

        original_byte_len = len(data)
        original_bit_len = original_byte_len * 8

        # Append the bit '1' to the end of the data
        data += b'\x80'

        # Append '0' bits until the length is congruent to 448 mod 512
        data += b'\x00' * ((56 - (original_byte_len + 1) % 64) % 64)

        # Append the original length as a 64-bit big-endian integer
        data += struct.pack('>Q', original_bit_len)

        return data

    def merge_processed_chunks(self, h):
        return ''.join(f'{x:08x}' for x in h)

    def extract_h_from_hash(self, sha1_hash):
        return [int("0x" + sha1_hash[i:i + 8], 16) for i in range(0, len(sha1_hash), 8)]

    def sha1(self, data):
        h = [0x67452301, 0xEFCDAB89, 0x98BADCFE, 0x10325476, 0xC3D2E1F0]
        data = self.pad_sha1(data)

        for i in range(0, len(data), 64):
            chunk = data[i:i + 64]
            h = self.sha1_process_chunk(chunk, h)

        return self.merge_processed_chunks(h)
````
</details>

We will demonstrate the attack in Python while reproducing the behavior of a PHP server when handling duplicate arguments.

```text!
?file=toto.txt&file=tata.txt ===> file == "tata.txt"
```

```py
class SecretFactory:
    """
    Assume this code is secret
    """
    flag = b'flag{this_is_a_dummy_flag}'
    sha1_helper = SHA1Helper()

    def msg(self):
        return b'file=toto.txt&action=DOWNLOAD'

    def signature(self):
        return self.sha1_helper.sha1(self.flag + self.msg())

    def can_access_file(self, message, signature):
        if signature == self.sha1_helper.sha1(self.flag + message):
            # In PHP, the last value is taken if multiple are present (e.g. two &file=...)
            import urllib.parse
            parsed_params = urllib.parse.parse_qs(message)
            params_as_in_php = {key: values[-1] for key, values in parsed_params.items()}
            if params_as_in_php[b'file'] == b'flag.txt':
                return "Well done, here is the flag: " + self.flag.decode()
            else:
                return "Sorry, only 'flag.txt' is available."
        return None
```
</div><div>

The principle is well explained in [this article](https://log.kv.io/post/2011/03/04/exploiting-sha-1-signed-messages) and [its demo](https://github.com/nicolasff/pysha1/blob/master/demo.py). The core idea is that SHA1 is processing the input by blocks of 512 bits <small>(64*8)</small>. The first hash is reused to hash the second block and so on.

Given the first hash, we can compute the second hash `new_signature` with an arbitrary `new_message`. This second hash is equals *(cf. the article)* to `sha1(flag + original_message + '\x80' + padding + flag_and_original_message_size + new_message)`.

As long as we can guess the padding length and accordingly the `flag_and_original_message_size` value, we will be able to craft a message that will result in `new_signature`.

```py
import struct

s, h = SecretFactory(), SHA1Helper()
known_message = s.msg()
known_signature = s.signature()
h0, h1, h2, h3, h4 = h.extract_h_from_hash(known_signature)

new_message = b"&file=flag.txt"
new_payload = h.pad_sha1(h.pad_sha1(known_message) + new_message)
h_chunks = h.sha1_process_chunk(new_payload[-64:], [h0, h1, h2, h3, h4])
new_signature = h.merge_processed_chunks(h_chunks)

for salt_length in range(1, 64-len(known_message)):
    # "Testing if the key is", i, "characters long."
    original_bit_len = struct.pack('>Q', (len(known_message) + salt_length) * 8)
    padding = 64 - len(known_message) - salt_length - len(original_bit_len) - len(b'\x80')
    test_message = known_message + b'\x80' + b'\x00' * padding + original_bit_len + new_message

    result = s.can_access_file(test_message, new_signature)
    if result is not None:
        print("[+] Found", test_message)
        print("[+] Response", result)
        break
```

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

#### CTF Notes

[![hash_sha_2](../../../_badges/rootme/cryptanalysis/hash_sha_2.svg)](https://www.root-me.org/en/Challenges/Forensic/Active-Directory-GPO)

* The SHA-2 results in a fixed size hash usually represented as hexadecimal. It's 64 chars for SHA-256.
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
* hash extension // [hash extender](https://github.com/iagox86/hash_extender)
</div><div>

[![easypeasyctf](../../../_badges/thm-p/easypeasyctf.svg)](https://tryhackme.com/room/easypeasyctf)

Russian government GOST Hash Function

* `john hash --format=gost --wordlist=wordlist.txt`
</div></div>