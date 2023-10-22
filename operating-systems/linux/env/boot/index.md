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

```shell!
$ ls -la /etc/systemd/system/   # target + enabled services
$ ls -la /lib/systemd/system/   # services
```

<br>

#### systemctl command

The `systemctl` allows us to interact with the systemd daemon. Note that you can create all files manually without the `systemctl` command.

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

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* Control Groups (cgroups)
</div><div>
</div></div>