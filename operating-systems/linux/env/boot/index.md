# Linux Boot Process

<div class="row row-cols-lg-2"><div>

The boot process with the system's firmware initializes the hardware and loads the bootloader. 🧳

The bootloader will load the Linux Kernel. It's the menu we have to select which OS we are booting on. 🪧

The kernel will initialize some hardware components, mount the [filesystem](../files/index.md) and delegate the initialization process which will start processes and services until the system becomes fully operational. 🗃️

The initialization process is commonly handled by **systemd** daemon, which is a modern replacement for the traditional [init system](https://en.wikipedia.org/wiki/Init). This [daemon process](../process/index.md) is the parent of every process and has the PID 1. 🪴
</div><div>

Some of the well-known ones are:

* **System firmware** 🧳: `BIOS` or `UEFI`
* **Bootloaders** 🪧: `GRUB` or `U-Boot`
* **Initialization** 🪴: `systemd` or `launchd`
</div></div>

<hr class="sep-both">

## Systemd

<div class="row row-cols-lg-2"><div>

Systemd is a system and service manager for Linux operating systems. It is responsible for starting, stopping, and managing system services.

```shell!
$ ls -la /etc/systemd/system/   # target + enabled services
$ ls -la /lib/systemd/system/   # services
```

<br>

#### systemctl command

The `systemctl` allows us to interact with the systemd daemon. Note that you can create all files manually without the `systemctl` command.

```shell!
$ systemctl list-units --type=service # list all services
$ systemctl show xxx      # show information, use -p to filter
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

<br>

#### journalctl command

We can use `journalctl` to access the system logs.

```shell!
$ journalctl            # all logs
$ journalctl -b         # since last boot
$ journalctl -f         # real-time
$ journalctl -u xxx     # for a specific service
```
</div><div>

#### Systemd Targets

Systemd has a concept of targets to group services. The goal of the initialization often is to reach the `multi-user.target` which means the user can interact with the system and most services are active.

```shell!
$ ls /lib/systemd/system/*.target
$ cat my_target.target
[Unit]
Description=Some Description
Requires=multi-user.target
Conflicts=rescue.service rescue.target
After=multi-user.target rescue.service rescue.target
AllowIsolate=yes
```

➡️ See also: [How to create a systemd target?](https://unix.stackexchange.com/questions/301987/how-to-create-a-systemd-target)

<br>

#### Systemd service

Services support a lot of options, especially when we need to define dependencies between services or targets.

```shell!
$ ls /lib/systemd/system/*.service
$ cat my_service.service
[Service]
Type=oneshot
ExecStart=/bin/echo "Hello, World!"

[Install]
WantedBy=my_target.target
```

➡️ See also: `WorkingDirectory`, `Restart`, `RestartSec`, `StandardOutput`, `StandardError`, `SyslogIdentifier`, `Environment`, `User`, etc.
</div></div>

<hr class="sep-both">

## Grub

[![oh_my_grub](../../../../cybersecurity/_badges/rootme/forensic/oh_my_grub.svg)](https://www.root-me.org/en/Challenges/Forensic/Oh-My-Grub)

<div class="row row-cols-lg-2"><div>

GRUB (GRand Unified Bootloader) is a widely used bootloader on Linux. It allow users to select which operating system or kernel to boot. It automatically boots using the first one after 5 seconds.

📚 It worth noting that a file system is just a file. If we have access to an image such as a `.vmdk`, we can read its content without booting it.
</div><div>

If the GRUB configuration is not password protected and insecurely configured, we may be able to edit it during boot ⚠️.

* Press <kbd>Esc</kbd> to cancel the automatic selection
* Press <kbd>E</kbd> to edit GRUB configuration
* Look for a line `linux [...]`
* Edit it to your liking

You may remove `quiet` and add `init=/bin/bash` to start the system with a bash as root with no password.

* Press <kbd>CTRL+X</kbd> or <kbd>F10</kbd>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* Systemd Timers: using systemd for task scheduling. `xxx.timer` files.
</div><div>
</div></div>