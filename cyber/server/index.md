# Server Security

...

<hr class="sl">

## Discovery of hidden entrypoint

![Level: Novice](https://img.shields.io/badge/level-Novice-7cfc00)

You may want to find what services a server is providing, such as webserver, telnet, SSH, FTP, and so on, as you may attack one of them. Each service is associated with a port on the machine

* **HTTP**: 80
* **FTP**: 21 (remote file system)
* **SSH / SFTP**: 22 (remote shell)
* **SMTP**: 25 (mails)
* **HTTPS**: 443
* **Node**: usually 3000

There is a more complete [list of vulnerable ports here](). Usually, default port are changed, and sometimes they add a firewall (OVH firewall, [pfsense](https://www.pfsense.org/)... Allowing only some IP to use this port...), along with some tools ([Snort](https://www.snort.org/), [Suricata](https://suricata.io/)...) to detect tentative of mapping the ports of the server.

* <i class="bi bi-info-square" style="background:#7cfc00"></i> Use nmap to map the ports of the server

<hr class="sr">

## Discovery of hidden content

![Level: Novice-Intermediate](https://img.shields.io/badge/level-Novice%20Intermediate-ffd700)

* <i class="bi bi-info-square" style="background:#7cfc00"></i> There are cases when the request is in the URL, such as "/account/5123" or "/invoices?ref=365230". Every website should ensure that no unauthorized user can access private data.
* <i class="bi bi-info-square" style="background:#ffd700"></i> use `wfuzz` (or any similar tool) to automate the process above
* <i class="bi bi-info-square" style="background:#ffd700"></i> use `Gobuster` (or any similar tool) with a list of directories (see bruteforce) to search for hidden directories

<hr class="sl">

## File upload

![Level: Novice-Intermediate](https://img.shields.io/badge/level-Novice%20Intermediate-ffd700)

A user may upload a file on a server such as an avatar. You must prevent users from uploading malicious files (ex : scripts), AND prevent users from accessing content belonging to other users (if they shouldn't).

* <i class="bi bi-info-square" style="background:#7cfc00"></i> Secure filters for uploaded files
  * ❌ DO NOT use some stupid filter allowing "xxx.png.php"
  * ❌ DO NOT use /upload /images /media /resources /tmp for user (non-public) files, and better, do not allow access to non-public files via URL <small>(or at least, use a "deny all, allow xxx" kind of .htaccess)</small>. Usually, instead of matching a folder (ex: "www") with the server root <small>(ex: "localhost/")</small>, we are matching it with a sub-folder <small>(ex: www/public)</small>, so that we can use a folder such as "www/uploads" not available via URL <small>(you can't do "localhost/../uploads" in a URL)</small>.
  * ❌ DO NOT trust "content-type"
  * ❌ USE secure functions/ways to get the name of the uploaded file. Hackers can try to bypass them, like by using ASCII characters, or stuff like that.

If an attacker manage to upload a PHP script on the server, they will most likely try to do **reverse engineering**, meaning using a command such as `sudo nc -lvnp 443`, and accessing a remote shell on your server <small>(443 = HTTPS, so you go "unnoticed")</small>.

<hr class="sr">

## Transfer files using FTP (21)

FTP (File Transfer protocol) is a protocol used to transfer (upload, download) files from one computer to another. The protocol use **port 21** by default <small>(22 for SFTP=Secure FTP)</small>, while data is transferred via port 20.

```bash
$ ftp <ip>
# ls <folder>: list files of <folder>
# cd <folder>: move to <folder>
# put <src> <dest>: put <src> (local) to <dest> (server)
# get <src> <dest>: get <src> (server), and save it to <dest> (local)
```

* <i class="bi bi-info-square" style="background:#7cfc00"></i> There is a user: `anonymous/no password`, that usually is disabled, or enabled with limited privileges. If a user anonymous can upload script, they will be upload with unrestrained privileges, allowing anyone executing the script to have fun to their heart's content.

<hr class="sl">

  ## Transfer files using SMB/NFS

SMB (Windows), and NFS (Linux), are mostly used internally to share files, instead of FTP which is mostly used externally.