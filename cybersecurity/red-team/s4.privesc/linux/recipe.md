# Linux PrivEsc Compiled Recipe

**📚 This is a compilation of command to copy-paste to find an easy priv. esc. vector without using a script 📚**

<div class="row row-cols-lg-2"><div>

First, find who you are, and if you are in interesting groups:

```ps
$ id # sudo? docker? adm?
```

If you're in `sudo`, try running sudo without/with password.

```ps
$ sudo -l -n
```

Look for interesting files "relatively" to your current user:

```ps
$ find / -user $(whoami) -type f 2>/dev/null | grep -v /proc | grep -v /sys
$ find / -type f -writable 2>/dev/null | grep -v /proc | grep -v /sys
$ find /home/* -type f -name "*.txt" -o ! -name "*.*"
$ ls /opt # why not
$ find /opt/ \( -amin -5 -o -mmin -5 \) 2> /dev/null # recently modified/edited?
```

Look for suspicious permissions:

```ps
$ find / -perm -u=s -type f -ls 2>/dev/null
$ find / -perm -g=s -type f -ls 2>/dev/null
$ getcap -r / 2>/dev/null
```
</div><div>

Look for interesting <small>(internal or not)</small> network services:

```ps
$ netstat -antp | grep -i list
```

As a reminder, you may use tunneling tools to access internal local websites such as [chisel](/cybersecurity/red-team/tools/utilities/tunneling/chisel.md) or [ssh](/operating-systems/networking/protocols/ssh.md) to access them.

Finally, look for users and services in `/etc/passwd`. Also, go look in `/home` for user homes, and try to see if you can access them.

Remember to test for password reuse and [default credentials](/cybersecurity/red-team/_knowledge/topics/wordlists.md#accounts).

Try to run automated tools. They will return a large output, but the output if often cleaner than if when we ran commands manually.

* Interesting configuration files
* Interesting files that may contain a password
* Interesting sockets
* Interesting kernel exploits
* ...
</div></div>