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

On Windows, you can find the user browser sensitive files at:

```text!
AppData\Local\Microsoft\Edge\User Data
AppData\Local\Google\Chrome\User Data
AppData\Local\BraveSoftware\Brave-Browser\User Data\
```

Passwords are stored [SQLite](/programming-languages/databases/relational/dbms/sqlite.md) database in `./<profile>/Login Data` such as `./Default/Login Data`. They are encrypted using a base64-encoded key in `./Local State`. You can display it using:

```ps
$ cat "./Local State" | jq | grep "encrypted_key"
"encrypted_key": "<encrypted secret key here>"
```

On Windows, the key is encrypted using [DPAPI master key](/operating-systems/windows/security/index.md#dump-credentials-protected-by-the-dpapi). Once you got it, you can decrypt the database using [pypykatz](/cybersecurity/red-team/tools/utilities/creds/pypykatz.md):

```shell!
$ cat mkf # master kejson file created by pypykatz
{
    "backupkeys": {},
    "masterkeys": {
        "H-I-J-K-L": "master_key_here"
    }
}
$ pypykatz dpapi chrome ./mkf "AppData/Local/Google/Chrome/User Data/Local State" --logindata "AppData/Local/Google/Chrome/User Data/Default/Login Data"
```
</div></div>