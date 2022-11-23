# Protocols & services

Any knowledge related to protocols, and services, such as ftp, ssh, sftp, scp, telnet, smtp...

> A lot of protocols were sending data/credentials as plaintext=unencrypted. Later, protocols such as SSL (Secure Sockets Layer) which was replaced with TLS (more secure), were introduced to improve existing protocols by adding encryption. TLS is usually referred as SSL/TLS. 

<hr class="sep-both">

## Open a shell on a remote machine

<div class="row row-cols-md-2 mt-3"><div class="border-end border-dark">

### 🔓 Telnet - 23 (tcp)

No encryption neither for the credentials nor the data exchanged.

```bash
$ telnet IP port
# 1. the server send the protocol banner
# 2. the user write text while following the protocol
```

Example with HTTP 1.1

```bash
$ telnet IP 80
GET / HTTP/1.1
Host: example.com
# leave two blank lines (press ENTER twice)
```

</div><div class="border-st art border-dark ps-4">

### 🔒 SSH - 22 (tcp)

```bash
$ ssh login@IP
$ ssh login@IP -u port
# use a private key
# instead of a password
$ ssh login@IP -i /path/to/id_rsa
```
</div></div>

<hr class="sep-both">

## Transfer files to/from a remote machine

<div class="row row-cols-md-2 mt-3"><div class="border-end border-dark">

### 🔓 ftp - 21 (tcp)

➡️&nbsp; There is a secure version called FTPS (port 990).

No encryption neither for the credentials nor the data exchanged.

```bash
$ ftp IP # use current user username
$ ftp username@IP
$ ftp username@IP -p port
ftp> help
```

