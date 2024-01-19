# Restricted Shells

[![linuxprivilegeescalation](../../../_badges/htb/linuxprivilegeescalation.svg)](https://academy.hackthebox.com/course/preview/linux-privilege-escalation)
[![escaping_from_jails](../../../_badges/hacktricks/escaping_from_jails.svg)](https://book.hacktricks.xyz/linux-hardening/privilege-escalation/escaping-from-limited-bash#bash-jails)

<div class="row row-cols-lg-2"><div>

A restricted shell such as `rbash` is a shell that restrict the action of the user to a limited list of commands/arguments. For instance, for rBASH:

* we cannot use commands with pathnames containing a "/"
* we can use `help` to list available commands
* we cannot use `cd`
* more restrictions may be in place

To escape of restricted shells, we can try to use command substitution (ex: <code>ls \`pwd\`</code>), command chaining, or editing environment variables.
</div><div>

Common tricks:

* **List files**: `echo /*` and `echo /.*`
* **Read files**: `read f < /etc/passwd; echo $f`
</div></div>