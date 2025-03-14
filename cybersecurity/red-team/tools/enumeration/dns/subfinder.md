# subfinder

<div class="row row-cols-lg-2"><div>

[subfinder](https://github.com/projectdiscovery/subfinder) <small>(11.3k ⭐)</small> is a tool that may be used to passively find subdomains. It's written in Go.

```ps
$ sudo apt install -y subfinder
$ subfinder -d example.com
```
</div><div>

A few of the free APIs used by `subfinder`:

* `https://api.hackertarget.com/hostsearch/?q={domain}`
* `https://crt.sh/?q={domain}&output=json`
* `https://leakix.net/domain/{domain}`
* `https://api.subdomain.center/?domain={domain}`
* `https://certificatedetails.com/{domain}`
* `https://otx.alienvault.com/api/v1/indicators/domain/{domain}/passive_dns`
* ... and a few others that are sometimes unreliable
</div></div>