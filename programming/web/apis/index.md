# 🛳️ Application Programming Interface 🛳️

<div class="row row-cols-md-2 mt-4"><div>

Application Programming Interfaces (APIs) are used to allow access to internal services such as a database to both internal and external entities, but with a layer of abstraction called "interface".

**For the client of the API**

* 💐 Easier to use the company services <small>(ex: payment APIs)</small>
* 🍹 The service is maintained by the provider <small>(less work to do)</small>

**For the provider of the API**

* ✨ Once created, you can use it with websites, mobile apps...
* 🍹 Centralize database accesses <small>(easier to find/patch bugs/...)</small>
* 💎 Can aggregate multiple data sources <small>(i.g. multiple databases...)</small>
 
**Additional notes for specific APIs**

* [jsonplaceholder](https://jsonplaceholder.typicode.com/) (**fake API for testing** 🚀)
* [Stripe](stripe/index.md) (payments)
</div><div>

Some APIs <small>(search for APIs on [rapidapi](https://rapidapi.com/hub) 🚀)</small>

* [Github API](https://docs.github.com/en/rest/guides/getting-started-with-the-rest-api)
* [MyAnimeList API](https://myanimelist.net/apiconfig/references/api/v2) <small>(mangas, anime, ...)</small> or [jikan](https://jikan.moe/) <small>(unofficial MAL API)</small>
* [Pokemon API](https://pokeapi.co/)
* [Paypal API](https://developer.paypal.com/docs/api/overview/) <small>(payments)</small>
* [MangaDex API](https://api.mangadex.org/docs/) <small>(manga reader)</small>
* [todoist](https://todoist.com/) <small>(to-do list)</small>

Services (APIs)

* [formspree](https://formspree.io/) <small>(forms)</small>
* [algolia](https://www.algolia.com/) <small>(search)</small>
* [simpleen](https://simpleen.io/) <small>(localization)</small>
* [courier](https://www.courier.com/) or [customer](https://customer.io/) <small>(push notifications, SMS, emails...)</small>
* [pusher](https://pusher.com/) <small>(push notifications, they are interfacing websockets...)</small>
* [postmarkapp](https://postmarkapp.com/) <small>(push emails...)</small>
* [ipify](https://www.ipify.org/) or [jsonip](https://jsonip.com/) or [ipgeolocation](https://ipgeolocation.io/) <small>(ip)</small>
* [headlessbrowserapi](https://headlessbrowserapi.com/) <small>(scrap)</small> 🚀 / [peekalink](https://www.peekalink.io/) <small>(preview)</small>
* [gravatar](https://en.gravatar.com/) <small>(avatars)</small> / [disqus](https://disqus.com/api/docs/) <small>(comments)</small>
* [Google Translate API](https://translate.googleapis.com/translate_a/single?client=gtx&sl=ko&tl=en&dt=t&q=176) / [DeepL API](https://www.deepl.com/pro-api) <small>(translations)</small> /

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

An endpoint may allow multiple HTTP methods (GET, POST, PUT...). Refer to the API documentation to know which ones are available. See [HTTP protocol/method](/it/networking/protocols/index.md#method) for your own API if needed.

**Responses**

Usually, only one format is supported, but developers may allow the developer to select a format <small>(ex: header content-type)</small>

* JSON 💫 or sometimes XML
* [HTTP response code](/it/networking/protocols/index.md#http-response-code) <small>(200, 201, 400, 401, 403, 404, 500)</small>
</div></div>

<hr class="sep-both">

## ✈  Test/use an API ️✈️

*Something like: "How to make API requests?"*

<div class="row row-cols-md-2 mt-4"><div>

#### Postman

The most well-known tool is [PostMan](https://www.postman.com/). Once downloaded,

* Go to the collection tab
* Create a new collection
* Add a request
  * Click on "GET" to select the method
  * Fill the URL with an endpoint of the API
  * You can add
    * Query parameters (GET, tab Params)
    * Headers (tab Headers)
    * Body (POST, x-www-form-encoded, tab Body)
* Then, click on send

➡️ Instead of editing your request to test another endpoint. Save it <small>(CTRL+S/save button)</small>, and create a new one.

➡️ In the right-side panel, there is a code tag. Click on it, and you will be able to generate the API request in many languages.
</div><div>

#### cURL

cURL is a command that is useful for quick tests.

```
# postman
$ curl --location --request POST 'URL' --header 'Content-Type: application/x-www-form-urlencoded' --data-urlencode 'key=value'
# simplified
$ curl -X POST 'URL' -d 'key=value' -H 'Content-Type: application/x-www-form-urlencoded'
```

<br>

#### Drivers

You should look on Google/GitHub for drivers/wrappers of your API.

<br>

#### Others

* Use your web browser with fetch (JavaScript)

* Use [JetBrains HTTP client](https://www.jetbrains.com/help/phpstorm/http-client-in-product-code-editor.html)

* Use [reqbin](https://reqbin.com/) to do/generate code to do requests
</div></div>

<hr class="sep-both">

## 🤙 API documentation 👈️

<div class="row row-cols-md-2 mt-4"><div>

To write API documentation, you can use

* [apiary](https://apiary.io/) <small>(Oracle, easy/manual, not recommended)</small>
* [stoplight](https://stoplight.io/) (👻)
</div><div>

...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* REST/RESTful/[REST API guidelines](https://github.com/controlook-zz/standards/blob/master/backend/rest-api-guidelines.md)
  * stateless (do not use previous requests)
  * uniform (ex: json for all responses)
  * multiple requests to get one resource (disadvantage)
* [GraphQL](https://graphql.org/) ([article on best practices](https://stepzen.com/blog/designing-graphql-apis-best-practices-and-learnings-from-rest-api-design))
</div><div>

* [insomnia](https://birdie0.github.io/discord-webhooks-guide/tools/insomnia.html)
* [httpie](https://birdie0.github.io/discord-webhooks-guide/tools/httpie.html)

</div></div>