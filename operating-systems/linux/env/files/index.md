# Files and Filesystem

<div class="row row-cols-md-2"><div>

...
</div><div>

The root of every folder is `/`.

Any file starting with <code>.</code> (dot) such as <code>.config</code> are **hidden folders/files** 🤐.
</div></div>

<hr class="sep-both">

## Common folders

[![linuxfundamentalspart2](../../../../cybersecurity/_badges/thm/linuxfundamentalspart2.svg)](https://tryhackme.com/room/linuxfundamentalspart2)

<div class="row row-cols-md-2"><div>

#### User  Home (<code>domicile</code>) 🏡

Each user has its own folder, with their documents...

* The home of `username` is commonly at `/home/username/`
* See the environment variable `$HOME`.
* See the file `/etc/passwd` for the path of each user home
* The home folder of `root` is usually at `/root`

<br>

#### Binaries ⚒️

Folders used to store commands... such as `/bin/`, while `/usr/bin/` and `/usr/local/bin/` are also commonly used.

</div><div>

#### System folders 🏭

System configurations are commonly stored in `/etc/`. System logs and application logs are usually stored in `/var/log/`.

<br>

#### Other folders 🧑‍💻

* `/mnt`: mounted device/hard drives <small>(D:, USB...)</small>
* `/tmp`: a trash folder cleaned on reboot
</div></div>

<hr class="sep-both">

## Common files

[![linuxfundamentalspart2](../../../../cybersecurity/_badges/thm/linuxfundamentalspart2.svg)](https://tryhackme.com/room/linuxfundamentalspart2)

<div class="row row-cols-md-2"><div>

#### Empty file 🧭

The file `/dev/null` is a sort of "trash file" in which everything you write inside is deleted. It's useful when redirecting error output.

<br>

#### Configuration files 🏭

* `/etc/passwd`: username, their UID, their GID, their home folder
* `/etc/shadow` <small>(root)</small>: users and their hashed password
* `/etc/group`: list of groups and their GID
* `/etc/hosts` <small>(root)</small>: map a domain to an IP, can be edited manually
</div><div>

#### /etc/sudoers

The file `/etc/sudoers` is a system configuration file defining which commands a user can run as another user, usually root.

For instance, to run any command as `root` without a password:

```ps
username ALL=(ALL) NOPASSWD:ALL 
```

Here, `tar` can be run as `user2` without password:

```ps
username ALL=(user2) NOPASSWD:/bin/tar
```
</div></div>