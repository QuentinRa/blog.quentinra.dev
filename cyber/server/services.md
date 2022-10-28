# Services

<hr class="sl">

## 3389 (tcp) - Remote Desktop Protocol

*If there is an open port, such as `3389/tcp open  ms-wbt-server`, you can try to connect to the target (if you have credentials).*

<div class="row row-cols-md-2"><div>

[Remmina](https://github.com/FreeRDP/Remmina) (1.8k ⭐) that can be installed with `apt install remmina` is an easy-to-use tool allowing you to open access a remote desktop.

* `remmina`: start the graphical interface
    * Enter the IP of the target
    * Enter the credentials
    * Connect
* Then, I would advise to toggle "dynamic resolution update" in the left menu, so that you have a bigger screen.
</div><div>

There is also [rdesktop](https://github.com/rdesktop/rdesktop) (1.1k ⭐).
</div></div>

<hr class="sr">

## 21 (tcp) - File Transfer protocol

<div class="row row-cols-md-2"><div>

FTP (File Transfer protocol) is a protocol used to transfer (upload, download) files from one computer to another. Use port **21** by default <small>(22 for SFTP=Secure FTP)</small>, while data is transferred via port 20.

```bash
$ ftp ip
ftp> pwd # path to current folder
ftp> ls folder # list files
ftp> cd folder # move to folder
ftp> put /local/path /remote/dest # upload
ftp> get /remote/path /local/dest # download
ftp> less file # read file
ftp> exit # exit
ftp> bye # same
```
</div><div>

* Anonymous user may have been enabled

```bash
$ ftp anonymous@ip
```
</div></div>