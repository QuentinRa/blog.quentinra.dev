# OWASP ZAProxy

[![usingwebproxies](../../../../../_badges/htb/usingwebproxies.svg)](https://academy.hackthebox.com/course/preview/linux-fundamentals)

<div class="row row-cols-lg-2"><div>

[OWASP ZAP](https://www.zaproxy.org/) (Zed Attack Proxy) or more commonly ZAProxy is an [open-source](https://github.com/zaproxy/zaproxy) <small>(11.6k ⭐)</small> web proxy that offers a robust and complete  alternative to [Burp Suite](../burp/index.md) while being free.

You can [download it here](https://www.zaproxy.org/download/) or install it using:

```ps
$ sudo apt install zaproxy
$ zaproxy
```
</div><div>

There is an embedded pre-configured browser that can be opened using the "firefox" icon at the near end of the icon bar.

Alternatively, we can use our browser and [Foxy Proxy](/cybersecurity/red-team/tools/utilities/proxies/foxyproxy.md) configured to point to `127.0.0.1:8080`. You will need to add Burp Certificate to your browser. Navigate to `https://zap/` or to `Options > Network`, and download and add the certificate to your browser.

📚 You can use a different port if you plan to use multiple proxies. Navigate to `Options > Network > Local Servers`.
</div></div>

<hr class="sep-both">

## ZAProxy Basics

<div class="row row-cols-lg-2"><div>

By default, ZAP is catching every request by doesn't intercept them. Additionally, the HUD is enabled by default meaning:

* Requests are internally upgraded to HTTPS
* An interface (HUB) is injected into the page with tools and insight. The left column is mostly for tools related to the current page while the right column is mostly for tools related to the site.

<div class="text-center">

![ZAP HUD LEFT TOOLS](_images/left_column.png)
![ZAP HUD RIGHT TOOLS](_images/right_column.png)
</div>
</div><div>

The in-browser HUB can be enabled by toggling the 'map' button. There is a tutorial with a few steps to get accustomed to the HUD.

<div class="text-center">

![ZAP HUD](_images/hud.png)
</div>

To intercept a request, we must first click on the green button.

<div class="text-center">

![ZAP Breakpoint](_images/break.png)
</div>

The first button will send the request and catch the response. The second button will send the request and won't catch the response.
</div></div>