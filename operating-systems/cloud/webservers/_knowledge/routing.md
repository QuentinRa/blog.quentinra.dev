# Webserver Routing

<div class="row row-cols-lg-2"><div>

Browsers use the [HTTP](/operating-systems/networking/protocols/http.md) protocol to communicate with a web server. The server responds with an [HTML page](/programming-languages/web/html/index.md).

* 👉 If there is no routing, the [URL](/programming-languages/web/_general/random/url.md) is associated with a local path on the server, and the file is loaded if present.

```text!
URL: http://localhost/example/file.html
Possible path resolved: /var/www/example/file.html
```

* 👉 If there is no file in the URL, web servers may load `index.html`/`index.php`/... if present.

```text!
URL: http://localhost/example/
Possible path resolved: /var/www/example/index.html
```
</div><div>

* 👉 Modern apps are usually using a router. This reduces securities issues. Every URL will be redirected to a routing file which will determine which HTML page should be returned.

```text!
URL: http://localhost/example/
Request send to: some_router.php 
Possible path resolved: /var/www/file.html
```
</div></div>