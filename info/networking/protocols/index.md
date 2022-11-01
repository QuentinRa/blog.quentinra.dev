# Protocols & services

<hr class="sep-both">

## Open a shell on a remote machine

<div class="row row-cols-md-2 mt-3"><div class="border-end border-dark">

### 🔓 Telnet - 23 (tcp)

No encryption, be it the credentials or the data exchanged.

...
</div><div class="border-st art border-dark ps-4">

### 🔒 SSH - 22 (tcp)

```bash
$ ssh login@ip
$ ssh login@ip -u port
```
</div></div>

<hr class="sep-both">

## Transfer files to/from a remote machine

<div class="row row-cols-md-2 mt-3"><div class="border-end border-dark">

### 🔓 ftp - 21 (tcp)

No encryption, be it the credentials or the data exchanged.

```bash
$ ftp ip
$ ftp login@ip
ftp> commands
```

Once in a FTP shell, you may use the commands defined in the [RFC](https://www.rfc-editor.org/rfc/rfc959).



</div><div class="border-st art border-dark ps-4">

### 🔒 scp/sftp - 22 (tcp)

Secure version of FTP built over SSH.

```bash
# upload
$ scp file_to_upload user@ip:remote/path/
# download
$ scp user@ip:remote/path/ local_path_to_dest
```

> Use `scp -r` to download/upload a folder will all its content.
</div></div>