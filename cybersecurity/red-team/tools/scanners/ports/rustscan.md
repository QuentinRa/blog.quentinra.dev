# Rustscan

<div class="row row-cols-lg-2"><div>

[RustScan](https://github.com/RustScan/RustScan) <small>(15.9k ⭐)</small> is a very fast and noisy port scanner designed for CTFs. You can scan all 65k ports in a few seconds.

It's not installed by default on Kali. First, search for the latest `.deb` that you can find on their [release page](https://github.com/RustScan/RustScan/releases).

```shell!
$ # there wasn't the .deb for the latest
$ wget "https://github.com/RustScan/RustScan/releases/download/2.3.0/rustscan_2.3.0_amd64.deb" -O /tmp/rustscan.deb
$ sudo dpkg -i /tmp/rustscan.deb
```
</div><div class="align-self-center">

Basic usage

```ps
$ rustscan -a IP -p 21
$ rustscan -a IP -p 21,22,80
$ rustscan -a IP --range 1-1023
# add "--" before nmap options
$ rustscan -a IP -- -sC -A
$ rustscan -a IP -- -sV
```

Using `--ulimit` make it faster, but you will miss some ports.
</div></div>