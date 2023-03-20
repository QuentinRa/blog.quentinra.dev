# Remote shell access

<hr class="sep-both">

## Telnet

<div class="row row-cols-md-2"><div>

Telnet is a protocol to communicate with another computer. It can be used to send messages in any protocols, as long as you use the protocol "language", which is often hard.

🐊️ **Port**: 23 (TCP)

🔥 Telnet communications are not encrypted.

```ps
$ telnet IP port
# 1. the server sends the protocol banner
# 2. the user writes text while following the protocol
```
</div><div>

As an example, for HTTP version 1.1, you can write

```ps
$ telnet IP 80
GET / HTTP/1.1
Host: example.com
# leave two blank lines (press ENTER twice)
```
</div></div>

<hr class="sep-both">

## Secure shell (SSH)

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