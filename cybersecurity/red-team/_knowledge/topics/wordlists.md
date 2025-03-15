# Red-Team Wordlists ⛪

[![passwordattacks](../../../_badges/thmp/passwordattacks.svg)](https://tryhackme.com/room/passwordattacks)

<div class="row row-cols-lg-2"><div>

Wordlists are files with one item per line, usually, a word.

They are mainly used to automate tasks. For instance, to perform a password attack, we will most likely use a wordlist will a list of usernames to test, and a password wordlist with common passwords.

* 🏝️ Find common (+hidden) directories on a web server
* 🔑 Test common passwords
* 🥷 Find hidden form parameters, headers, etc.
* ...

CTFs are usually using the infamous `rockout.txt` for passwords  <small>(from the data breach of rockyou.com in 2009)</small>.
</div><div>

[SecLists](https://github.com/danielmiessler/SecLists) <small>(61.4k ⭐)</small> is the most popular place to find wordlists.

```shell!
$ sudo apt-get install seclists
/usr/share/seclists/Passwords/darkweb2017-top10000.txt
/usr/share/seclists/Usernames/xato-net-10-million-usernames.txt
...
```

On Kali, we can install the package [wordlists](https://github.com/drtychai/wordlists) <small>(0.2k ⭐)</small> to access the most common wordlists excluding SecLists wordlists.

```shell!
$ sudo apt-get install wordlists
$ wordlists  # extract rockyou.txt, press Y
/usr/share/wordlists/rockyou.txt
/usr/share/wordlists/dirb/others/best1050.txt
/usr/share/wordlists/dirb/others/best110.txt
...
```

Finally, `payloadsallthethings` contains some wordlists.
</div></div>

<hr class="sep-both">

## Custom Wordlists

[![passwordattacks](../../../_badges/thmp/passwordattacks.svg)](https://tryhackme.com/room/passwordattacks)
[![crackingpasswordswithhashcat](../../../_badges/htb/crackingpasswordswithhashcat.svg)](https://academy.hackthebox.com/course/preview/cracking-passwords-with-hashcat)
[![loginbruteforcing](../../../_badges/htb/loginbruteforcing.svg)](https://academy.hackthebox.com/course/preview/login-brute-forcing)
[![password_attacks](../../../_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)

<div class="row row-cols-lg-2"><div>

#### Simple wordlists

```shell!
$ seq 0 100 > 0_to_100.lst        # 0 1 2 3 4
$ seq 0 2 100 > even_0_to_100.lst # 0 2 4 etc.
$ echo {A..Z} | tr ' ' '\n' > AZ.lst
$ echo user{0..9} | tr ' ' '\n' > user_0_to_9.lst
$ echo {admin,adm,user} | tr ' ' '\n' > simple_list.lst
```

You can also use: [JohnTheReaper](/cybersecurity/cryptography/algorithms/hashing/cracking/john.md#wordlist-generation) or [hashcat](/cybersecurity/cryptography/algorithms/hashing/cracking/hashcat.md#wordlist-generation)!

<br>

#### CeWL wordlist generation

[![cyberweek2021](../../../_badges/thm/cyberweek2021.svg)](https://tryhackme.com/r/room/cyberweek2021)

Users may generate a password based on the environment they are in. [CeWL](https://github.com/digininja/CeWL) <small>(2.2k ⭐)</small> will scrap their website to generate a list of words.  

```ps
$ cewl -w output.lst -d depth -m word_size URL
$ cewl -w output.lst -d depth -m word_size -e URL
$ cewl -w output.lst -m5 --lowercase URL
```

<br>

#### crunch wordlist generation

crunch is a tool on debian to generate wordlists.

```shell!
$ crunch minlength maxlength charset -o crunch.txt # BIG
$ crunch [...] -t pattern
$ crunch [...] -d 1 # "aa" "aaa" etc. are not allowed
```

<br>

#### cook wordlist generation

[cook](https://github.com/glitchedgitz/cook) <small>(1.2k ⭐)</small> is a tool/engine to create wordlists, sort of like a recipe.

```shell!
$ cook [...]
```

<br>

#### Linkedin2Username

[linkedin2username](https://github.com/initstring/linkedin2username) <small>(1.4k ⭐)</small> uses **your** Linkedin account to explore the target Linkedin pages and generate a wordlist of usernames.
</div><div>

#### CUPP wordlist generation

[cupp](https://github.com/Mebus/cupp) <small>(4.7k ⭐, 2020 🪦)</small> is a python script that generates a wordlist based on the information you gathered about the target.

```shell!
$ sudo apt-get install cupp
$ cupp -i
```

Even if you gathered a lot of information, you may want to start with small wordlist first.

<br>

#### hashcat utilities

hashcat has a few utilities that it uses to generate wordlists:

* [maskprocessor](https://github.com/hashcat/maskprocessor): generate wordlists from a mask
* [kwprocessor](https://github.com/hashcat/kwprocessor): generate wordlists with keyboard walks
* [princeprocessor](https://github.com/hashcat/princeprocessor): generate wordlists using the PRINCE algorithm

<br>

#### Python

All-purpose knife.

```shell!
$ python -c "s=0; n=200; wordlist = ['a'*i for i in range(1+s, s+n+1)]; print('\n'.join(wordlist))"
a
aa
...
```

<br>

#### Random Tools

* [TTPassGen](https://github.com/tp7309/TTPassGen) <small>(0.2k ⭐)</small>: generate password wordlists
* [pnwgen](https://github.com/toxydose/pnwgen) <small>(0.1k ⭐, 2021 🪦)</small>: generate phone number wordlists
* [lyricpass](https://github.com/initstring/lyricpass) <small>(0.1k ⭐, 2019 🪦)</small>: generate song lyrics wordlists
* [mentalist](https://github.com/sc0tfree/mentalist) <small>(1.8k ⭐, 2017 🪦)</small>: generate password wordlists
</div></div>

<hr class="sep-both">

## Tune wordlists

[![broken_authentication](../../../_badges/htb/broken_authentication.svg)](https://academy.hackthebox.com/course/preview/broken-authentication)
[![passwordattacks](../../../_badges/thmp/passwordattacks.svg)](https://tryhackme.com/room/passwordattacks)

<div class="row row-cols-lg-2"><div>

If the minimum length for a password is 6 characters, we may want to remove shorter passwords. This is something we can easily do using [regexes](/tools-and-frameworks/knowledge/regex/index.md). For instance, to only keep four letters passwords:

```shell!
$ egrep '^.{4}$' /usr/share/wordlists/rockyou.txt > /tmp/4rock.lst
```

We can also merge, remove duplicates, or sort words:

```shell!
$ cat wordlist1 wordlist2 wordlist3 > wordlist123
$ sort wordlist123 > swordlist    # sort
$ uniq -u swordlist > uwordlist   # duplicates
```

⚠️ To remove duplicates, you must sort the list first.
</div><div>

Chain greps when you need "at least one" of something.

```shell!
$ grep "^.{20}$" wordlist | grep "[A-Z]" # 20 chars, at least one upper
```

It's worth mentioning again that tools such as [JohnTheReaper](/cybersecurity/cryptography/algorithms/hashing/cracking/john.md#wordlist-generation) or [hashcat](/cybersecurity/cryptography/algorithms/hashing/cracking/hashcat.md#wordlist-generation) have the capabilities to perform some  operations.
</div></div>

<hr class="sep-both">

## Enumeration Wordlists Index

<div class="row row-cols-lg-2"><div>

#### Forced Browsing

Sorted by recommended order of usage.

```text!
/usr/share/seclists/Discovery/Web-Content/common.txt
/usr/share/seclists/Discovery/Web-Content/quickhits.txt
/usr/share/seclists/Discovery/Web-Content/directory-list-2.3-small.txt
/usr/share/seclists/Discovery/Web-Content/directory-list-2.3-medium.txt
/usr/share/seclists/Discovery/Web-Content/raft-small-directories.txt
/usr/share/seclists/Discovery/Web-Content/raft-medium-directories.txt
/usr/share/seclists/Discovery/Web-Content/raft-medium-directories.txt
/usr/share/seclists/Discovery/Web-Content/raft-large-files.txt
```

➡️ See also: [Extension Wordlists](#extensions).

<br>

#### Subdomains

Sorted by recommended order of usage.

```text!
/usr/share/seclists/Discovery/DNS/fierce-hostlist.txt
/usr/share/seclists/Discovery/DNS/subdomains-top1million-5000.txt
/usr/share/seclists/Discovery/DNS/subdomains-top1million-20000.txt
/usr/share/seclists/Discovery/DNS/namelist.txt
/usr/share/seclists/Discovery/DNS/subdomains-top1million-110000.txt
/usr/share/seclists/Discovery/DNS/dns-Jhaddix.txt
/usr/share/wordlists/amass/*
```
</div><div>

#### Accounts

[![password_attacks](../../../_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)
[![broken_authentication](../../../_badges/htb/broken_authentication.svg)](https://academy.hackthebox.com/course/preview/broken-authentication)

**Usernames**

```text!
admin, administrator, wpadmin, root, adm
/usr/share/seclists/Usernames/top-usernames-shortlist.txt
/usr/share/seclists/Usernames/Names/names.txt
/usr/share/seclists/Usernames/top-usernames-shortlist.txt
```

📚 Common tools are: [username-anarchy](https://github.com/urbanadventurer/username-anarchy) <small>(1.0k ⭐, 2016 🪦)</small> and [username_generator](https://github.com/shroudri/username_generator) <small>(0.1k ⭐)</small>. The wordlists in the [statistically-likely-usernames](https://github.com/insidetrust/statistically-likely-usernames) <small>(1.0k ⭐)</small> project are also somewhat popular.

**Passwords**

```text!
/usr/share/seclists/Passwords/Common-Credentials/best110.txt
/usr/share/wordlists/fasttrack.txt
/usr/share/seclists/Passwords/Leaked-Databases/rockyou-50.txt
/usr/share/wordlists/rockyou.txt
```

📚 You may also use the cracked passwords to create a wordlist. You might want to check [NLP](https://github.com/philipperemy/tensorflow-1.4-billion-password-analysis)/[breach-parse](https://github.com/hmaverickadams/breach-parse).

**Default credentials** <small>(=Credential Stuffing)</small>

```text!
/usr/share/seclists/Passwords/Default-Credentials/ftp-betterdefaultpasslist.txt
/usr/share/metasploit-framework/data/wordlists/http_default_pass.txt
/usr/share/seclists/Passwords/Default-Credentials/*passlist.txt
/usr/share/seclists/Passwords/Default-Credentials/default-passwords.csv
# see also: short username/password wordlists
```

📚 You might want to check out [cirt](https://cirt.net/passwords), [default-password](https://default-password.info/), [data recovery](https://datarecovery.com/rd/default-passwords/), [cirt](https://www.cirt.net/passwords), and [scadapass](https://github.com/scadastrangelove/SCADAPASS/blob/master/scadapass.csv). See also: [Default Credentials Cheat Sheet](https://github.com/ihebski/DefaultCreds-cheat-sheet) <small>(6.0k ⭐)</small>.
</div></div>

<hr class="sep-both">

## Exploitation Wordlists Index

<div class="row row-cols-lg-2"><div>

#### File Upload

MIME type/Content Type

```text!
/usr/share/seclists/Miscellaneous/web/content-type.txt
```

➡️ See also: [Extension Wordlists](#extensions).
</div><div>
</div></div>

<hr class="sep-both">

## Minor Wordlists Index

<div class="row row-cols-lg-2"><div>

#### Extensions

Mostly bad extensions <small>(no `.jpeg` or normal extensions)</small>

```text!
/usr/share/wordlists/dirb/extensions_common.txt
/usr/share/seclists/Discovery/Web-Content/web-extensions.txt
/usr/share/seclists/Discovery/Web-Content/web-extensions-big.txt
```

#### Characters

Random wordlists about characters.

```text!
/usr/share/seclists/Fuzzing/alphanum-case.txt
```

#### Countries/Cities

You can use pycountry to generate a list of country codes ([output](https://github.com/QuentinRa/blog.quentinra.dev/blob/master/cybersecurity/red-team/_knowledge/topics/_files/cc.txt)).

```text!
import pycountry
country_codes = [country.alpha_2.lower() for country in pycountry.countries]
print('\n'.join(country_codes))
```
</div><div>

#### Security Questions

Refer to seclists or [imsky](https://github.com/imsky/wordlists/) <small>(0.3k ⭐)</small>.

```text!
/usr/share/seclists/Miscellaneous/security-question-answers/html-colors.txt
```

#### Parameters

Common wordlists to find hidden query/body parameters:

```text!
/usr/share/seclists/Discovery/Web-Content/burp-parameter-names.txt
/usr/share/seclists/Discovery/Web-Content/api/objects.tx
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [Auto_Wordlists](https://github.com/carlospolop/Auto_Wordlists)
* [big-list-of-naughty-strings](https://github.com/minimaxir/big-list-of-naughty-strings) <small>(47.0k ⭐)</small>
* [fuzzdb](https://github.com/fuzzdb-project/fuzzdb) <small>(8.4k ⭐, 2020 🪦)</small>
* [Security-Wordlist](https://github.com/DragonJAR/Security-Wordlist/)
* [Pwdb-Public](https://github.com/ignis-sec/Pwdb-Public/)
* [alterx](https://github.com/projectdiscovery/alterx)

Mangling

* [rsmangler](https://github.com/digininja/RSMangler)
* [The Mentalist](https://github.com/sc0tfree/mentalist)
</div><div>
</div></div>