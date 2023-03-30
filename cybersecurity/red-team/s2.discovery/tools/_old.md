# 🔎 Nmap in practice 🔎

<div class="row row-cols-md-2"><div>

<p class="mt-3"><b>Dig information</b></p>

* `-sV`: what are the services used by the open ports? What are their versions? <small>(ex: 80 $\to$ Apache x.xx.xx)</small>. May also guess the OS. You may set the intensity with `--version-intensity level` (from 0 to 9). There are shortcuts `--version-light` (2), and `--version-all` (9).
* `-sC`: execute default scripts <small>(find hostname, OS, computer name...)</small>
* `-O`: what's the operating system of the host, a bit unreliable
* `-A`: all the above, and some more
* The line `Service Info: Host: Os:` usually has some information.

```bash
$ nmap -sV scanme.nmap.org -vv
```
</div></div>