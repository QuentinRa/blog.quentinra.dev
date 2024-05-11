# Password Policy

[![active_directory_enumeration_attacks](../../../../_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)
[![broken_authentication](../../../../_badges/htb/broken_authentication.svg)](https://academy.hackthebox.com/course/preview/broken-authentication)
[![adenumeration](../../../../_badges/thm/adenumeration.svg)](https://tryhackme.com/r/room/adenumeration)

<div class="row row-cols-lg-2"><div>

Before attempting attacks such as [Password Spraying](/cybersecurity/red-team/s2.discovery/techniques/passwords/spraying.md) or even brute forcing, we often want to learn more about the password policy to:

* 🛡️ Is account lockout enabled?
* 🥷 How much delay must we add before tries?
* ⚠️ How many tries can we perform before locking the account?
* 🗺️ Is there a minimum/maximum password length?
* 🐲 Is password complexity enabled?

We want to avoid locking accounts **at all cost**️.
</div><div>

On Windows Server, there is no lockout by default, but many implement a lockout after three or five invalid passwords. Account lockout threshold reset is usually between 30 minutes and 3 hours.

Knowing the minimum length of the password and the password rules is handy to fine-tune the passwords we try.
</div></div>

<hr class="sep-both">

## Obtain Windows Password Policy

<div class="row row-cols-lg-2"><div>

#### Leveraging SMB

[![active_directory_enumeration_attacks](../../../../_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)

You can use [SMB](/operating-systems/networking/protocols/smb.md) credentials to obtain the password policy.

```ps
$ nxc smb [...] --pass-pol
$ nxc smb [...] --users # show 'badpasswordcount' for each user
```

```shell!
$ enum4linux-ng [...] -P
```

#### Leveraging RPC

[![active_directory_enumeration_attacks](../../../../_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)

You can use [RPC](/operating-systems/networking/protocols/rpc.md#rpc-smb-footprinting) credentials to obtain the password policy.

```shell!
$ rpcclient [...]
client> getdompwinfo    # Password Policy
```
</div><div>

#### Leveraging Windows Commands

[![active_directory_enumeration_attacks](../../../../_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)
[![adenumeration](../../../../_badges/thm/adenumeration.svg)](https://tryhackme.com/r/room/adenumeration)

If you can run commands, you may use:

```ps
PS> net accounts
PS> net accounts /domain
```

This one from AD module may be handy:

```ps
PS> Get-ADObject -Filter 'badPwdCount -gt 0' -includeDeletedObjects
```

#### Additional Notes

[![active_directory_enumeration_attacks](../../../../_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)

You can use [PowerView](/cybersecurity/red-team/tools/utilities/windows/powersploit.md):

```shell!
PS> Get-DomainPolicy
```
</div></div>

<hr class="sep-both">

## Website Password Policy

<div class="row row-cols-lg-2"><div>

#### Register Page

[![broken_authentication](../../../../_badges/htb/broken_authentication.svg)](https://academy.hackthebox.com/course/preview/broken-authentication)

The password policy is often shown, directly or indirectly when registering an account. If indirect, you have to register an account with a weak password <small>(`a`, `a0`, `a0!`, etc.)</small> and read expose it bit by bit.
</div><div>
</div></div>