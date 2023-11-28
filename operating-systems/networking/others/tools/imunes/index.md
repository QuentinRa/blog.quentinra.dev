# Imunes

<div class="row row-cols-lg-2"><div>

[imunes](http://imunes.net/) is a free open-source network emulator. You can create and configure multiple network devices a.k.a. nodes

* 🤝 switches
* ⚓ routers
* 💻 computers/hosts
* ...

You can define how each device work, such as which packets are allowed/blocked using rules... You can then try to communicate to see how the communication take place given your configuration.
</div><div>

Start an imunes session.

```bash
$ sudo imunes &
```

You may have multiple sessions.

```bash
$ imunes image -l # list
$ imunes -b -e <id> # kill
```

➡️ Alternatives: GNS3, EVE-NG...
</div></div>

<hr class="sep-both">

## Notes 📝

<div class="row row-cols-lg-2"><div>

Using the GUI:

* <kbd>experiment | execute</kbd>: run simulation
* <kbd>experiment | terminate</kbd>: terminate simulation
* <kbd>double-click on a host</kbd>: open a terminal on the host
* <kbd>right-click on a node | configure</kbd>: setup rules <small>(routing, ARP)</small>
    * enable "custom startup config"
    * enable "editor | create | fill default"
    * then use your head

</div><div>

You can run a command on a machine from the terminal with

```bash
$ sudo himage <hostname>@<id> <command>
```
</div></div>