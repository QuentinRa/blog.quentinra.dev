# Request Grabber

<div class="row row-cols-lg-2"><div>

During pentesting activies, we may want to catch HTTP requests, such as during a CSRF attack or a XSS attack.

If our machine is within the same network, we can use `nc`:

```shell!
$ nc -lnvp PORT
<send request to YOUR_PUBLIC_IP:PORT>
```

📚 We can use [responder](/cybersecurity/red-team/tools/utilities/networking/responder.md) for Windows Authentication Requests.

⚠️ Remember to use a **SSH backdoor** when available <small>(CTFs, etc.)</small>.
</div><div>

We may use online public solutions such as API Testing Platforms:

* [requestbin](https://public.requestbin.com/r/) <small>(HTTP 🌍)</small>
* [postbin](https://www.toptal.com/developers/postbin/) <small>(HTTP 🌍)</small>
* [ngrok](https://ngrok.com/) <small>(HTTP 🌍 and TCP ⭐, **credit card** required for free plan 💵)</small>
* [pinggy](https://pinggy.io/) <small>(TCP ⭐, account required ☠️)</small>
* [requestinspector](https://requestinspector.com/) <small>(HTTP 🌍)</small>
* [beeceptor](https://beeceptor.com/) <small>(HTTP 🌍)</small>
* [pastebin](https://pastebin.com/) <small>(HTTP + UPLOAD 🌍, use URL to raw file after upload)</small>
* [github.io](https://pages.github.com/) <small>(HTTP + UPLOAD 🌍, account required 🪦)</small>
* ...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [interactsh](https://app.interactsh.com/#/)
</div><div>

To use pinggy, create an account to get your SSH command. Run it with `localhost:4444` the final destination of the forwarded traffic.

```shell!
$ ssh -p 443 -R0:localhost:4444 -o StrictHostKeyChecking=no -o ServerAliveInterval=30 {secret}+tcp@a.pinggy.io
You will see here the DOMAIN and the PORT to use
```

It's often a reverse shell catcher such as netcat.

```shell!
$ nc -lnvp 4444
```
</div></div>