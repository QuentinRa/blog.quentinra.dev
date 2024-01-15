# Request Grabber

<div class="row row-cols-lg-2"><div>

During pentesting activies, we may want to catch HTTP requests, such as during a CSRF attack or a XSS attack.

If our machine is network accessible, we can use `nc`:

```shell!
$ nc -lnvp PORT
<send request to YOUR_PUBLIC_IP:PORT>
```

Otherwise, we can use online solutions.

* `https://public.requestbin.com/r/`
</div><div>

For instance, we can use API Testing Platforms:

* [requestbin](https://public.requestbin.com/r/)
* [postbin](https://www.toptal.com/developers/postbin/)
* ...
</div></div>