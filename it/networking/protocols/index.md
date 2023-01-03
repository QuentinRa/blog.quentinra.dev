# Protocols & services

Any knowledge related to protocols, and services, such as FTP, SSH, SFTP, SCP, Telnet, SMTP...

> A lot of protocols were sending data/credentials as plaintext=unencrypted. Later, protocols such as SSL (Secure Sockets Layer) which was replaced with TLS (more secure), were introduced to improve existing protocols by adding encryption. TLS is usually referred to as SSL/TLS. 

<hr class="sep-both">

## Open a shell on a remote machine

<div class="row row-cols-md-2 mt-3"><div class="border-end border-dark">

### 🔓 Telnet - 23 (TCP)

No encryption neither for the credentials nor the data exchanged.

```bash
$ telnet IP port
# 1. the server sends the protocol banner
# 2. the user writes text while following the protocol
```

As an example, for HTTP version 1.1, you can write

```bash
$ telnet IP 80
GET / HTTP/1.1
Host: example.com
# leave two blank lines (press ENTER twice)
```

</div><div class="border-st art border-dark ps-4">

### 🔒 SSH - 22 (TCP)

```bash
$ ssh login@IP
$ ssh login@IP -u port
# you can use a private key
# instead of a password
$ ssh login@IP -i /path/to/id_rsa
```
</div></div>

<hr class="sep-both">

## Transfer files to/from a remote machine

<div class="row row-cols-md-2 mt-3"><div class="border-end border-dark">

### 🔓 FTP - 21 (TCP)

➡️&nbsp; There is a secure version called FTPS (port 990).

No encryption neither for the credentials nor the data exchanged.

```bash
$ ftp IP # use current user username
$ ftp username@IP
$ ftp username@IP -p port
ftp> help
```

