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

<hr class="sl">

## Investigation

<div class="row row-cols-md-2 mt-4"><div>

* Learn more about the company, the programming languages, and software that they use... 🧑‍💻

* Find your target, for instance, a subdomain owned by the company for another purpose, that is hosted on the network that their main website 🐟
</div><div>
</div></div>

<hr class="sr">

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

<hr class="sl">

## Exploitation

<div class="row row-cols-md-2 mt-4"><div>

* Try to find vulnerabilities in running services 🎯

* Try to bruteforce credentials on running services 🔏
</div><div>

* Try to exploit the website 🕵️
</div></div>

<hr class="sl">

## Privilege Escalation

*You can escalate horizontally (use another user) and vertically (get a higher level of privileges)*

<div class="row row-cols-md-2 mt-4"><div>

**Find more infos about the computer** 🧭️

If you can, try to see the computer as its users do, because you may find some interesting stuff.

**Get to root using privilege escalation** 😎

As you can't do much as a regular user, that's the main goal when getting inside.

</div><div>

**Fetch data** 🪙

* Try to look for backups
* Try to look for mails/conversations
* Try to look the browser history of the target
* Try to look the command history of the target
* Try to look for passwords saved in notes
</div></div>

<hr class="sr">

## Post-exploitation

<div class="row row-cols-md-2 mt-4"><div>

* Cleanup logs 🧹

* Mess with timestamp/... to complicate forensics 🌋

* Leave a backdoor 🚪

* Edit software configurations / users permissions 🧨

* Use this machine as a starting point. Scan the network to discover more vulnerable machines. 🔓
</div><div>

* Steal (more?) private information <small>(files, photos, emails, authentication tokens, source code...)</small> 💰

* defacing the public website / redirect to a malicious website 🙊
</div></div>