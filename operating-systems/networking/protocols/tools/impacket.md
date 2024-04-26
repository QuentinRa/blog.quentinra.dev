# impacket

[![windowsprivesc20](../../../../cybersecurity/_badges/thmp/windowsprivesc20.svg)](https://tryhackme.com/room/windowsprivesc20)

<div class="row row-cols-lg-2"><div>

[impacket](https://github.com/fortra/impacket) <small>(12.5k ⭐)</small> is a collection of [python](/programming-languages/high-level/scripting/python/index.md) classes for working with network protocols. They are already installed on Kali:

```shell!
$ impacket-secretsdump # secretsdump.py
$ ...
```

You may install them manually too:

```shell!
$ # todo: use local install or pipx for others
$ sudo git clone https://github.com/fortra/impacket /opt/impacket
$ cd /opt/impacket
$ pip install -r requirements.txt
$ pip install .
$ python /opt/impacket/examples/secretsdump.py [...]
```

<br>

#### Samrdump

List users and domains.

```shell!
$ impacket-samrdump IP
$ impacket-samrdump username:password@IP
```

<br>

#### wmiexec

Pop a powershell or run commands using [DCOM](/operating-systems/networking/protocols/dcom.md):

```shell!
$ impacket-wmiexec -shell-type powershell username:password@IP
$ impacket-wmiexec -shell-type powershell username:password@IP "hostname"
```

<br>

#### mssqlclient

Connect to a MSSQL database.

```shell!
$ impacket-mssqlclient username@IP -windows-auth
$ impacket-mssqlclient username:password@IP -windows-auth
SQL> exit
```
</div><div>

#### SecretsDump

[![password_attacks](../../../../cybersecurity/_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)

Dump hashes from a backup of SAM and SYSTEM hashes. There are local credentials and domain cached credentials.

```shell!
$ impacket-secretsdump -sam XXX -system YYY LOCAL
$ impacket-secretsdump -sam XXX -security XXX -system XXX LOCAL
$ impacket-secretsdump -system ./system.hive -ntds ./ntds.dit LOCAL
<output format is explained in the output>
```

<br>

#### PsExec

Use a hash to login (Pass-The-Hash).

```shell!
$ impacket-psexec -hashes usernamehash:sessionhash username@IP
$ impacket-psexec -hashes :hash username@IP
```

<br>

#### SMB server

[![password_attacks](../../../../cybersecurity/_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)

Run a [SMB](../smb.md) server to which user will connect with the username XXX and the password YYY. Files will be stored in `/path/to/share`.

```shell!
$ impacket-smbserver -smb2support -username XXX -password YYY share_name /path/to/share
$ impacket-smbserver -smb2support -username username -password password share .
$ impacket-smbserver -smb2support share_name /path/to/share
```

<br>

#### SMB Client

Alternative to `smbclient`. It works even when the former doesn't.

```shell!
$ impacket-smbclient 'username':'password'@IP
$ impacket-smbclient IP
# shares
<list of shares>
# use <sharename>
# ls
# tree
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

```shell!
$ impacket-dpapi unprotect -file xxx -key "xxx"
$ impacket-wmiexec domain/username:'password'@IP  # Local Admin but new process per command
$ impacket-psexec domain/username:'password'@IP # SYSTEM so more suspicious
$ impacket-secretsdump -outputfile hashes EXAMPLE\username:'password' -just-dc
impacket-secretsdump -outputfile hashes EXAMPLE.COM/'username':'password'@DC01.EXAMPLE.COM
```
</div><div>
</div></div>