# Hypertext Transfer Protocol (HTTP)

[![httpindetail](../../../cybersecurity/_badges/thm/httpindetail.svg)](https://tryhackme.com/room/httpindetail)
[![protocolsandservers](../../../cybersecurity/_badges/thmp/protocolsandservers.svg)](https://tryhackme.com/room/protocolsandservers)
[![networksecurityprotocols](../../../cybersecurity/_badges/thmp/networksecurityprotocols.svg)](https://tryhackme.com/room/networksecurityprotocols)
[![wireshark](../../../cybersecurity/_badges/thmp/wireshark.svg)](https://tryhackme.com/room/wireshark)
[![webrequests](../../../cybersecurity/_badges/htb/webrequests.svg)](https://academy.hackthebox.com/course/preview/web-requests)
[![introductiontowebapplications](../../../cybersecurity/_badges/htb/introductiontowebapplications.svg)](https://academy.hackthebox.com/course/preview/introduction-to-web-applications)

<div class="row row-cols-lg-2"><div>

HTTP is a protocol used to exchange with a webserver. Your browser is sending an HTTP request to a webserver, receives a response with HTML inside, and displays the page in your browser.

🐊️ **Port**: 80 (TCP)

🔒 There is a secure version called HTTPS <small>(port 443, over SSL/TLS)</small>.

```bash!
$ telnet IP 80
GET / HTTP/1.1
Host: example.com
# leave a blank line
```

##### Method

The **first** element in a request is the [method](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods).

* `GET`: get a resource  <small>(ex: return `/index.html`)</small>
* `POST`: create a resource <small>(ex: create a user)</small>
* `PUT`: update ONE field of a resource <small>(ex: update user password)</small>
* `PATCH`: update a resource <small>(ex: update user data)</small>
* `DELETE`: delete a resource  <small>(ex: delete a user)</small>
* `HEAD`: returns the headers for a GET request
* `OPTIONS`: returns a list of allowed methods for an endpoint
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
* `Accept`: media types that the client can understand
* `User-Agent`: describe the client initiating the request
* ...

##### HTTP Payload

If you are using `GET`, the payload is inside the URL. For others, the data is inside the body. In both case, [it's URL-encoded](/tools-and-frameworks/knowledge/encoding/index.md).

##### HTTP Response code

When the server answers, it returns an [HTTP response code](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status) according to how it could handle the request

* `200`: OK
* `301/303`: Redirected
* `403`: Forbidden
* `404`: Not found
* `500`: Internal server error
* ...

You can use [httpstatus](https://httpstatus.io/) to test the response code for a batch or URLs. It supports automatic redirection.
</div></div>

<hr class="sep-both">

## HTTP Headers in web applications

<div class="row row-cols-lg-2"><div>

HTTP Headers are commonly used to determine the web browser behavior for a website. Common usages are:

* ⌛ Define how long assets <small>(images/scripts/css)</small> are cached
* 🔑 Define if a browser can open a website in an iframe
* 🌍 Define if the server supports a protocol
* 🗺️ Define what websites are used to host scripts/... <small>(CDNs...)</small>
* 🚀 Specify required browser features
* ...

These headers if incorrectly configured, may disclose information about the server, or allow some web browsers to be exploited.

🔥 You should not leave a place exposed, for instance, by using secure headers at the website level, leaving the server exposed.
</div><div>

To find what headers you can use, and check if you headers are secure, they are many tools 🔨 and guides 📗:

* 📗 [OWASP Best Practices](https://owasp.org/www-project-secure-headers/#div-bestpractices)
* 📗 [OWASP TOP 10 Headers](https://owasp.org/www-project-secure-headers/#div-top)
* 📗 [Google Secure Headers](https://web.dev/security-headers/)
* 🔨 [Mozilla Observatory](https://observatory.mozilla.org/)
* 🔨 [Security Headers](https://securityheaders.com/)
* 🔨 [secure-headers-test](https://domsignal.com/secure-header-test) (test)
* 🔨 [venom test suite](https://github.com/oshp/oshp-validator)

To see the website headers, you can use

* Your web browser, in the network tab of the dev tools
* `curl -I https://example.com/`
* [Postman](https://www.postman.com/) (software)
</div></div>