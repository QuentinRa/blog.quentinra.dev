# Secure shell (SSH)

<div class="row row-cols-md-2"><div>

Secure shell (SSH) is the most commonly used protocol to access a remote shell on a remote host.

🐊️ **Port**: 22 (TCP)

🥊 SSH can be used to create a secure connection for an insecure protocol. For instance, SFTP is for FTP over SSH.
</div><div>

```ps
$ ssh login@IP
$ ssh login@IP -u port
```

You may use a private key instead of a password (if configured). Note that the key must have at least the permissions `600`.

```ps
$ ssh login@IP -i /path/to/id_rsa
```
</div></div>

<hr class="sep-both">

## SSH vulnerabilities ☠️

<div class="row row-cols-md-2"><div>

A hacker want to access the target host, and compromise it. 

* The hacker may have found a `.ssh` folder, in which there may be a ssh certificate (`id_rsa`...) to connect to a host. This file may be protected by a password, but it may be [cracked](/cybersecurity/cryptography/algorithms/hashing/index.md#hash-cracking).

* The password may be weak and vulnerable to [brute force](/cybersecurity/red-team/s3.exploitation/index.md#brute-force).

</div><div>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* `ssh xxx@yyy -T -L xxx:domain:xxx`: create a tunnel mapping one port to another
* ssh-keygen
* ssh-copy-id
</div><div>


</div></div>