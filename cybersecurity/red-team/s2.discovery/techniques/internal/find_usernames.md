# Find Internal User Accounts

[![active_directory_enumeration_attacks](../../../../_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)

<div class="row row-cols-lg-2"><div>

From a host inside an internal environment, we often want to discover new accounts we could pivot to.

In an [LDAP](/operating-systems/networking/protocols/ldap.md) environment such as Active Directory, we can use:

```ps
$ ldapsearch -h IP -x -b "dc=example,dc=com" -s sub "*" | grep -m 1 -B 10 pwdHistoryLength
$ ldapsearch -h IP -x -b "dc=example,dc=com" -s sub "(&(objectclass=user))" | grep sAMAccountName: | cut -f2 -d" "
$ python windapsearch.py --dc-ip IP -u "" -U
```
</div><div>

We can use [kerbrute](/cybersecurity/red-team/tools/utilities/windows/kerbrute.md) which can even detect users with no pre auth required and dump their hashes.

```ps
$ kerbrute userenum -d domain --dc IP wordlist
```
</div></div>