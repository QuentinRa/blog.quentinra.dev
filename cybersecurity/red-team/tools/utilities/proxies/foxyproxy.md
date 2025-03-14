# FoxyProxy

[![burpsuitebasics](../../../../_badges/thm/burpsuitebasics.svg)](https://tryhackme.com/room/burpsuitebasics)
[![usingwebproxies](../../../../_badges/htb/usingwebproxies.svg)](https://academy.hackthebox.com/course/preview/using-web-proxies)

<div class="row row-cols-lg-2"><div>

[FoxyProxy](https://github.com/foxyproxy/browser-extension) <small>(0.3k ⭐)</small> is an open-source browser extension that can be used to easily switch between multiple proxie configurations, for instance, to redirect HTTP traffic to [Burp Suite](burp/index.md) or OWASP Zap.

To add a configuration, click on the extension, then 'options'. navigate to the tab 'proxies' and click on 'add'.

Once the configuration is created, when clicking on the extension icon, you can swap between them.
</div><div>

Example configuration:

* `Title`: Burp Suite
* `Type`: HTTP
* `Hostname`: localhost
* `Port`: 8080

⚠️ Don't forget to turn foxy proxy off when the proxy is down.
</div></div>