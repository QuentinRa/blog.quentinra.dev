# Tmux

<div class="row row-cols-lg-2"><div>

[Tmux](https://en.wikipedia.org/wiki/Tmux) is a terminal multiplexer. It is used to split a single terminal in multiple terminal sessions. For instance, if we are connected to a machine via SSH, instead of opening two terminals and connecting to SSH each, we could use tmux to split the current terminal in two.
</div><div>
</div></div>

<hr class="sep-both">

## Pentester Notes ☠️

[![linuxprivilegeescalation](../../../../../cybersecurity/_badges/htb/linuxprivilegeescalation.svg)](https://academy.hackthebox.com/course/preview/linux-privilege-escalation)

<div class="row row-cols-lg-2"><div>

Each time we use tmux, it creates a socket. We can connect back to this socket to reconnect to the tmux session.

By default, sessions are stored in `/tmp`. Users can define a custom socket. If the permissions are incorrectly set on it <small>(if they were edited)</small>, we may be able to exploit them.

```ps
$ sudo tmux -S /my/socket new -s session_name
$ sudo chown root:xxx /my/socket # misconfiguration ⚠️
$ tmux -S /my/socket             # if we are in 'xxx' => root
```
</div><div>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* Guake/iTerm2/Terminology/[tmux](https://www.youtube.com/watch?v=Lqehvpe_djs)/[terminator](https://github.com/gnome-terminator/terminator)/[tmux](https://www.youtube.com/watch?v=Lqehvpe_djs) + [cheatsheet](https://tmuxcheatsheet.com/)
</div><div>
</div></div>