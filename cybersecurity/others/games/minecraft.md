# Minecraft (pentesting)

[![blocky](../../_badges/htb-p/blocky.svg)](https://app.hackthebox.com/machines/Blocky)

<div class="row row-cols-lg-2"><div>

Minecraft is a game developed by Mojang Studios in the Java programming language. It's possible for users to configure a community server to host a minecraft server.

* **Ports** 🐲: 25565 (TCP/UDP)
* [wodxgod checklist](https://github.com/wodxgod/Griefing-Methods) <small>(0.2k ⭐, 👻)</small>
* [b3pwn3d checklist](https://github.com/b3pwn3d/Minecraft-Griefing-Methods) <small>(0.01k ⭐, 👻)</small>
</div><div>

* [MCPTool](https://github.com/wrrulos/MCPTool) <small>(0.2k ⭐)</small>. It has a HUGE list of dependencies and doesn't work for internal minecraft servers <small>(e.g., during CTFs)</small>.

```shell!
$ git clone https://github.com/wrrulos/MCPTool.git
$ chmod +x install.sh
$ ./install.sh
$ python3 main.py
```
</div></div>