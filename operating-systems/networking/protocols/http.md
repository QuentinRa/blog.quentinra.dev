# Hypertext Transfer Protocol (HTTP)

<div class="row row-cols-md-2"><div>

HTTP is a protocol used to exchange with a webserver. Your browser is sending an HTTP request to a webserver, receives a response with HTML inside, and displays the page in your browser.

🐊️ **Port**: 80 (TCP)

🔒 There is a secure version called HTTPS <small>(port 443, over SSL/TLS)</small>.

```bash
$ telnet IP 80
GET / HTTP/1.1
Host: example.com
# leave a blank line
```

##### Method

The **first** element in a request is the method.

* `GET`: get a resource  <small>(ex: return `/index.html`)</small>
* `POST`: create a resource <small>(ex: create a user)</small>
* `PUT`: update ONE field of a resource <small>(ex: update user password)</small>
* `PATCH`: update a resource <small>(ex: update user data)</small>
* `DELETE`: delete a resource  <small>(ex: delete a user)</small>
* ...

##### Path/Route

The **second** is called **Path**/**Route**. It's a path relative to the webserver root. For instance, for `https://example.com/index.html`, the path is `/index.html`.
</div><div>

##### HTTP versions

HTTP versions that are widely used are `HTTP/1.1`, and `HTTP 2.0`, while `HTTP 3.0` was released in 2022.

##### HTTP Headers

In every HTTP/HTTPS request/response, there are headers that are set both by the client and the server. The format is `Header-name: value`, and anyone can add their own headers.

* `Set-cookie`: The server request the creation of cookies
* `Cookie`: The client send in every request the created cookies
* `Host`: one of the domain names hosted by the server
* `Server`: name of the HTTP server, maybe the version/OS too
* ...

##### HTTP Payload

If you are using `GET`, the payload is inside the URL. For others, the data is inside the body. In both case, [it's URL-encoded](/programming-languages/others/encoding/index.md).

##### HTTP Response code

When the server answers, it returns an [HTTP response code](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status) according to how it could handle the request

* `200`: OK
* `301/303`: Redirected
* `404`: Not found
* `500`: Internal server error
* ...
</div></div>