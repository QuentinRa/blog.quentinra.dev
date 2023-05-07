# hashcat

<div class="row row-cols-md-2"><div>

[hashcat](https://github.com/hashcat/hashcat) (15.9k ⭐) is a well-known, and popular tool to crack passwords. For convenience’s sake, we store the hash in a file `hash`.

```ps
# use quotes, so that $/... aren't interpreted
$ echo 'some hash here' > myhash
```

Crack the password

```ps
$ hashcat -m code myhash wordlist
$ hashcat -m code myhash wordlist -o hashes_cracked
# in my case, hashcat started then stopped, 
# I had to use this awful option
$ hashcat -m code myhash wordlist --force
```

Once the password was cracked, you can see it

```ps
$ hashcat -m code myhash wordlist --show
```
</div><div>

**Token length exception**: I had this error so many times that I got crazy about it. There are many causes for this error, unfortunately.

* 🧐 Try to look for your hash format [on hashcat website](https://hashcat.net/wiki/doku.php?id=example_hashes). There is an example of the output that hashcat is expecting. For instance, sometimes, you need a file with `hash:salt`.

* 🪲 I don't know why, but it worked for me when I didn't use a file: `hashcat -m 160 hash:key wordlist`.

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

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

<details class="details-n">
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

You can use rules

```ps
$ hashcat -m 0 myhash wordlist -r /usr/share/hashcat/rules/best64.rule
```
</div></div>