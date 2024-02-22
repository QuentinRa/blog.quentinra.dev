# Medusa

[![attacking_common_services](../../../../_badges/htb/attacking_common_services.svg)](https://academy.hackthebox.com/course/preview/attacking-common-services)

<div class="row row-cols-lg-2"><div>

[Medusa](https://github.com/jmk-foofus/medusa) <small>(0.6k ⭐)</small> is an open-source tool used to brute force network services passwords such as [FTP](/operating-systems/networking/protocols/ftp.md).

```ps
$ sudo apt install medusa
$ medusa -u username -P passwords.lst -h IP -M ftp
$ medusa -U users.lst -P passwords.lst -h IP -M ftp
$ medusa [...] -n port # port to use
$ medusa [...] -t 4    # number of threads
$ medusa [...] -L      # test all username for each password
```
</div><div>
</div></div>