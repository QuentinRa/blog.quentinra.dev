# Privilege Escalation

<div class="row row-cols-md-2 mt-4"><div>

There isn't much you can do as a regular user, so **Privilege Escalation** is the main goal. It refers to the process of obtaining super-administrator (a.k.a. root on Linux, Administrator on Windows) privileges, starting from a regular user. You can escalate **horizontally**/laterally (use another user) and **vertically** (get a higher level of privileges).

Once you are admin, you will be able to do things such as

* Stealing protected data
* Enabling Persistence
* ...

> [Privilege-Escalation](https://github.com/Ignitetechnologies/Privilege-Escalation) (2.6k ⭐) list a lot of CTF to practice.
</div><div>

**Find more info about the computer** 🧭️

* version
* services
* users
* ...

**Find useful data** 🪙

If you can, try to see the computer as its users do, because you may find some interesting stuff.

* Try to look for backups
* Try to look for emails/conversations
* Try to look at the browser history of the target
* Try to look at the command history of the target
* Try to look for passwords saved in notes

**Privilege Escalation** 💣

* After detecting the services, you may try to see if there are vulnerabilities, common misconfigurations, or exploits...
* If you found credentials, you may try to access other accounts that may provide even more information to escalate
* ...
</div></div>