# OWASP ZAProxy

<div class="row row-cols-lg-2"><div>

[OWASP ZAP](https://www.zaproxy.org/) (Zed Attack Proxy) or more commonly ZAProxy is an [open-source](https://github.com/zaproxy/zaproxy) <small>(11.6k ⭐)</small> web proxy that offers a robust and complete  alternative to [Burp Suite](../burp/index.md) while being free.

It's also written in Java and is community maintained.

You can [download it here](https://www.zaproxy.org/download/) or install it using:

```ps
$ sudo apt install zaproxy
$ zaproxy
```
</div><div>

There is an embedded pre-configured browser that can be opened using the "firefox" icon at the end of the toolbar.

Alternatively, we can use our browser and [Foxy Proxy](/cybersecurity/red-team/tools/utilities/proxies/foxyproxy.md) configured to point to `127.0.0.1:8080`.

📚 You can use a different port if you plan to use multiple proxies. Navigate to `Options > Network > Local Servers`.
</div></div>