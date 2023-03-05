# Crack (insecure) passwords

⚠️ Hash brute-forcing tools are (usually) using your CPU to compute results faster. On a VM, they may be less efficient, as the VM itself is taking a lot of resources.

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


</div><div>

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