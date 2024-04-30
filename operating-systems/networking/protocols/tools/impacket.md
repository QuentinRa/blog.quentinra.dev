# impacket

[![windowsprivesc20](../../../../cybersecurity/_badges/thmp/windowsprivesc20.svg)](https://tryhackme.com/room/windowsprivesc20)

<div class="row row-cols-lg-2"><div>

[impacket](https://github.com/fortra/impacket) <small>(12.7k ⭐)</small> is a collection of [python](/programming-languages/high-level/scripting/python/index.md) classes for working with network protocols. They are already installed on Kali:

```shell!
$ impacket-secretsdump -h # Example of calling a script
```

You could also install them using `pipx`:

```shell!
$ pipx install git+https://github.com/fortra/impacket
$ secretsdump.py -h # Example of calling a script
```
</div><div>

You may also want to install them manually <small>(dirty/may not work)</small>:

```shell!
$ DEST="$HOME/tools/impacket"
$ git clone -b "master" "https://github.com/fortra/impacket" $DEST
$ pip install --user -r $DEST/requirements.txt
$ pip install --user $DEST
$ python $DEST/examples/secretsdump.py [...]
```

📚 You can refer to [thehacker.recipes](https://tools.thehacker.recipes/impacket) for a list of scripts.
</div></div>

<hr class="sep-both">

## Impacket Overview

<div class="row row-cols-lg-2"><div>

#### Impacket 'target' parameter

Most scripts operating require a **target** such as `username@IP`. You can specify the password within the command.

```shell!
$ impacket-xxx username@IP
$ impacket-xxx username:password@IP
$ impacket-xxx username:password@IP -windows-auth
```

`-windows-auth` can be specified to indicate that we want to use local authentication <small>(`.\username`)</small> instead of Active Directory authentication.
</div><div>
</div></div>

<hr class="sep-both">

## Impacket Clients

<div class="row row-cols-lg-2"><div>

#### mssqlclient

Connect to a MSSQL database.

```shell!
$ impacket-mssqlclient username@IP -windows-auth
$ impacket-mssqlclient username:password@IP -windows-auth
SQL> exit
```

#### smbclient

Connect to a SMB server.

```shell!
$ impacket-smbclient 'username':'password'@IP
$ impacket-smbclient IP
smbclient> shares
smbclient> use share_name
smbclient> ls
smbclient> tree
```
</div><div>

#### wmiexec

Pop a semi-interactive shell using [DCOM](/operating-systems/networking/protocols/dcom.md):

```shell!
$ impacket-wmiexec -shell-type powershell username:password@IP
$ impacket-wmiexec -shell-type powershell username:password@IP "hostname"
```

#### psexec

Pop a semi-interactive remote shell using RemComSvc.

```shell!
$ impacket-psexec -hashes lmhash:nthash username@IP
$ impacket-psexec -hashes :nthash username@IP
```
</div></div>

<hr class="sep-both">


<div class="row row-cols-lg-2"><div>

<br>

#### Samrdump

List users and domains.

```shell!
$ impacket-samrdump IP
$ impacket-samrdump username:password@IP
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

<br>

#### SMB server

[![password_attacks](../../../../cybersecurity/_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)

Run a [SMB](../smb.md) server to which user will connect with the username XXX and the password YYY. Files will be stored in `/path/to/share`.

```shell!
$ impacket-smbserver -smb2support -username XXX -password YYY share_name /path/to/share
$ impacket-smbserver -smb2support -username username -password password share .
$ impacket-smbserver -smb2support share_name /path/to/share
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