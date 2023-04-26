# Remote Desktop Protocol (RDP)

<div class="row row-cols-md-2"><div>

Remote Desktop Protocol (RDP) is a protocol used to connect a desktop with a graphical interface to another computer over a network connection.

🐊️ **Port**: 3389 (TCP)

There is [rdesktop](https://github.com/rdesktop/rdesktop) (1.1k ⭐).

There is [FreeRDP](https://github.com/FreeRDP/FreeRDP) (7.5k ⭐), and there is a graphical version too [xfreerdp-gui](https://github.com/wyllianbs/xfreerdp-gui) (29 ⭐).

```ps
$ xfreerdp /u:x /p:y /v:IP
$ xfreerdp /dynamic-resolution +clipboard /cert:ignore /v:IP /u:x /p:y
```
</div><div>

There is [Remmina](https://github.com/FreeRDP/Remmina) (1.9k ⭐, `apt install remmina`) which has an easy-to-use graphical interface.

* `remmina`: start the graphical interface
  * Enter the IP of the target
  * Enter the credentials
  * Connect
* Then, I would advise toggling "dynamic resolution update" in the left menu, so that you have a bigger screen.
* In preferences, we should be able to select a keyboard mapping <nobr class="small text-muted">(⚠️ need check)</nobr>
* [You can scale the screen too](https://askubuntu.com/questions/1075098/remmina-scaling-options)
</div></div>

<hr class="sep-both">

## RDP vulnerabilities ☠️

<div class="row row-cols-md-2"><div>

* [BlueKeep Vulnerability](https://en.wikipedia.org/wiki/BlueKeep) (2019)
* rlogin
</div><div>
</div></div>