Once in a FTP shell, you may use the commands, see the [section 5.3.1.](https://www.rfc-editor.org/rfc/rfc959)

<details class="details-e">
<summary>FTP commands summary</summary>

**Note**: ⚠️I had some issues when using paths with put/get, the transfer would always fail. By using only file name, meaning starting FTP in the directory where my file was, solved the problem, but...

```bash
ftp> pwd # path to current folder
ftp> ls folder # list files
ftp> cd folder # move to folder
ftp> put /local/path /remote/dest # upload
ftp> get /remote/path /local/dest # download
ftp> less file # read file
ftp> exit # exit
ftp> bye # same
```

And

```bash
ftp> syst # information about the system
ftp> stat # same, but there is the version+ftp client name
```
</details>

<details class="details-e">
<summary>Knowledge about FTP</summary>

An FTP request is starting with the server sending `USER`, the client answering with a username, the server sending `PASS`, and the user answering back with the password.

There are two modes in FTP: active, and passive. The mode determine the port used to transfer data. Data is transferred via the port 20, while in passive mode, a port higher than 1023 (reserved/system ports) will be used.

There are two channels in a FTP connection: a channel to send commands <small>(also called control)</small>, and one to transfer data. There is also a transfer mode, which could be ascii, or binary (default). You can enter `type [a|i]` or `ascii|binary` to switch.
</details>

</div><div class="border-st art border-dark ps-4">

### 🔒 scp/sftp - 22 (tcp)

Secure versions of FTP built over SSH.

```bash
# upload
$ scp file_to_upload user@IP:remote/path/
# download
$ scp user@IP:remote/path/ local_path_to_dest
```

> Use `scp -r` to download/upload a folder will all its content.
</div></div>

<hr class="sep-both">

## Sending mails

No encryption neither for the credentials nor the data exchanged.

<div class="row row-cols-md-2 mt-3"><div class="border-end border-dark">

### 🔓 SMTP - 25 (tcp)

➡️&nbsp; There is a secure version called SMTPS (port 445).

Simple Mail Transfer Protocol (SMTP) is a protocol is used by a mail client (**Mail User Agent**) to transfer mails (**Mail Submission Agent**) to a server that can transfer them for delivery called **Mail Transfer Agent**.

You could use the analogy of an MSA being the postman that take mails from your inbox (MUA) and deliver them to the post center (MTA).

```bash
$ telnet IP 25
helo hostname
mail from:
rcpt to:
data
subject: xxx
xxx
.
```

> SMTP also has the commands `VRFY` to check if a user exists, and `EXPN` to see the emails/mailing lists/... for a user.

</div><div class="border-st art border-dark ps-4">

The Mail Transfer Agent will send the mail to a **Mail Delivery Agent** which is the server that the client will query to access its mails. It's common for a MTA to also be an MDA. 

### 🔓 POP3 - 110 (tcp)

➡️&nbsp; There is a secure version called POP3S (port 995).

Post Office Protocol version 3 is a protocol that open the box, check if there are mails, if there are any, they are download and removed from the box.

```bash
$ telnet IP 110
USER xxx
PASS xxx
STAT # find if there mails
LIST # list new messages
RETR 1 # retrieve the first message
```

It's possible to configure POP3 so that mails aren't removed, but due to how it works, mails will remain marked as "new", and the client will lose track of whether a mail was read or not.

### 🔓 IMAP - 143 (tcp)

➡️&nbsp; There is a secure version called IMAPS (port 993).

Internet Message Access Protocol is a protocol design for synchronisation between mailbox. It allows the user to create folders, and sort mails inside. If a mail is read inside a mailbox, then it's marked as read in every other mailbox.

```bash
$ telnet IP 143
LOGIN username password
# every command must starts with an unique token of your choice
unique_token1 LIST "" "*" # list mails in every folder
unique_token2 EXAMINE INBOX # list mails in INBOX
unique_token3 LOGOUT # logout
```
</div></div>

<hr class="sep-both">

## 🔓 HTTP - 80 (tcp)

➡ There is a secure version called HTTPS (port 443).

<div class="row row-cols-md-2 mt-3"><div class="border-end border-dark">

HTTP/HTTPS is a protocol used to exchange wit a webserver. Usually, a web browser will make a request, and the result will be some HTML. An HTTP/HTTPS request involve a few things

✅ First, there is a method

* `GET`: get a ressource
* `POST`: create a resource on the server
* `PUT`: update a field of a resource on the server
* `DELETE`: delete a resource on the server
* ...

✅  We also need to provide a **URI**, which is a path relative to the webserver root. For instance, for `https://example.com/index.html`, the URI is `/index.html`.

✅  We will also use an HTTP version, the most used ones are `HTTP/1.1`, and `HTTP 2.0`.

✅  In every HTTP/HTTPS request/response, there are headers that are set both by the client and the server. The format is `Header-name: value`, and anyone can add its own headers.

* `Set-cookie`: the cookies <small>(usually the server add this to create them in the client browser, and the client will send the cookies in every following request)</small>
* `Host`: one of the domain name associated with the IP of the server
* `Server:`: name of the HTTP server, maybe the version/OS too
* ...
</div><div>

✅  There may be data send with the request. For instance, if we are `POST`-ing a resource, we will most likely provide some data about the resource we want to create. This data can be specified leaving one blank line below the headers, and must be URL-encoded <small>(characters that are not valid inside a URL such as `'` must be URL encoded, meaning we convert them to hexadecimal `27` and prepended with a `%` giving us `%27`)</small>. This is automatically done by your browser.

✅  You need to leave a blank line to indicate that the request is finished.

Here is an example of a request of the resource (GET) at the URI `/` (webserver root) from the website `example.com`, hosted by the server with the IP `IP`, using HTTP 1.1 on port 80.

```bash
# Basically: http://example.com/
$ telnet IP 80
GET / HTTP/1.1
Host: example.com
# leave a blank line
```

The server will answer with an [HTTP response code](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status) according to how it could handle the request <small>(200=OK, 301/303=redirected, 404=Not found, 500=Internal error...)</small>, along with its HTTP response headers, and data.
</div></div>

<hr class="sep-both">

## ⚡ RPC - 111 (tcp/udp)

<div class="row row-cols-md-2"><div>

On RPC port, from what I understood, there is a tcp/udp service called `rpcbind` that if running, can be used to find the port used by a protocol from a protocol number.
</div><div>
</div></div>

<hr class="sep-both">

## 🔒 Samba - 445 (or 139 before, tcp)

<div class="row row-cols-md-2"><div>

[Samba](https://www.samba.org/) is making both file exchange system of Linux (NFS), and Windwos (SMB) work together. It's mostly used to share files internally by connecting computers/printers/... to a shared folder called **share**.

```bash
$ smbclient //IP/share_name
$ smbclient smb://IP/share_name # same
$ smbclient //IP/share_name -p port
$ smbclient //IP/share_name -U username
```

Download everything in a share

```bash
$ smbget -R //IP/share_name
```
</div><div>

Once connected, you can use theses

```bash
smb> help # list every command
smb> pwd # get current folder
smb> ls folder # list files in folder
smb> cd folder # move to folder
smb> stat file # show information
smb> more file # read a file remotely
smb> put /local/path /remote/path # upload
smb> get /remote/path /local/path # download
smb> exit # there is also "q" and "quit"
```
</div></div>

<hr class="sep-both">

## 🔒 NFS - 2049 (tcp)

<div class="row row-cols-md-2 mt-2"><div>

Network File System (NFS) is a protocol allowing a computer to mount a remote folder on its local file system. The command below will mount the remote folder `/share` inside `/tmp/share` on our machine. It means that when we browse `/tmp/share`, we will see the files inside `/share` on the remote host.

```bash
#  sudo apt install nfs-common
$ mkdir /tmp/share
$ sudo mount -t nfs IP:/share /tmp/share/ -nolock
# there is also variants (with/without vers=2): 
# sudo mount -o rw,vers=2 IP:/share /tmp/share/
# unmount
$ sudo umount /tmp/share
```

Remote Procedure Calls (RPC) are used to exchange with the server.
</div><div>

List mounts

```bash
$ showmount -e IP
# see NFS exports
$ cat /etc/exports
```
</div></div>

<hr class="sep-both">

## 🔒 Remote Desktop Protocol (RDP) - 3389 (tcp)

<div class="row row-cols-md-2"><div>

RDP is a protocol used to connect a desktop with a graphical interface to another computer over a network connection.

There is [rdesktop](https://github.com/rdesktop/rdesktop) (1.1k ⭐).

There is [FreeRDP](https://github.com/FreeRDP/FreeRDP) (7.5k ⭐), and there is a graphical version too [xfreerdp-gui](https://github.com/wyllianbs/xfreerdp-gui) (29 ⭐).

```bash
$ xfreerdp /u:x /p:y /v:IP
$ xfreerdp /dynamic-resolution +clipboard /cert:ignore /v:IP /u:x /p:y
```
</div><div>

There is [Remmina](https://github.com/FreeRDP/Remmina) (1.9k ⭐, `apt install remmina`) which has an easy-to-use graphical interface.

* `remmina`: start the graphical interface
    * Enter the IP of the target
    * Enter the credentials
    * Connect
* Then, I would advise to toggle "dynamic resolution update" in the left menu, so that you have a bigger screen.
* In preferences, we should be able to select a keyboard mapping <nobr class="small text-muted">(⚠️ need check)</nobr>
* [You can scale the screen too](https://askubuntu.com/questions/1075098/remmina-scaling-options)
</div></div>