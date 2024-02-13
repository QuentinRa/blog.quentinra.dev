# Secure shell (SSH)

[![protocolsandservers2](../../../cybersecurity/_badges/thmp/protocolsandservers2.svg)](https://tryhackme.com/room/protocolsandservers2)
[![linux2](../../../cybersecurity/_badges/thm/linux2.svg)](https://tryhackme.com/room/linux2)
[![footprinting](../../../cybersecurity/_badges/htb/footprinting.svg)](https://academy.hackthebox.com/course/preview/footprinting)

<div class="row row-cols-lg-2"><div>

Secure shell (SSH) is the most commonly used protocol to access a remote shell on a remote host.

🐊️ **Port**: 22 (TCP)

🥊 SSH can be used to create a secure connection for an insecure protocol. For instance, SFTP is for FTP over SSH.
</div><div>

Basic usage:

```ps
$ ssh username@IP
$ ssh username@IP -p port
```

You may use a private key instead of a password (if configured). Note that the key must have at least the permissions `600`.

```ps
$ ssh username@IP -i /path/to/id_rsa
```
</div></div>

<hr class="sep-both">

## SSH Pentester Notes ☠️

<div class="row row-cols-lg-2"><div>

#### Foothold

[![password_attacks](../../../cybersecurity/_badges/htb/password_attacks.svg)](https://academy.hackthebox.com/course/preview/password-attacks)

* The `.ssh` folder may contain a ssh key <small>(often called `id_rsa`)</small> to connect to a host. This file may be protected by a password, but using offline [hash cracking](/cybersecurity/cryptography/algorithms/hashing/index.md#ssh-private-key---passphrase-cracking), we may be able to find it.

* Use `-v` to detect allowed authentication modes and force one that is convenient for us.

```ps
$ ssh [...] -v -o PreferredAuthentications=password
```

* The password may be weak and vulnerable to [brute force](/cybersecurity/red-team/s2.discovery/techniques/network/auth.md).

```shell!
$ hydra -L user.list -P password.list ssh://IP -V
```
</div><div>

#### Additional Ressources

[![keeper](../../../cybersecurity/_badges/htb-p/keeper.svg)](https://app.hackthebox.com/machines/Keeper)

* Run [ssh-audit](https://github.com/jtesta/ssh-audit) <small>(3.0k ⭐)</small> and analyze the output

* Use `puttygen saved_key.ppk -O private-openssh -o id_rsa` to convert a Putty key file to a Linux SSH file.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* `ssh xxx@yyy -T -L sp:domain:dp`: create a tunnel mapping one port to another. `ssh -N -f -l username IP`
* ssh-keygen
* `ssh-keygen -f key`: leave in `>> /root/.ssh/authorized_keys` the pub
* `-R "xxx"`
* `ssh -X` with `X11Forwarding` enabled
* `sshpass -p 'XXX' ssh xxx@IP`
* Authorized keys
* `sudo systemctl restart sshd`
* `ssh-copy-id username@server`: add to remote server our public key
</div><div>

* `/etc/ssh/sshd_config`
  * `PermitRootLogin no`
  * `PubkeyAuthentication yes`
  * `PasswordAuthentication no`
  * [Hardening](https://www.ssh-audit.com/hardening_guides.html)

SSH Forward Agent tests

```shell!
$ ssh xxx@yyy -A
ssh> ssh-add -l
ssh> cat /proc/$$/environ | tr '\0' '\n' | grep SSH_AUTH_SOCK
ssh> cat /proc/*/environ 2> /dev/null | tr '\0' '\n' | grep SSH_AUTH_SOCK
ssh> SSH_AUTH_SOCK=/tmp/ssh-XXX/agent.$pid <something?>
```
</div></div>