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
$ hashcat -m hcode myhashes wordlist -o hashes_cracked
```

Once a hash was cracked, hashcat will store it in its data folder, which may be one of `~/.hashcat/hashcat.potfile` or `~/.local/share/hashcat/hashcat.potfile`. You can also use `--show`:

```ps
$ hashcat -m hcode --show myhash            # unique hashes
$ hashcat -m hcode --show --username myhash # all
```
</div><div>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [old](_old.md)
</div><div>
</div></div>