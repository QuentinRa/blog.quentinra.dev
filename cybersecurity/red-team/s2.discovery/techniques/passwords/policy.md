# Password Policy

[![active_directory_enumeration_attacks](../../../../_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)

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

You can use [SMB](/operating-systems/networking/protocols/smb.md) credentials to obtain the password policy.

```ps
$ nxc smb [...] --pass-pol
$ nxc smb [...] --users # show 'badpasswordcount' for each user
$ enum4linux-ng [...] -P
```
</div><div>
</div></div>