# Nessus vulnerability scanner

[![rpnessusredux](../../_badges/thm/rpnessusredux.svg)](https://tryhackme.com/room/rpnessusredux)

<div class="row row-cols-md-2"><div>

**Nessus vulnerability scanner** is a tool to find, and report vulnerabilities.

* [Download Nessus](https://www.tenable.com/downloads/nessus)

```bash
$ sudo dpkg -i  Nessus-10.3.0-ubuntu1404_amd64.deb
$ sudo systemctl start nessusd.service
```

* Open `https://localhost:8834/`
* [You will need an activation code](https://www.tenable.com/products/nessus/nessus-essentials)
</div><div>

Once you are logged on the website, you can create new scans.

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

It's important to note that Nessus is generating a lot of traffic, and may not find every vulnerability, so you shouldn't grow dependant of it, and do things "manually" when you can.

</div></div>

> **Note**: if you have a scope/knowledge of specific ports/... to scan, you can define a policy in the Policy tab.<br>