# Dynamic Analysis

<hr class="sep-both">

## Analyze the network

[![walkinganapplication](../../../_badges/thm/walkinganapplication.svg)](https://tryhackme.com/room/walkinganapplication)
[![httpindetail](../../../_badges/thm/httpindetail.svg)](https://tryhackme.com/room/httpindetail)
[![contentdiscovery](../../../_badges/thm/contentdiscovery.svg)](https://tryhackme.com/room/contentdiscovery)
[![agentsudoctf](../../../_badges/thm-p/agentsudoctf.svg)](https://tryhackme.com/room/agentsudoctf)
[![agentt](../../../_badges/thm-p/agentt.svg)](https://tryhackme.com/room/agentt)

<div class="row row-cols-lg-2"><div>

After opening the network tab of your console, every HTTP request is now listed inside. You can see where the forms are sent, and examine the [headers](/operating-systems/networking/protocols/http.md#http-headers-in-web-applications) of every request.

You can also use the command `curl`:

```ps
$ curl -I https://example.com/ 
```
</div><div>

🔑 The server <small>(Nginx, Apache, IIS, Node.js)</small> and the version may be exposed in the headers.

✨ You may find suspect headers <small>(ex: backdoors such as [PHP8.1-dev](https://github.com/flast101/php-8.1.0-dev-backdoor-rce)...)</small>

👉 You can use the network tab to tune requests and re-send them.

🗺️ There are many web scanner detecting suspicious headers.
</div></div>

<hr class="sep-both">

## Analyze the javascript

<div class="row row-cols-lg-2"><div>

[![walkinganapplication](../../../_badges/thm/walkinganapplication.svg)](https://tryhackme.com/room/walkinganapplication)

You may use the console debugger, after adding a breakpoint in the JavaScript, to analyze the javascript code, if needed.

➡️ It's hard, so feel free to explore other techniques first.
</div><div>
</div></div>

<hr class="sep-both">

## Analyze cookies

[![httpindetail](../../../_badges/thm/httpindetail.svg)](https://tryhackme.com/room/httpindetail)

<div class="row row-cols-lg-2"><div>

Refer to the [Cookie](/programming-languages/web/_general/random/cookies.md) for information on cookies.
</div><div>
</div></div>