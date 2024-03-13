# KeePass Password Manager

[![adventofcyber2](../../../_badges/thm/adventofcyber2/day22.svg)](https://tryhackme.com/room/adventofcyber2)

<div class="row row-cols-lg-2"><div>

[KeePass](https://keepass.info/) is a free and open-source password manager. The source code is available for download in each [release](https://sourceforge.net/projects/keepass/).

* KeePass can be extended through [plugins](https://keepass.info/plugins.html) 🐲.
* Multiple forks exist. Refer to [awesome-keepass](https://github.com/lgg/awesome-keepass) <small>(0.4k ⭐)</small>.

KeePass is storing passwords locally in a `.kdbx` database.
</div><div>
</div></div>

<hr class="sep-both">

## KeePass Pentester Notes ☠️

<div class="row row-cols-lg-2"><div>

#### FootHold

[![password_attacks](../../../_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)

* You can try to [brute force](/cybersecurity/cryptography/algorithms/hashing/index.md) the master password:

```shell!
$ keepass2john xxx.kdbx > myhash
$ john myhash --wordlist=wordlist
```
</div><div>

#### Well-Known CVEs

[![keeper](../../../_badges/htb-p/keeper.svg)](https://app.hackthebox.com/machines/Keeper)

* [CVE-2023-32784](https://nvd.nist.gov/vuln/detail/CVE-2023-32784): if we have memory dump when keepass was unlocked and running, we are able to dump almost all the cleartext password <small>(aside from first char)</small>. There are many PoC below:

[keepass-password-dumper](https://github.com/vdohney/keepass-password-dumper) <small>(0.6k ⭐)</small> in `.NET`. There is also [keepass-dump-masterkey](https://github.com/matro7sh/keepass-dump-masterkey) <small>(0.1k ⭐)</small> or [keepass_dump](https://github.com/z-jxy/keepass_dump) <small>(0.01k ⭐)</small> both in `Python`.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

```shell!
$ kpcli
kpclip:/> open xxx.kdbx
kpclip:/> ls
kpclip:/> cd xxx
kpclip:/> ls
kpclip:/> show <kid> -f
```
</div><div>
</div></div>