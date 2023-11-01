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

For testing, you can use the fake [jsonplaceholder](https://jsonplaceholder.typicode.com/) API 🚀.
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

<br>

#### HTTP requests

We can interact with an API from our browser, as our browser will send the [HTTP request](/operating-systems/networking/protocols/http.md) for us. Outside a browser, we create one manually.
</div><div>

#### Methods

An endpoint may allow multiple HTTP methods (GET, POST, PUT...). Refer to each API documentation to know which ones are available. See the [HTTP protocol/method](/operating-systems/networking/protocols/http.md#method) for your own API if needed.

<br>

#### Responses

Usually, only one format is supported, but developers may allow the developer to select a format <small>(ex: header content-type)</small>

➡️ Common formats are [JSON](/programming-languages/others/data/json.md) 💫 or [XML](/programming-languages/others/data/xml.md)

➡️ See also: [HTTP response code](/operating-systems/networking/protocols/http.md#http-response-code) <small>(200, 201, 400, 401, 403, 404, 500)</small>.
</div></div>

<hr class="sep-both">

## Query an API

<div class="row row-cols-lg-2"><div>

Each API often has what we call a **wrapper** or **driver** per programming language. Often, it is a library defining functions which we will call and that will handle the API HTTP request for us. 

➡️ Ex: [PHP GitHub API](https://github.com/KnpLabs/php-github-api) to use [GitHub API](https://docs.github.com/en/rest/guides/getting-started-with-the-rest-api) in [PHP](/programming-languages/web/php/_general/index.md).

If there is no wrapper or we want to make some tests, we can query the API ourselves, by sending HTTP requests.

<br>

#### cURL

[cURL](/operating-systems/linux/commands/list.md#command-curl) is a command that is useful for quick tests.

```ps
# postman generated command
$ curl --location --request POST 'URL' --header 'Content-Type: application/x-www-form-urlencoded' --data-urlencode 'key=value'
# simplified command
$ curl -X POST 'URL' -d 'key=value' -H 'Content-Type: application/x-www-form-urlencoded'
```
</div><div>

#### Postman Software

[PostMan](https://www.postman.com/) is a popular tool to test an API. Once downloaded,

* Go to the collection tab
* Create a new collection
* Add a request
    * Click on "GET" to select the method
    * Fill the URL with an endpoint of the API
    * You can add
        * Query parameters <small>(GET, tab Params)</small>
        * Headers <small>(tab Headers)</small>
        * Body <small>(POST, x-www-form-encoded, tab Body)</small>
* Then, click on send

➡️ Instead of editing your request to test another endpoint. Save it <small>(CTRL+S/save button)</small>, and create a new one.

➡️ In the right-side panel, there is a code tag. Click on it, and you will be able to generate the API request in many languages.

<br>

#### Others

* Use your web browser with fetch (JavaScript)

* Use [JetBrains HTTP client](https://www.jetbrains.com/help/phpstorm/http-client-in-product-code-editor.html)

* Use [reqbin](https://reqbin.com/) to do/generate code to do requests
</div></div>

<hr class="sep-both">

## Random

<div class="row row-cols-lg-2"><div>

#### API Documentation

A few tools/platforms you may use 📚:

* [apiary](https://apiary.io/) <small>(not recommended)</small>
* [stoplight](https://stoplight.io/) (👻)

See also: [OpenAPI tools](/programming-languages/others/apis/openapi/index.md).
</div><div>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* REST/RESTful/[REST API guidelines](https://github.com/controlook-zz/standards/blob/master/backend/rest-api-guidelines.md)
    * stateless (do not use previous requests)
    * uniform (ex: JSON for all responses)
    * multiple requests to get one resource (disadvantage)
* [GraphQL](https://graphql.org/) ([article on best practices](https://stepzen.com/blog/designing-graphql-apis-best-practices-and-learnings-from-rest-api-design))
</div><div>

* [insomnia](https://birdie0.github.io/discord-webhooks-guide/tools/insomnia.html)
* [httpie](https://birdie0.github.io/discord-webhooks-guide/tools/httpie.html)
* OData (Open Data)
* SOAP (Simple Object Access Protocol)
* WSDL (Web Services Description Language)
</div></div>