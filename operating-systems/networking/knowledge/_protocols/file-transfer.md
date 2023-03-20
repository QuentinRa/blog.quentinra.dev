# File transfer

[Go back](../index.md)

<hr class="sep-both">

## File Transfer Protocol (FTP)

<div class="row row-cols-md-2"><div>

File Transfer Protocol (FTP) is a widely used protocol to transfer files. It's mostly used externally, unlike Samba or NFS.

🐊️ **Port**: 21 (TCP)

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

## SSH File Transfer Protocol (SFTP)

<div class="row row-cols-md-2"><div>

SSH File Transfer Protocol (SFTP) is an implementation of FTP based on SSH. It has a wider range of commands, but may be slower than SCP.

🐊️ **Port**: 22 (TCP)

```ps
$ sftp user@IP
```
</div><div>
</div></div>

<hr class="sep-both">

## Secure Copy Protocol (SCP)

<div class="row row-cols-md-2"><div>

Secure copy protocol (SCP) is an implementation of FTP based on SSH.

🐊️ **Port**: 22 (TCP)

```ps
# upload
$ scp file_to_upload user@IP:remote/path/
# download
$ scp user@IP:remote/path/ local_path_to_dest
```

➡️ Use `scp -r` to download/upload a folder with all its content.
</div><div>
</div></div>