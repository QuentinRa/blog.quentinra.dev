# Protocols & services

Any knowledge related to protocols, and services, such as ftp, ssh, sftp, scp, telnet, smtp...

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

<hr class="sep-both">

## Remote Desktop Protocol (RDP) - 3389 (tcp)

<div class="row row-cols-md-2"><div>

A protocol used to connect a desktop with a graphical interface to another computer over a network connection.

There is [rdesktop](https://github.com/rdesktop/rdesktop) (1.1k ⭐).

There is [FreeRDP](https://github.com/FreeRDP/FreeRDP) (7.5k ⭐), and there is a graphical version too [xfreerdp-gui](https://github.com/wyllianbs/xfreerdp-gui) (29 ⭐).

```bash
$ xfreedrp /u:x /p:y /v:ip
```
</div><div>

There is [Remmina](https://github.com/FreeRDP/Remmina) (1.9k ⭐, `apt install remmina`) which is an easy-to-use graphical.

* `remmina`: start the graphical interface
    * Enter the IP of the target
    * Enter the credentials
    * Connect
* Then, I would advise to toggle "dynamic resolution update" in the left menu, so that you have a bigger screen.
</div></div>