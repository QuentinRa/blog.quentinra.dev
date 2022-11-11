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
$ ssh login@ip
$ ssh login@ip -u port
# use a private key
# instead of a password
$ ssh login@ip -i /path/to/id_rsa
```
</div></div>

<hr class="sep-both">

## Transfer files to/from a remote machine

<div class="row row-cols-md-2 mt-3"><div class="border-end border-dark">

### 🔓 ftp - 21 (tcp)

➡️&nbsp; There is a secure version called FTPS (port 990).

No encryption neither for the credentials nor the data exchanged.

```bash
$ ftp ip
$ ftp login@ip
ftp> commands
```

Once in a FTP shell, you may use the commands, see the [section 5.3.1.](https://www.rfc-editor.org/rfc/rfc959)

<details class="details-e">
<summary>FTP commands summary</summary>

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
ftp> syst # useless? information about the system
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
$ scp file_to_upload user@ip:remote/path/
# download
$ scp user@ip:remote/path/ local_path_to_dest
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
$ xfreerdp /u:x /p:y /v:ip
$ xfreerdp /dynamic-resolution +clipboard /cert:ignore /v:ip /u:x /p:y
```
</div><div>

There is [Remmina](https://github.com/FreeRDP/Remmina) (1.9k ⭐, `apt install remmina`) which has an easy-to-use graphical interface.

* `remmina`: start the graphical interface
    * Enter the IP of the target
    * Enter the credentials
    * Connect
* Then, I would advise to toggle "dynamic resolution update" in the left menu, so that you have a bigger screen.
* In preferences, we should be able to select a keyboard mapping <nobr class="small text-muted">(⚠️ need check)</nobr>
</div></div>