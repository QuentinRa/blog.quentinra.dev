# OpenAPI

<div class="row row-cols-md-2"><div>

[OpenAPI](https://swagger.io/specification/) is a wonderful project to create API or generate API documentation. You will define a specification, and you will be able to generate the server code in many languages <small>(ex: node server)</small>.

Many API specifications are available [here](https://app.swaggerhub.com/search).

<br>

**✨ Useful References ✨**

* [About](https://swagger.io/docs/specification/about/)
* [Specification](https://swagger.io/specification/)
* [OpenAPI Tools](https://openapi.tools/)

</div><div>

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
</div></div>

<hr class="sep-both">

## 🚀 Generation 🚀

<div class="row row-cols-md-2 mt-3"><div>

#### API Server-side code

To generate a server from a specification, you can use [OpenAPI Generator](https://github.com/OpenAPITools/openapi-generator) (14.3k ⭐). See [Install](https://openapi-generator.tech/docs/installation).

```
# ex: generate nodejs-express-server inside gen from xxx.yaml
$ java -jar openapi-generator-cli.jar generate -g nodejs-express-server -i xxx.yaml -o gen
```

> In **PHPStorm**, everything is already set up for you, you even got schema verification. See [OpenAPI](https://www.jetbrains.com/help/phpstorm/openapi.html).
</div><div>

#### Documentation

I haven't tested other tools, but with the popular [Redoc](https://github.com/Redocly/redoc) (19.1k ⭐) you simply have to

* Copy the [following HTML](https://github.com/Redocly/redoc#deployment) on your web server
* Replace the URL with the link to your YAML file

And you're done. See [Redoc quick start](https://redocly.com/docs/redoc/quickstart/).
</div></div>

<hr class="sep-both">

## 🪵 Schema 🪵

<div class="row row-cols-md-2 mt-4"><div>

A schema is a definition of something. It's pretty much like a class in Oriented object programming. 7 types are supported which are `string`, `array`, `object`, `boolean`, `integer`, `number`, and `null`.

<div class="row row-cols-md-2"><div>

**String example**

```yaml
schema:
  type: string
```

**Array example**

```yaml
schema:
  type: array
  # type of one element
  items: # a schema
    - type: string
```

**String (enum)**

```yaml
schema:
  type: string
  enum: [value1, value2, value3]
```

</div><div>

**Object example**

```json
{
    "username": "toto",
    "age": 0
}
```

Give us the schema:

```yaml
schema:
  type: object
  properties:
    username: # a schema
      type: string
    age: # a schema
      type: integer
```
</div></div>

</div><div>

#### Schema attributes

Schemas have more attributes than just a type if you need them.

<div class="row row-cols-md-2"><div>

```yaml
schema:
  type: string
  format: email
```

```yaml
schema:
  type: array
  uniqueItems: true
  minItems: 0
  maxItems: 5
```

```yaml
schema:
  type: xxx
  readOnly: true # GET only
  writeOnly: true # POST/... only
  description: desc
  example: "1" # example for a string
```
</div><div>

```yaml
schema:
  type: integer
  format: int64
  minimum: 0
```

```yaml
schema:
  type: object
  additionalProperties: true
  minProperties: 0
  maxProperties: 4
  required:
    - id
```
</div></div>

<br>

#### Schema references

You may want to avoid copy-pasting the same schema. You can store them in a section **components** <small>(above "paths:" for me)</small>

<div class="row row-cols-md-2"><div>

```yaml
components:
  schemas:
    ProductIdParameter:
      type: string
      example: "1"
```
</div><div>

In the code, you will use **$ref**

```yaml
schema:
  $ref: '#/components/schemas/ProductIdParameter'
```
</div></div>

</div></div>

<hr class="sep-both">

## 🛣️ Paths 🛣️

<div class="row row-cols-md-2 mt-4"><div>

Given `http://localhost:3000/products`, if the endpoint is `http://localhost:3000`, then `/products` is a path of your API.

```yaml
paths:
  /products:
    get: # post, put, patch, delete
      summary: 'Get the list of products'
      description: 'An optional description'
      responses:
        # see responses
```

A path can accept multiple methods.

```yaml
paths:
  /products:
    get:
      # ...
    post:
      # ...
```
</div><div>

And a path can be made of dynamic parameters

```yaml
paths:
  /products/{id}:
    get:
      parameters:
        - in: path
          name: id
          required: true
          description: A description
          schema: # see schema
```

Other notes

```yaml
paths:
  /some/route:
    get:
      # deprecate a method
      deprecated: true
      # practical use ???
      operationId: some-id
```
</div></div>

<hr class="sep-both">

## 📦 Content 📦

<div class="row row-cols-md-2"><div class="align-self-center">

Another block always seen in many responses, bodies, or parameters is **content**.

A content is a set of content-types <small>(ex: json)</small> with their associated schema <small>(ex: PersonJSON)</small>.
</div><div>

```yaml
# ex: if you support both JSON and HTML
content:
  application/json:
    schema:
      # insert your schema here
  text/html:
    schema:
      # ...
```
</div></div>

<hr class="sep-both">

## Requests

<div class="row row-cols-md-2"><div>

#### Parameters

A query is a parameter in the URL. This is usually used for GET parameters.

```yaml
paths:
  /some/route:
    get:
      parameters:
        # ex: /user?id=some_value
        - in: query
          name: id
          required: true
          description: A description
          schema: # see schema
```

</div><div>

You could also request a cookie inside `parameters`.

```yaml
        # ex: cookie
        - in: cookie
          name: cookie.sid
          schema:
            type: string
```

#### Body

Mostly for POST/PATCH/PUT requests.

```yaml
paths:
  /some/route:
    post:
      requestBody:
        required: true
        content: # see content
```

</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [Basic Structure](https://swagger.io/docs/specification/basic-structure/)
* [Full spec](https://github.com/OAI/OpenAPI-Specification/blob/main/versions/3.0.3.md)
* [What's new in OpenAPI 3.0](https://swagger.io/blog/news/whats-new-in-openapi-3-0/)
* [MangaDex](https://api.mangadex.org/docs/swagger.html)
* [create-openapi-repo](https://github.com/Redocly/create-openapi-repo)

Stuff

* `oneOf`, `anyOf`, `not`
* Check out how to generate code samples
</div><div>

* [params](https://swagger.io/docs/specification/describing-parameters/)
* [body](https://swagger.io/docs/specification/describing-request-body/)
* [responses](https://swagger.io/docs/specification/describing-responses/)
* [api keys](https://swagger.io/docs/specification/authentication/api-keys/)
* [Tags](https://swagger.io/docs/specification/grouping-operations-with-tags/)
* Definitions
</div></div>