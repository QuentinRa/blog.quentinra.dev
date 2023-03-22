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

You may use a private key instead of a password (if configured).

```ps
$ ssh login@IP -i /path/to/id_rsa
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* `ssh xxx@yyy -T -L xxx:domain:xxx`: create a tunnel mapping one port to another
</div><div>


</div></div>