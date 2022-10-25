# H@cking process

*These are notes that I'm taking when doing CTFs, nothing much.*

<hr class="sl">

## Discovery

<div class="row row-cols-md-2 mt-4"><div>

* You can use `nmap` to
    * Find open ports
    * Find the services running on these ports, and maybe the OS (`-sV`)
    * Find the OS (`-O`)
    * Find the hostname / computer name, or some info that may be relevant (`-sC`)
    * Saving scans can be useful has they can be imported <small>(ex: in `metasploit`)</small>
    * Lunch at least a scan on all ports, not just the top ones.

> You may have to use `-Pn` on hosts not responding to ICMP requests, such as Windows servers by default.

* Look for vulnerabilities (using nmap, nessus)
* Try to find a CVE you could exploit using `metasploit`
</div><div>

* Try to look for usernames/passwords
* Maybe there is a service with a weak password...

<span></span>

* If there is a website
    * Try to look for a software, and its version (ex: wordpress)
    * Try to look for hidden directories/files (`gobuster`, `dirsearch`)
    * Try to look for a username, and maybe a password
</div></div>

<hr class="sr">

## Once on the host

<div class="row row-cols-md-2 mt-4"><div>

**Find more infos about the computer** 🗺️

* ...

</div><div>

**Fetch data** 😎

* Try to look for backups
* Try to look for mails/conversations
* Try to look the browser history of the target
* Try to look the command history of the target
</div></div>
