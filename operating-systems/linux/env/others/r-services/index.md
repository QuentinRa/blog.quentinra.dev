# R-Services

[![footprinting](../../../../../cybersecurity/_badges/htb/footprinting.svg)](https://academy.hackthebox.com/course/preview/footprinting)

<div class="row row-cols-lg-2"><div>

R-Services or [R-Commands](https://en.wikipedia.org/wiki/Berkeley_r-commands) are a suite of networking tools to execute commands on remote systems. As they use cleartext and unsecure access controls, they were replaced by more secure protocols. 🔒

* `rlogin`: remote login
* `rsh`: remote shell
* `rcp`: remote copy
* `rexec`: remote command execution
* `rwho`: information about logged users
* `ruptime`: uptime of a remote host
* `rusers`: list of logged users
* `rwall`: sends a message to all logged users
</div><div>

🐊️ **Ports**: 512, 513, and 514.

Random Commands

```ps
$ rlogin IP -l username
$ rusers -al IP
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* `/etc/hosts.equiv`
* `.rhosts` (`username IP\n+ IP`, `+`==anyone)
</div><div>
</div></div>