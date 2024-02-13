# KeePass Password Manager

<div class="row row-cols-lg-2"><div>

[KeePass](https://keepass.info/) is a free and open-source password manager. The source code is available for download in each [release](https://sourceforge.net/projects/keepass/).

* KeePass can be extended through [plugins](https://keepass.info/plugins.html) 🐲.
* Multiple forks exist. Refer to [
awesome-keepass ](https://github.com/lgg/awesome-keepass) <small>(0.3k ⭐)</small>.

KeePass is storing passwords locally in a `.kdbx` database.
</div><div>
</div></div>

<hr class="sep-both">

## KeePass Pentester Notes ☠️

<div class="row row-cols-lg-2"><div>

#### FootHold

* You can try to [brute force](/cybersecurity/cryptography/algorithms/hashing/index.md) the master password:

```shell!
$ keepass2john xxx.kdbx > myhash
$ john myhash --wordlist=wordlist
```
</div><div>
</div></div>