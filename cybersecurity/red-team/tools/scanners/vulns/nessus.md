# Nessus vulnerability scanner

[![rpnessusredux](../../../../_badges/thm/rpnessusredux.svg)](https://tryhackme.com/room/rpnessusredux)
[![vulnerabilityassessment](../../../../_badges/htb/vulnerabilityassessment.svg)](https://academy.hackthebox.com/module/details/108)

<div class="row row-cols-md-2"><div>

Nessus vulnerability scanner is a tool to find, and report vulnerabilities.

* [Download Nessus](https://www.tenable.com/downloads/nessus)

```shell!
$ sudo dpkg -i Nessus-10.3.0-ubuntu1404_amd64.deb
$ sudo systemctl start nessusd.service
```

* Open `https://localhost:8834/`
* [You will need an activation code](https://www.tenable.com/products/nessus/nessus-essentials)
</div><div>

Once you are logged in to the website, you can create new scans.

* **Host Discovery**: find alive hosts
* **Basic network scan**: sort of nmap
* **Web application test**: see vulnerabilities in your web app

Most scans have the following options

* Set a target
* In Discovery, you can select a range of ports
* In Assessment, you can select the kind of scan
* In Advanced, you may go for a "low bandwidth scan"
* In the credential tabs, you can log in to an account.
* **Launch**: explore vulnerabilities to see results

It's important to note that Nessus is generating a lot of traffic, and may not find every vulnerability, so you shouldn't grow dependent on it, and do things "manually" when you can.

</div></div>

> **Note**: if you have a scope/knowledge of specific ports/... to scan, you can define a policy in the Policy tab.<br>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* Basic network scan: can brute force auth
* Scan policies are templates for scans
* Can create [plugins](https://en.wikipedia.org/wiki/Nessus_Attack_Scripting_Language) and rules (plugin configuration for target)
* Performance options for some networks
* Look for `[INFO]` to find information about the target
</div><div>
</div></div>