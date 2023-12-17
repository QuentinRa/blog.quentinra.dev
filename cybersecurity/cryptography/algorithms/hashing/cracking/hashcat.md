# hashcat

[![crackingpasswordswithhashcat](../../../../_badges/htb/crackingpasswordswithhashcat.svg)](https://academy.hackthebox.com/course/preview/cracking-passwords-with-hashcat)

<div class="row row-cols-lg-2"><div>

[hashcat](https://github.com/hashcat/hashcat) (18.9k ⭐) is a well-known, and popular tool to crack passwords. For convenience’s sake, we store the hash in a file `hash`.

```ps
# use quotes, so that $/... aren't interpreted
$ echo 'some hash here' > myhash
```

Crack a password/hash:

```ps
$ hashcat -m hcode myhash wordlist
$ hashcat -m hcode myhash /usr/share/wordlists/rockyou.txt
# you can provide a list of hashes too
$ hashcat -m hcode myhashes wordlist -o hashes_cracked
```

Once a hash was cracked, hashcat will store it in its data folder, which may be one of `~/.hashcat/hashcat.potfile` or `~/.local/share/hashcat/hashcat.potfile`. You can also use `--show`:

```ps
$ hashcat -m hcode --show myhash            # unique hashes
$ hashcat -m hcode --show --username myhash # all
```
</div><div>

Common options:

* `-m hcode`: the hashing algorithm code | provided by nth/haiti/...
    * MD5 <small>(0)</small> / MD4 <small>(900)</small> / SHA1 <small>(100)</small> / NTLM <small>(1000)</small>
    * SHA256 <small>(1400)</small> / bcrypt <small>(3200)</small> / sha512crypt <small>(1800)</small>
    * See the hashcat help or [hashcat reference](https://hashcat.net/wiki/doku.php?id=example_hashes)
* `-a acode`: the kind of attack <small>(Default is 0=Straight)</small>
* `-o output`: file to store cracked passwords
* `--show`: show cracked passwords
* `--remove`: remove cracked hashes
* `--username`: can be used to ignore username in hash `user:password`
* `-r /path/to/xxx.rule`: load a rule file

You can run a benchmark test and add optimization parameters:

```
$ hashcat -m hcode -b
$ hashcat -m hcode [...] -O   # kernel optimization
$ hashcat -m hcode [...] -w 3 # 1="half power", 3="full power"
```

⚠️ Test with and then without kernel optimization.

⚠️ Never use `--force`, try to troubleshoot the root cause.
</div></div>

<hr class="sep-both">

## Hashcat Attack Modes

<div class="row row-cols-lg-2"><div>

#### Combination Attack Mode

The combination attack mode takes a variable number of wordlists and generate a wordlist that is a combination of them. The final wordlist is used to crack the hashes.

```ps
$ hashcat -a 1 -m hcode myhash <list of wordlists>
```

#### Brute force Attack Mode

Generate or use a mask and try every combination until either the password is found or the character set is exhausted.

```ps
$ hashcat -a 3 <mask>
```
</div><div>

#### Hybrid Attack Modes

You can append (`6`) a mask to a wordlist:

```ps
$ hashcat -a 6 wordlist <mask>
```

You can prepend (`7`) a mask to a wordlist:

```ps
$ hashcat -a 7 <mask> wordlist
```
</div></div>

<hr class="sep-both">

## Hashcat Masks

<div class="row row-cols-lg-2"><div>

A mask is similar to a pattern/regex but with hashcat specific rules. Everything is explained in the [documentation](https://hashcat.net/wiki/doku.php?id=mask_attack).

* `?l`: lower characters (a-z)
* `?u`: upper characters (A-Z)
* `?d`: number (0-9)
* `?h`: same as `?l` + `?d`
* `?H`: same as `?u` + `?d`
* ...

We can use placeholders: `?1`, `?2`, `?3`, and `?4` to specify a custom charset. Other characters are not replaced.
</div><div>

Examples with/without a custom charset:

```ps
$ hashcat [...] "?u?l?l?l"         # Matches: Toto
$ hashcat [...] -1 ?u?l "?1?l?l?l" # Matches: Toto or toto
```

See also: `--increment`, `--increment-max`.
</div></div>

<hr class="sep-both">

## Hashcat Rules

<div class="row row-cols-lg-2"><div>

Hashcat rules allow us to define complex password rules/patterns. The complete list is available [here](https://hashcat.net/wiki/doku.php?id=rule_based_attack#implemented_compatible_functions) but in short, we can:

* Append/Prepend letters
* Delete letters/Truncate words
* Duplicate letters
* Reverse words
* ...

Existing rules are stored in: `/usr/share/hashcat/rules/`.
</div><div>
</div></div>

<hr class="sep-both">

## Wordlist generation

[![passwordattacks](../../../../_badges/thmp/passwordattacks.svg)](https://tryhackme.com/room/passwordattacks)

<div class="row row-cols-lg-2"><div>

You can use hashcat to generate a wordlist using `--stdout`. The kind of generated wordlist is determined by the attack mode selected.

```ps
$ hashcat -a 1 --stdout wordlist1 wordlist2
<combination wordlist>
```

You can do the same with masks:

```ps
$ hashcat -a 3 <mask> --stdout
<brute force wordlist from the mask>
```
</div><div>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [nsa-rules](https://github.com/NSAKEY/nsa-rules) (0.5k ⭐, 2016 🪦)
* [Hob0Rules](https://github.com/praetorian-inc/Hob0Rules) (1.3k ⭐, 2016 🪦)
* [Hob0Rules](https://github.com/praetorian-inc/Hob0Rules) (0.1k ⭐, 2022 ☠️)
</div><div>
</div></div>