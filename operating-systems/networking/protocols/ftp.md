# File Transfer Protocol (FTP)

[![protocolsandservers](../../../cybersecurity/_badges/thmp/protocolsandservers.svg)](https://tryhackme.com/room/protocolsandservers)

<div class="row row-cols-md-2"><div>

File Transfer Protocol (FTP) is a widely used protocol to transfer files. It's mostly used externally, unlike SMB or NFS.

🐊️ **Ports**: 21 (TCP/control), and 20 (TCP/data)

🔥 FTP communications are not encrypted.

🔒 There is a secure version called FTPS <small>(port 990, over SSL/TLS)</small>.

```bash
$ ftp IP # use current user username
$ ftp username@IP
$ ftp username@IP -p port
ftp> help
```

<details class="details-n">
<summary>FTP protocol internals</summary>

An FTP request is starting with the server sending `USER`, the client answering with a username, the server sending `PASS`, and the user answering back with the password.

There are two modes in FTP: active, and passive. The mode determines the port used to transfer data. Data is transferred via the port 20, while in passive mode, a port higher than 1023 will be used.

There are two channels in an FTP connection: a channel to send commands <small>(also called control)</small>, and one to transfer data. There is also a transfer mode, which could be ASCII, or binary (default). You can enter `type [a|i]` or `ascii|binary` to switch.
</details>
</div><div>

Once in an FTP shell, here some [commands](https://www.rfc-editor.org/rfc/rfc959) you may use:

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

➡️ If `put/get` keep failing, try moving to the target folder first.
</div></div>

<hr class="sep-both">

## FTP vulnerabilities ☠️

[![kenobi](../../../cybersecurity/_badges/thm-p/kenobi.svg)](https://tryhackme.com/room/kenobi)
[![startup](../../../cybersecurity/_badges/thm-p/startup.svg)](https://tryhackme.com/room/startup)
[![cowboyhacker](../../../cybersecurity/_badges/thm-p/cowboyhacker.svg)](https://tryhackme.com/room/cowboyhacker)

<div class="row row-cols-md-2"><div>

FTP may be used by hackers to find interesting files.

* Anonymous users may have been enabled. Try a blank password if prompted. <small>(access to sensitive files, incorrect upload permissions...)</small>

```ps
$ ftp anonymous@IP
```
</div><div>

* The password may be weak and vulnerable to [brute force](/cybersecurity/red-team/s3.exploitation/index.md#password-cracking-).

* **ProFTPD 1.3.5**: There was a failure that allowed users to move files from a non-mounted path to the mounted path. You could steal an id_rsa for instance.

</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* `ftp -p` (passive mode, may bypass some firewall)
</div><div>
</div></div>