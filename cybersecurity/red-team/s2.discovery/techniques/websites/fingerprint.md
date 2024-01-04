# Website Fingerprint

<div class="row row-cols-lg-2"><div>

...
</div><div>

...
</div></div>

<hr class="sep-both">

## Analyze Web Requests

[![walkinganapplication](../../../../_badges/thm/walkinganapplication.svg)](https://tryhackme.com/room/walkinganapplication)
[![httpindetail](../../../../_badges/thm/httpindetail.svg)](https://tryhackme.com/room/httpindetail)
[![contentdiscovery](../../../../_badges/thm/contentdiscovery.svg)](https://tryhackme.com/room/contentdiscovery)
[![agentsudoctf](../../../../_badges/thm-p/agentsudoctf.svg)](https://tryhackme.com/room/agentsudoctf)
[![agentt](../../../../_badges/thm-p/agentt.svg)](https://tryhackme.com/room/agentt)

<div class="row row-cols-lg-2"><div>

You can do it from the command line, from your web proxy if you use one, or from the network tab of the devtools console. 

The network tab is unreliable as requests are deleted when the page is reloaded, or some requests might not be exploitable.

A common source of information are the request [headers](/operating-systems/networking/protocols/http.md#http-headers-in-web-applications).

```ps
$ curl -I https://example.com/  # query headers using cURL
```
</div><div>

🔑 The server <small>(Nginx, Apache, IIS, Node.js)</small> and the version may be exposed in the headers.

✨ You may find suspect headers <small>(ex: backdoors such as [PHP8.1-dev](https://github.com/flast101/php-8.1.0-dev-backdoor-rce)...)</small>

👉 You can use the network tab to tune requests and re-send them.

🗺️ There are many web scanner detecting suspicious headers.
</div></div>

<hr class="sep-both">

## Analyze cookies

[![httpindetail](../../../../_badges/thm/httpindetail.svg)](https://tryhackme.com/room/httpindetail)

<div class="row row-cols-lg-2"><div>

Refer to the [Cookie](/programming-languages/web/_general/random/cookies.md) for information on cookies.
</div><div>
</div></div>