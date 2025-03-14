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
$ hydra -L user.list -P password.list ssh://IP -V -f
```
</div><div>

#### Additional Resources

[![keeper](../../../cybersecurity/_badges/htb-p/keeper.svg)](https://app.hackthebox.com/machines/Keeper)

* Run [ssh-audit](https://github.com/jtesta/ssh-audit) <small>(3.6k ⭐)</small> and analyze the output

* Use `puttygen saved_key.ppk -O private-openssh -o id_rsa` to convert a Putty key file to a Linux SSH file.
</div></div>

<hr class="sep-both">

## PEM SSH Key Files

<div class="row row-cols-lg-2"><div>

#### PEM SSH Key Files — Overview

[Privacy-Enhanced Mail (PEM)](https://en.wikipedia.org/wiki/Privacy-Enhanced_Mail) is a file format mostly to share cryptographic keys such as SSH keys.

We can use SSH keys to log in to a host without sending a password over the network. We will generate a **private key** and a **public key**.

The target will have our public key in their `.ssh/authorized_keys` file. They will use it to send us a authentication challenge.

To generate a private key <small>(PEM)</small> and a public key <small>(OpenSSH)</small>:

```shell!
$ ssh-keygen -f mykey      # mykey (private) | mykey.pub
$ ssh username@ip -i mykey # Permissions: 644 or less
```
</div><div>

#### PEM SSH Key Files — RSA File Format

For an RSA private key, the format is:

```sql!
RSAPrivateKey ::= SEQUENCE {
  version           Version,
  modulus           INTEGER,  -- n
  publicExponent    INTEGER,  -- e
  privateExponent   INTEGER,  -- d
  prime1            INTEGER,  -- p
  prime2            INTEGER,  -- q
  exponent1         INTEGER,  -- d mod (p-1)
  exponent2         INTEGER,  -- d mod (q-1)
  coefficient       INTEGER,  -- (inverse of q) mod p
  otherPrimeInfos   OtherPrimeInfos OPTIONAL
}
```

You can use [CyberChef PEM To Hex](https://cyberchef.org/#recipe=PEM_to_Hex()) to get the hexadecimal of a partial SSH key. Let's read `308204be0201000...SNIP`:

| Hex     | Type        | Value       |
|---------|-------------|-------------|
| 0x30    | Data Type   | Sequence    |
| 0x82    | Size Length | 2 bytes     |
| 0x04be  | Size Value  | 1214        |
| 0x02... | Data Value  | All below   |
| 0x02    | Data Type   | INTEGER     |
| 0x01    | Size Length | 1           |
| 0x00    | Size Value  | 0           |
| 0x00    | Data Value  | 0 (version) |

Additional commands:

```ps
$ openssl asn1parse -in key
```

Related: [Bro-key-n](https://hackmd.io/@dogdogeatcatcat/S1-W1w4a9), [Backup - frank](https://ctftime.org/writeup/27205), [Corrupted PEM](https://github.com/OwenK2/Fall-2021-NCL-Corrupted-PEM-Write-Up), [1506](https://eprint.iacr.org/2020/1506.pdf), [X-secrets](https://blog.cryptohack.org/twitter-secrets).
</div></div>

<hr class="sep-both">

## Additional Notes

<div class="row row-cols-lg-2"><div>

#### SSH Forwarding

[![ssh_agent_hijacking](../../../cybersecurity/_badges/rootme/app_script/ssh_agent_hijacking.svg)](https://www.root-me.org/en/Challenges/App-Script/SSH-Agent-Hijacking)

If SSH Forwarding is enabled <small>(`/etc/ssh/sshd_config`, `$HOME/.ssh/config`, etc.)</small>, then when we SSH to a host using `-A`, it will create a socket in `/tmp` and set the variable `SSH_AUTH_SOCK` accordingly.

There are multiple ways to exploit this:

* As **root**, we can connect to anyone else SSH session
* As a **user**, we can connect to any socket we can read, for instance, we compromised a user having a running SSH session as admin.

```ps
$ export SSH_AUTH_SOCK=/path/to/agent.xxx; ssh username@0
<no password == it worked>
```

```ps
$ cat /proc/$$/environ | tr '\0' '\n' | grep SSH_AUTH_SOCK
$ cat /proc/*/environ 2> /dev/null | tr '\0' '\n' | grep SSH_AUTH_SOCK
```

➡️ Article: [SSH Agent Hijacking](https://jekhokie.github.io/linux/ssh/security/hijacking/2019/09/07/ssh-agent-hijacking.html).
</div><div>

#### SSH Tunneling And Port Forwarding

Please refer to [this](/cybersecurity/red-team/s5.post-exploitation/index.md#pivoting-to-another-host-).
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* `-R "xxx"`
* `ssh -X` with `X11Forwarding` enabled
* `sshpass -p 'XXX' ssh xxx@IP`
* `sudo systemctl restart sshd`
* `ssh-copy-id username@server`: add to remote server our public key
* `ssh domain\\username@target`
* Look for problems in configurations
</div><div>

* `/etc/ssh/sshd_config`
  * `PermitRootLogin no`
  * `PubkeyAuthentication yes`
  * `PasswordAuthentication no`
  * [Hardening](https://www.ssh-audit.com/hardening_guides.html)
  * forwarding <small>(subsystem filetransfer sftp match group xxx but we must add again no forward)</small>
</div></div>