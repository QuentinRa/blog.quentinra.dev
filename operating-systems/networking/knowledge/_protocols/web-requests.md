# Web requests

[Go back](../index.md)

<hr class="sep-both">

## XXX

<div class="row row-cols-md-2"><div>

X

🐊️ **Port**: XXX (TCP)
</div><div>
</div></div>

<hr class="sep-both">

## 🔓 HTTP - 80 (TCP)

➡ There is a secure version called HTTPS (port 443).

<div class="row row-cols-md-2 mt-3"><div class="border-end border-dark">

HTTP/HTTPS is a protocol used to exchange with a webserver. Your browser is sending an HTTP request to a webserver, receives a response with HTML inside, and displays the page in your browser.

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

##### HTTP versions

HTTP versions that are widely used are `HTTP/1.1`, and `HTTP 2.0`, while `HTTP 3.0` was released in 2022.
</div><div>

##### HTTP Headers

In every HTTP/HTTPS request/response, there are headers that are set both by the client and the server. The format is `Header-name: value`, and anyone can add their own headers.

* `Set-cookie`: The server request the creation of cookies
* `Cookie`: The client send in every request the created cookies
* `Host`: one of the domain names hosted by the server
* `Server:`: name of the HTTP server, maybe the version/OS too
* ...

##### HTTP Response code

When the server answers, it returns an [HTTP response code](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status) according to how it could handle the request

* `200`: OK
* `301/303`: Redirected
* `404`: Not found
* `500`: Internal server error
* ...

##### URL-encoding

If you are creating a user, you will most likely send the username/... to the server. Aside from `GET`, this data is added after leaving one blank line below the headers. In any case, the data must be URL-encoded as some characters aren't valid in a URL.

* Example of encoding `%`
* Find the ASCII of `%`: `37`
* Convert the value to hexadecimal: `25`
* Add `%` before the result: `%25`
* This is automatically done by your browser.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

```
URL
* Scheme: (protocol) HTTP/HTTPS/...
* Username:Password@Domain:port/Path?query#Fragment
* Methods GET, DELETE...
* Headers
  * Server: some server
  * Set-cookie: ... => server send the cookie in every request
  * ...
* Response code
```