Once in an FTP shell, you may use the commands, see the [section 5.3.1.](https://www.rfc-editor.org/rfc/rfc959)

<details class="details-e">
<summary>FTP commands summary</summary>

**Note**: ⚠️I had some issues when using paths with put/get, the transfer would always fail. Using only the file name, meaning starting FTP in the directory where my file was, solved the problem, but...

```bash
ftp> pwd # path to the current folder
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

There are two modes in FTP: active, and passive. The mode determines the port used to transfer data. Data is transferred via the port 20, while in passive mode, a port higher than 1023 (reserved/system ports) will be used.

There are two channels in an FTP connection: a channel to send commands <small>(also called control)</small>, and one to transfer data. There is also a transfer mode, which could be ASCII, or binary (default). You can enter `type [a|i]` or `ascii|binary` to switch.
</details>

</div><div class="border-st art border-dark ps-4">

### 🔒 SCP/SFTP - 22 (TCP)

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

### 🔓 SMTP - 25 (TCP)

➡️&nbsp; There is a secure version called SMTPS (port 445).

Simple Mail Transfer Protocol (SMTP) is a protocol used by a mail client (**Mail User Agent**) to transfer emails (**Mail Submission Agent**) to a server called **Mail Transfer Agent**. This server will transfer emails to another server that will handle the delivery.

You could use the analogy of an MSA being the postman that takes mail from your inbox <small>(MUA)</small> and deliver them to the post center <small>(MTA)</small>.

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

The Mail Transfer Agent will send the mail to a **Mail Delivery Agent** which is the server that the client will query to access his/her emails. It's common for an MTA to also be an MDA. 

### 🔓 POP3 - 110 (TCP)

➡️&nbsp; There is a secure version called POP3S (port 995).

Post Office Protocol version 3 is a protocol that opens the box, checks if there are emails, and if any, downloads and removes them from the box.

```bash
$ telnet IP 110
USER xxx
PASS xxx
STAT # find if there mails
LIST # list new messages
RETR 1 # retrieve the first message
```

It's possible to configure POP3 so that emails aren't removed, but due to how it works, mails will remain marked as "new", and the client will lose track of whether a mail was read or not.

### 🔓 IMAP - 143 (TCP)

➡️&nbsp; There is a secure version called IMAPS (port 993).

Internet Message Access Protocol is a protocol designed for synchronization between mailboxes. It allows the user to create folders, and sort mails inside. If a mail is read inside a mailbox, then it's marked as read in every other mailbox.

```bash
$ telnet IP 143
LOGIN username password
# every command must start with a unique token of your choice
unique_token1 LIST "" "*" # list mails in every folder
unique_token2 EXAMINE INBOX # list mails in INBOX
unique_token3 LOGOUT # logout
```
</div></div>

<hr class="sep-both">

## 🔓 HTTP - 80 (TCP)

➡ There is a secure version called HTTPS (port 443).

<div class="row row-cols-md-2 mt-3"><div class="border-end border-dark">

HTTP/HTTPS is a protocol used to exchange with a webserver. Your browser is sending an HTTP request to a webserver, receives a response with HTML inside, and displays the page in your browser.

```bash
$ telnet IP 80
GET / HTTP/1.1
Host: example.com
# leave a blank line
```

##### Method

The **first** element in a request is the method.

* `GET`: get a resource  <small>(ex: return `/index.html`)</small>
* `POST`: create a resource <small>(ex: create a user)</small>
* `PUT`: update ONE field of a resource <small>(ex: update user password)</small>
* `PATCH`: update a resource <small>(ex: update user data)</small>
* `DELETE`: delete a resource  <small>(ex: delete a user)</small>
* ...

##### Path/Route

The **second** is called **Path**/**Route**. It's a path relative to the webserver root. For instance, for `https://example.com/index.html`, the path is `/index.html`.

##### HTTP versions

HTTP versions that are widely used are `HTTP/1.1`, and `HTTP 2.0`, while `HTTP 3.0` was released in 2022.
</div><div>

##### HTTP Headers

In every HTTP/HTTPS request/response, there are headers that are set both by the client and the server. The format is `Header-name: value`, and anyone can add their own headers.

* `Set-cookie`: The server request the creation of cookies
* `Cookie`: The client send in every request the created cookies
* `Host`: one of the domain names hosted by the server
* `Server:`: name of the HTTP server, maybe the version/OS too
* ...

##### HTTP Response code

When the server answers, it returns an [HTTP response code](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status) according to how it could handle the request

* `200`: OK
* `301/303`: Redirected
* `404`: Not found
* `500`: Internal server error
* ...

##### URL-encoding

If you are creating a user, you will most likely send the username/... to the server. Aside from `GET`, this data is added after leaving one blank line below the headers. In any case, the data must be URL-encoded as some characters aren't valid in a URL.

* Example of encoding `%`
* Find the ASCII of `%`: `37`
* Convert the value to hexadecimal: `25`
* Add `%` before the result: `%25`
* This is automatically done by your browser.
</div></div>

<hr class="sep-both">

## ⚡ RPC - 111 (TCP/UDP)

<div class="row row-cols-md-2"><div>

On the RPC port, from what I understood, there is a TCP/UDP service called `rpcbind` that, if running, can be used to find the port used by a protocol from a protocol number.
</div><div>
</div></div>

<hr class="sep-both">

## 🔒 Samba - 445 (or 139 before, TCP)

<div class="row row-cols-md-2"><div>

[Samba](https://www.samba.org/) is making both file exchange systems of Linux (NFS), and Windows (SMB) work together. It's mostly used to share files internally by connecting computers/printers/... to a shared folder called **share**.

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

## 🔒 NFS - 2049 (TCP)

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

## 🔒 Remote Desktop Protocol (RDP) - 3389 (TCP)

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
* Then, I would advise toggling "dynamic resolution update" in the left menu, so that you have a bigger screen.
* In preferences, we should be able to select a keyboard mapping <nobr class="small text-muted">(⚠️ need check)</nobr>
* [You can scale the screen too](https://askubuntu.com/questions/1075098/remmina-scaling-options)
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* `ssh xxx@yyy -T -L xxx:domain:xxx`: create a tunnel mapping one port to another
* see SRM notes
</div><div>

```
URL
* Scheme: (protocol) HTTP/HTTPS/...
* Username:Password@Domain:port/Path?query#Fragment
* Methods GET, DELETE...
* Headers
  * Server: some server
  * Set-cookie: ... => server send the cookie in every request
  * ...
* Response code
```
</div></div>