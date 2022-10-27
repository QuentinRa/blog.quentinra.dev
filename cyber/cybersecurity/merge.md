# Discovery of hidden entrypoint

![Level: Novice](https://img.shields.io/badge/level-Novice-7cfc00)

You may want to find what services a server is providing, such as webserver, telnet, SSH, FTP, and so on, as you may attack one of them. Each service is associated with a port on the machine

* **HTTP**: 80
* **FTP**: 21 (remote file system)
* **SSH / SFTP**: 22 (remote shell)
* **SMTP**: 25 (mails)
* **HTTPS**: 443
* **Node**: usually 3000
* ...

There is a more complete [list of vulnerable ports here](). Usually, default port are changed, and sometimes they add a firewall (OVH firewall, [pfsense](https://www.pfsense.org/)... Allowing only some IP to use this port...), along with some tools ([Snort](https://www.snort.org/), [Suricata](https://suricata.io/)...) to detect tentative of mapping the ports of the server.

* <i class="bi bi-info-square" style="background:#7cfc00"></i> Use `nmap` to map the ports of the server

<hr class="sr">

## Discovery of hidden content

![Level: Novice-Intermediate](https://img.shields.io/badge/level-Novice%20Intermediate-ffd700)

* <i class="bi bi-info-square" style="background:#7cfc00"></i> There are cases when the request is in the URL, such as "/account/5123" or "/invoices?ref=365230". Every website should ensure that no unauthorized user can access private data.

BAC : Insecure Direct Object References (IDOR). Example is a server service resources, with a URL in which we can guess other files names.

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

![Level: Novice](https://img.shields.io/badge/level-Novice-7cfc00)

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

![Level: Intermediate](https://img.shields.io/badge/level-Advanced-fae7b5)

* [THM Kenobi](https://tryhackme.com/room/kenobi)

SMB (Windows), and NFS (Linux), are mostly used internally to share files, instead of FTP which is mostly used externally. There is a tool called [Samba](https://www.samba.org/) that is making both systems using SMB, and NFS working together. Every device (printer, computers...) of a company make be linked via a folder `share`.

```bash
$ smbclient //IP/share_name
# ls <folder>: list files of <folder>
# cd <folder>: move to <folder>
# put <src> <dest>: put <src> (local) to <dest> (server)
# get <src> <dest>: get <src> (server), and save it to <dest> (local)
# pwd: get the path of the working directory

# download every file of a share
$ smbget -R  smb://IP/share_name
```

* <i class="bi bi-info-square" style="background:#7cfc00"></i> Try connecting without password
* <i class="bi bi-info-square" style="background:#7cfc00"></i> Attempt to list shares using nmap `nmap -p 445 –script=smb-enum-shares.nse,smb-enum-users.nse ip`

"Samba is the standard Windows interoperability suite of programs for Linux and Unix. It allows end users to access and use files, printers and other commonly shared resources on a companies intranet or internet. It's often referred to as a network file system.

Samba is based on the common client/server protocol of Server Message Block (SMB). SMB is developed only for Windows, without Samba, other computer platforms would be isolated from Windows machines, even if they were part of the same network."

* Using nmap we can enumerate a machine for SMB shares:
  * port 445, and 139
  * `nmap -p 445 --script=smb-enum-shares.nse,smb-enum-users.nse <ip> -vv`
* `smbclient //<ip>/anonymous` login without password
* You may find useful information
* https://tryhackme.com/room/kenobi

<hr class="sep-both">

## SQL injections

![Level: Novice-Intermediate](https://img.shields.io/badge/level-Novice%20Intermediate-ffd700)

SQL injections means for someone to insert some SQL code inside a SQL query. For instance, if a user have a query taking a username, then the user may submit a SQL query rather than his username.

* <i class="bi bi-shield-check text-success"></i> Use prepared requests (or queries), they are ensuring that parameters of your queries are not interpreted as SQL code
* <i class="bi bi-shield-minus text-danger"></i> You can filter input, but you CAN'T rely on it, as you filter will _most likely_ be bypassed
* <i class="bi bi-shield-minus text-danger"></i> **YOU SHOULD NEVER TRUST DATA FROM THE USER** <small>(actually, don't trust anyone)</small>. SQL injections may be delayed. You may do protect your login queries, but if the username is some SQL code, then any other request using the username may interpret it, hence you should secure **every** request.

<details class="details-e">
<summary>Basics of SQL injection</summary>

Let's say someone submitted this request, trying to login without password to the account 'admin'.

```http request
POST /login.php username="admin' --"&password='nopassword'
```

And in the PHP code, we got a super-stupid-and-lazy-not-prepared SQL request like this <small>(assuming that the password is not encrypted in the Database)</small>.

```php
$sql = "Select * from users where user='$username' AND password='$password'";
```

Then, the SQL request will be as follow. This is because the user used a quote (`'`), which closed the input, allowing him to write his own code. As you should notice, the check for the password is bypassed, and the request will return the record for the user "admin".

```sql
Select * from users where user='admin' --' AND password='nopassword';
```
</details>

<table class="table table-bordered table-striped border-dark"><thead>
<tr><th>Name</th><th>Description</th></tr>
</thead><tbody>

<tr><td>Error-based</td><td>Use an error message when the query failed to adapt the payload, and get data from the database.
</td></tr>

<tr><td>Union-based</td><td>An attacker use something providing results to add records fetched illegally (ex: list of usernames/passwords/...).
</td></tr>

<tr><td>Boolean-based</td><td>This attack is used when there is no errors. An attacker will try to make a request that fail if a boolean expression is false. By doing so, if the service (ex: login) failed, the attacker can inter that is was because the boolean expression was false.
</td></tr>

<tr><td>Others</td><td>Time-based, Out-of-band-based, Voice-based, and Stacked queries-based.
</td></tr>

</tbody></table>


A hacker that detected a possible way to inject some SQL (delayed or not), in a POST or even a GET form, may use it to map, steal, and/or maybe destroy your database.

* <i class="bi bi-info-square" style="background:#7cfc00"></i> Be familiar with the [SQL Injection Payload List repository](https://github.com/payloadbox/sql-injection-payload-list)
* <i class="bi bi-info-square" style="background:#ffd700"></i> You can manually try to map the Database
* <i class="bi bi-info-square" style="background:#ffd700"></i> You can use **SQLMap** to map a Database

<details class="details-e">
<summary>Manually map the database</summary><br>

<details class="details-e">
<summary>Database, version, and user</summary>

You need to find the kind of database, the version, the username, the table and its columns, then steal everything.

* `SELECT @@version`: return the database version
* `SELECT database()`: return the name of the database
* `SELECT user()`: return the name of the database

Some boolean-based SQL injections:

* **For any text**: `' AND (ascii(substr((select database()),1,1))) = 115 --`: return true if the first character of the name of the database is "s" (ascii('s') is 115).
</details>

<details class="details-e">
<summary>Map columns</summary>

**Goal**: To guess the number of columns in the SELECT, which is useful later to use UNION, to fetch data from the database.

One way is using **ORDER BY**: the clause can take a column name that is inside the select, **but the clause can also take the index of the column in the select**. Try injecting `ORDER BY 1`, `ORDER BY 2`, etc., until the query fails.

Another way is using UNION. As you may know, UNION can only be used when the two queries have the same number of columns in the select. Hence, you can try `UNION Select NULL--`, `UNION SELECT NULL, NULL--`, etc., until the query fails.

</details>

<details class="details-e">
<summary>Fetch records</summary>

If you have a SQL injection possible in a page displaying every username given a country, with by the following SQL query

```php
$sql = "SELECT username FROM users WHERE country='$country'";
```

Then, using UNION, you could add another request which will append the results of the second request in the view of the first request <small>(**note**: UNION requires the same number of columns in every SELECT)</small>

```sql
-- inject $country with "' UNION SELECT TABLE_NAME FROM information_schema.TABLES"
SELECT username FROM users WHERE country=''
UNION
SELECT TABLE_NAME FROM information_schema.TABLES
```
</details>
</details>

<hr class="sep-both">

# Assembly

![Level: Intermediate](https://img.shields.io/badge/level-Advanced-fae7b5)

One level above binary (010010...), we have a language called assembly which is basically written in instructions specific to a set of machines (Intel, ARM...). You need to use the appropriate tool according to the kind of application.

* <i class="bi bi-info-square" style="background:#fae7b5"></i> Use `radare2` to convert a binary in an assembly
* <i class="bi bi-info-square" style="background:#fae7b5"></i> Use `ILSpy`/`dotPeek` ❤️ to decompile .NET applications

<hr class="sep-both">

## Domain Name Hijacking via Cache poisoning

<div class="row row-cols-md-2"><div>

This is a old attack that shouldn't be possible now. A hacker would usually try to make an authoritative server store a records which a legitimate domain names leading to a malicious server.

* Redirect to a malicious website <small>(ex: with a ton of ads, malware...)</small>
* Do a ManInTheMiddle attack, in which the attacker could receive the mails sent to another one, read/... them, and send them to the original legitimate receiver.
* Isolate someone to prevent this person to access a website/...

When a DNS server request a DNS record that wasn't cached, a request is made with **a query Id** (16 bits), awaiting the reply at a **port**, for the **queried domain**. The problem is that if a malicious DNS server managed to match these 3, and reply before the legitimate server, then it could match a malicious IP for the queried domain.

* Unless it was an old server increasing Ids by one, matching the query Id is quite hard
* And matching the right timing to send the request is also hard. One trick is making the request to a domain name that you could guess is not in the cache <small>(for instance, one of yours)</small>. As you know the TTL, you can guess when the next request will be sent.
</div><div>

**Dan Kaminsky**: this attack use the fact that inside the request, a field **Authority** might be filled with the nameserver/authoritative server that should be ask for matters related to this domain name. In the field **Additional**, the IPs of the nameserver are stored to avoid a loop in which the DNS will try to find the IP of the nameserver. In Dan Kaminsky attack, we are sending a malicious NS, that means that the DNS *may* ask us next time.

A way to patch this is for the DNS to have a good entropy when generating Ids. [See DNS Entropy](https://www.dns-oarc.net/oarc/services/dnsentropy).

This video is a bit long, but explain better [the Dan Kaminsky attack](https://www.youtube.com/watch?v=qftKfFVHVuY).
</div></div>

<hr class="sep-both">

### Steganography

Hide things in images: [Steganography](https://0xrick.github.io/lists/stego/).

<hr class="sep-both">

## Printers - IPP - (TCP/631)

https://tryhackme.com/room/printerhacking101

"The Internet Printing Protocol (IPP) - is a specialized Internet protocol for communication between client devices and printers. It allows clients to submit one or more print jobs to the printer or print server, and perform tasks such as querying the status of a printer, obtaining the status of print jobs, or canceling individual print jobs."

If open to the internet, everyone can print, or use it as a middleman for attacks.

https://www.variot.eu/

"An open IPP port can expose a lot of sensitive information such as printer name, location, model, firmware version, or even printer wifi SSID."

* https://github.com/RUB-NDS/PRET
* pip install colorama pysnmp

```bash
$ python pret.py
# look for printers
$ python pret.py file.lan ps # test language postscript
$ python pret.py <ip> pjl # Printer Job Language
$ python pret.py /dev/usb/lp0 pcl # Printer Command Language
```

http://hacking-printers.net/wiki/index.php/Printer_Security_Testing_Cheat_Sheet

PRET isn't going to work here as it is using port 9000 by default

* Brute force ssh password `nmap <MACHINE_IP> -p 22 --script ssh-brute --script-arg userdb=user.txt`
* `http://ip:631/printers/`

<hr class="sep-both">

## OWASP

* https://owasp.org/www-project-top-ten/
* Juiceshop
* https://cheatsheetseries.owasp.org/cheatsheets/File_Upload_Cheat_Sheet.html
* https://github.com/OWASP/wstg
* https://wiki.owasp.org/index.php/OWASP_Testing_Guide_v4_Table_of_Contents
* https://github.com/OWASP/CheatSheetSeries
* https://www.zaproxy.org/
* https://github.com/OWASP/Amass