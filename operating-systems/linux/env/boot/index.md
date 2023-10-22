# Linux Boot Process

<div class="row row-cols-md-2"><div>

The boot process with the system's firmware initializing the hardware and loading the bootloader. 🧳

The bootloader will load the Linux Kernel. It's the menu we have to select which OS we are booting on. 🪧

The kernel will initialize some hardware components, mount the [filesystem](../files/index.md) and delegate the initialization process which will start processes and services until the system becomes fully operational. 🗃️

The initialisation process is commonly handled by **systemd**, which is a modern replacement for the traditional [init system](https://en.wikipedia.org/wiki/Init). 🪴
</div><div>

Some of the well-known ones are:

* **System firmwares** 🧳: `BIOS` or `UEFI`
* **Bootloaders** 🪧: `GRUB` or `U-Boot`
* **Initialization** 🪴: `systemd` or `launchd`
</div></div>

<hr class="sep-both">

## Systemd

<div class="row row-cols-md-2"><div>

Systemd is a system and service manager for Linux operating systems. It is responsible or starting, stopping, and managing system services.

<br>

#### systemctl command

The `systemctl` allows us to interact with the systemd process/daemon.

```shell!
$ systemctl status xxx    # status of the service
$ systemctl start xxx     # start a service
$ systemctl reload xxx    # reload the configuration
$ systemctl daemon-reload # reload systemd configuration
$ systemctl restart xxx   # stop+start a service
$ systemctl stop xxx      # stop a service
$ systemctl enable xxx    # enable a service at boot
$ systemctl enable --now xxx # enable it now
$ systemctl disable xxx   # disable a service at boot
$ systemctl link xxx      # create a link in systemd files
```

➡️ You can use `-f` to force an operation.
</div><div>

...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* Control Groups (cgroups)
* journalctl
</div><div>
</div></div>