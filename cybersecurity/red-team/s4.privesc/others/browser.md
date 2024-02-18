# Browser Saved Passwords

[![password_attacks](../../../_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)
[![file_insecure_storage_1](../../../_badges/rootme/cryptanalysis/file_insecure_storage_1.svg)](https://www.root-me.org/en/Challenges/Cryptanalysis/File-Insecure-storage-1)

<div class="row row-cols-lg-2"><div>

Mozilla Firefox passwords can be extracted and cracked using [firefox_decrypt](https://github.com/unode/firefox_decrypt) <small>(1.7k ⭐)</small>. To install it on Kali:

```ps
$ cd /opt
$ git clone https://github.com/unode/firefox_decrypt.git
$ cd firefox_decrypt
$ python3.9 firefox_decrypt.py -h
$ python3.9 firefox_decrypt.py /tmp/.mozilla/firefox/
```

Additional notes:

```ps
$ ls -l .mozilla/firefox/ | grep default
$ cat .mozilla/firefox/xxx.default-release/logins.json | jq.
```
</div><div>
</div></div>