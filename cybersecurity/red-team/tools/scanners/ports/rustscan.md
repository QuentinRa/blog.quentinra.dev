# Rustscan

<div class="row row-cols-md-2"><div>

[RustScan](https://github.com/RustScan/RustScan) (9.5k ⭐) is a very fast and noisy port scanner designed for CTFs. You can scan all 65k ports in a few seconds.

It's not installed by default on Kali. First, search for the latest `.deb` that you can find on their [release page](https://github.com/RustScan/RustScan/releases).

```bash
# there wasn't the .deb for the latest
$ wget https://github.com/RustScan/RustScan/releases/download/2.0.1/rustscan_2.0.1_amd64.deb
$ sudo dpkg -i rustscan_2.0.1_amd64.deb
```
</div><div class="align-self-center">

Basic usage

```bash
$ rustscan -a IP --ulimit 10000
```

```bash
$ rustscan -a IP -p 21
$ rustscan -a IP -p 21,22,80
$ rustscan -a IP --range 1-1023
# add "--" before nmap options
$ rustscan -a IP -- -sC -A
$ rustscan -a IP -- -sV
```
</div></div>