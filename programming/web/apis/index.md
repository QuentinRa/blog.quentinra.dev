# 🛳️ Application Programming Interface 🛳️

**[Old notes](_old.md)**

<div class="row row-cols-md-2 mt-4"><div>

Application Programming Interfaces (APIs) are used to allow access to internal services such as a database to both internal and external entities, but with a layer of abstraction called "interface".

For the client of the API

* 💐 Easier to use the company services <small>(ex: payment APIs)</small>
* 🍹 The service is maintained by the provider <small>(less work to do)</small>

For the API provider

* ✨ Once created, you can use it with websites, mobile apps...
* 🍹 Centralize database accesses <small>(easier to find/patch bugs/...)</small>
* 💎 Can aggregate multiple data sources <small>(i.g. multiple databases...)</small>
</div><div>

Some APIs

* [Github API](https://docs.github.com/en/rest/guides/getting-started-with-the-rest-api)
* [Musicbrainz API](https://musicbrainz.org/doc/MusicBrainz_API) (musics)
* [myanimelist API](https://myanimelist.net/apiconfig/references/api/v2) (mangas, anime, ...) or [jikan](https://jikan.moe/) (unofficial MAL API)
* [pokemon API](https://pokeapi.co/)
* [Paypal API](https://developer.paypal.com/docs/api/overview/) (payments)
* [MangaDex API](https://api.mangadex.org/docs/) (manga reader)
* ...

Some notes about APIs

* [Stripe](stripe/index.md) (payments)
</div></div>

<hr class="sep-both">

## 📖 Terminology 📖

<div class="row row-cols-md-2 mt-4"><div>

* **Base endpoint**: the base URL for any request to the API
* **Endpoint**: a URL with a route of the API
* **Path**: the part after the base endpoint

For the endpoint `http://localhost:3000/users/1`, the base endpoint would be `http://localhost:3000` while the path would be `/users/1`.
</div><div>

**Methods**

An endpoint may allow multiple HTTP methods (GET, POST, PUT...). Refer to the API documentation to known which one are available. See [HTTP protocol/method](/it/networking/protocols/index.md#method) for your own API if needed.

**Responses**

Usually, only one format is supported, but developers may allow the developer to select a format <small>(ex: header content-type)</small>

* JSON 💫 or sometimes XML
* [HTTP response code](/it/networking/protocols/index.md#http-response-code) <small>(200, 201, 400, 401, 403, 404, 500)</small>
</div></div>