# Crowbar

<div class="row row-cols-lg-2"><div>

[Crowbar](https://github.com/galkan/crowbar) <small>(1.4k ⭐, 2020 🪦)</small> is an open-source tool mainly used to brute force network services passwords such as [RDP](/operating-systems/networking/protocols/rdp.md).

While this tool is not maintained anymore, it's faster than alternative tools such as hydra when we need to brute force RDP during a CTF.

```shell!
$ sudo apt install crowbar
$ crowbar -b rdp -s IP/32 -u username -C password.list -v -n 64
$ crowbar -b rdp -s IP/32 -U users.lst -C password.list -v -n 64
$ cat crowbar.out # displays valid credentials found
```
</div><div>

I would not recommend using this tool ⚠️

* There is no option to exit when a valid pair of credential is found. If you enabled the verbose mode, you may miss a result and have to wait until the scan ends.

* This tool is more memory-hungry than alternative tools such as hydra with the same number of threads.
</div></div>