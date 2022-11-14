# H@cking process

<div class="row row-cols-md-2"><div>

The Cyber Kill Chain model identifies 7 steps in the hacking process

1. Reconnaissance: investigate the target (passive, and active recon)
2. Weaponization: create/prepare an exploit
3. Delivery: deliver your exploit
4. Exploitation: make the exploit used
5. Installation: install a malware
6. Command&Control: get a remote shell on the victim
7. Actions on objective: accomplish the goal

> See: [Cyber Kill Chain](https://www.lockheedmartin.com/en-us/capabilities/cyber/cyber-kill-chain.html) and [Unified Kill Chain](https://www.unifiedkillchain.com/).
</div><div>

For a penetration tester, it's more something like that

* **Investigation** (passive): information gathering
* **Discovery** (active): enumerate/scan the target to find running applications, and services
* **Exploitation**: find a way to get in, get a **foothold**
* **Privilege Escalation**: try to get root/administrator (horizontal/vertical escalation)
* **Post-exploitation**: accomplish the goal, hide your traces...

</div></div>

<hr class="sep-both">

## Investigation

<div class="row row-cols-md-2 mt-4"><div>

* Learn more about the company, the programming languages, and software that they use... 🧑‍💻

* Find your candidate targets, for instance, a subdomain owned by the company for another purpose, that is hosted on the network that their main website, and may be vulnerable 🐟

* Find employees, their emails, their social accounts... Try to find if some of their password leaked, and as password tend to be reused, you may access other accounts.
</div><div>

For instance, if they have many customers, it highly likely that they have a way to provide support for them, which may be an attack vector...

If they are looking for developers that are proficient in Node.js, it's likely that they are either using Node.js, were using Node.js, or are planning to use Node.js.
</div></div>

<hr class="sep-both">

## Discovery

<div class="row row-cols-md-2 mt-4"><div>

* Find running services, their version... 🧭

* Find the running OS 🖥️

</div><div>

* If there is a website, check the web server section 🗺️.
  * Look for a Framework (if any)
  * Try to do **forced browsing**
  * Try to find **logic flaws**
  * ...
</div></div>