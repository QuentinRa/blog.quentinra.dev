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
* [Mangadex API](https://api.mangadex.org/docs.html) (manga reader)
* ...

Some notes about APIs

* [Stripe](stripe/index.md) (payments)

</div></div>

<hr class="sep-both">

## OpenAPI

<div class="row row-cols-md-2 mt-4"><div>

[OpenAPI](https://swagger.io/specification/) is a wonderful project to create API. You will define a specification, and you will be able to generate the node in many language from the specification. 

Many API specifications are available [here](https://app.swaggerhub.com/search).

Base template for a OAS3 <small>(OpenAPI Specification Version 3)</small> in YAML

```yaml
openapi: 3.0.3
info:
  title: API NAME
  description: >
    API DESCRIPTION. You can use Markdown.
  version: 1.0.0
servers:
  - url: 'http://localhost:3000'
paths:
  # Add your paths here
```

To generate a server from a specification, you can use [OpenAPI Generator](https://github.com/OpenAPITools/openapi-generator) (14.3k ⭐).

> In **PHPStorm**, everything is already set up for you, you even got schema verification. See [OpenAPI](https://www.jetbrains.com/help/phpstorm/openapi.html).
</div><div>

</div></div>