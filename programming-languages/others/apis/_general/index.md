# Application Programming Interfaces

<div class="row row-cols-lg-2"><div>

Application Programming Interfaces (APIs) are used to create a layer of abstraction called "interface" between clients and services.

A few services commonly interfaced by APIs:

* 🪺 a database
* 💵 a bank payment service
* 💬 a social media platform
* 🗺️ a geolocation and mapping service
* ...

An API can interface both internal and external services, e.g. developed by the company or another company.

</div><div>

For the client of the API

* 😎 Simplify the integration of a service
* 💐 Standardized way to interact with a service
* 🍹 The service is maintained by the provider <small>(less work to do)</small>

<br>

For the provider of the API

* ✨ Can be used by websites, mobile apps, etc.
* 🍹 Centralize <small>(mostly database)</small> accesses <small>(ex: easier to find+patch bugs)</small>
* 💎 Can aggregate multiple data sources <small>(i.g. multiple databases...)</small>
</div></div>

<hr class="sep-both">

## 📖 Terminology 📖

<div class="row row-cols-lg-2"><div>

#### Endpoints

A few common terms:

* **Base endpoint**: the base [URL](/programming-languages/web/_general/random/url.md) for any request to the API
* **Endpoint**: a [URL](/programming-languages/web/_general/random/url.md) with one route of the API
* **Path**: the part after the base endpoint

For the endpoint `http://localhost:3000/users/1`, the base endpoint would be `http://localhost:3000` while the path would be `/users/1`.
</div><div>

#### Methods

An endpoint may allow multiple HTTP methods (GET, POST, PUT...). Refer to each API documentation to know which ones are available. See the [HTTP protocol/method](/operating-systems/networking/protocols/http.md#method) for your own API if needed.

#### Responses

Usually, only one format is supported, but developers may allow the developer to select a format <small>(ex: header content-type)</small>

➡️ Common formats are [JSON](/programming-languages/others/data/json.md) 💫 or [XML](/programming-languages/others/data/xml.md)

➡️ See also: [HTTP response code](/operating-systems/networking/protocols/http.md#http-response-code) <small>(200, 201, 400, 401, 403, 404, 500)</small>.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [_old](_old.md)
</div><div>
</div></div>