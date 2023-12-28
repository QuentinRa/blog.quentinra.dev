# impacket

[![windowsprivesc20](../../../../cybersecurity/_badges/thmp/windowsprivesc20.svg)](https://tryhackme.com/room/windowsprivesc20)

<div class="row row-cols-lg-2"><div>

[impacket](https://github.com/fortra/impacket) (12.1k ⭐) is a collection of [python](/programming-languages/high-level/scripting/python/index.md) classes for working with network protocols. They are already installed on Kali:

```shell!
$ impacket-secretsdump # secretsdump.py
$ ...
```

You may install them manually too:

```shell!
$ sudo git clone https://github.com/fortra/impacket /opt/impacket
$ cd /opt/impacket
$ pip install -r requirements.txt
$ pip install .
```

And use a length command to invoke them:

```ps
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
</div><div>

#### mssqlclient

Connect to a MSSQL database.

```shell!
$ impacket-mssqlclient username@IP -windows-auth
$ impacket-mssqlclient username:password@IP -windows-auth
SQL> exit
```

<br>

#### Dump hashes from backup

Dump hashes from a backup of SAM and SYSTEM hashes.

```shell!
$ impacket-secretsdump -sam XXX -system YYY LOCAL
```

<br>

#### PsExec

Use a hash to login (Pass-The-Hash).

```shell!
$ impacket-psexec -hashes usernamehash:sessionhash username@IP
```

<br>

#### SMB server

Run a [SMB](../smb.md) server to which user will connect with the username XXX and the password YYY. Files will be stored in `/path/to/share`.

```shell!
$ impacket-smbserver -smb2support -username XXX -password YYY share_name /path/to/share
```
</div></div>