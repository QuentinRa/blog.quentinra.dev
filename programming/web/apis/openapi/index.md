# OpenAPI

<div class="row row-cols-md-2"><div>

[OpenAPI](https://swagger.io/specification/) is a wonderful project to create API or generate API documentation. You will define a specification, and you will be able to generate the server code in many language <small>(ex: node server)</small>.

Many API specifications are available [here](https://app.swaggerhub.com/search).

<br>

**✨ Useful References ✨**

* [About](https://swagger.io/docs/specification/about/)
* [Specification](https://swagger.io/specification/)

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

...
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
  type: string
  # type of one element
  items: # a schema
    - type: string
```
</div><div>

**Object example**

```json
{
    "username": "toto",
    "age": 0
}
```

Has the schema

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

Schema have more attributes than just a type if you need them.

<div class="row row-cols-md-2"><div>

```yaml
schema:
  type: string
  description: desc
  example: "1"
```
</div><div>

```yaml
schema:
  type: integer
  format: int64
  minimum: 0
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

<div class="row row-cols-md-2 mt-4"><div>

#### Write your YAML

**Paths** are the paths of your APIs, with their HTTP methods, parameters, headers, cookies, and responses.

```yaml
paths:
  /some/route:
    get: # post, put, patch, delete
      summary: Creates a product # example
      description: An optional description
      responses:
        '200':
          description: A description of the response
          content:
            # optional example of a response
        # you can add other codes
        '404': { description: "some description" }
```

##### Content

A content englobes content-types <small>(ex: json)</small> with their associated schema <small>(ex: PersonJSON)</small>.

```yaml
content:
  application/json: # could be XML... see supported formats.
    schema:
      # insert your schema here
```
</div><div>

```yaml
components:
  schemas:
    User:
      type: object
      properties:
        # description and example are optional
        username: { type: string, description: "desc", example: "toto" }
        # you can add constraints
        age: 
          type: integer
          format: int64
          minimum: 0
```

You can use the reference as follows for a list of User.

```yaml
content:
  application/json:
    schema:
      type: array
      items:
        $ref: '#/components/schemas/User'
```

##### Parameters

Add a block parameters, usually below summary/description.

```yaml
  /products/{id}:
    get:
      parameters:
        # Ex: the path has a dynamic {id}
        - in: path
          name: id
          required: true
          description: A description
          schema: # see schema
            type: integer
        # You can also request cookies
        # Ex: request a cookie called cookie.sid
        - in: cookie
          name: cookie.sid
          schema:
            type: string
```

##### Body

Add a block requestBody, usually below parameters.

```yaml
requestBody:
  required: true
  # notice that this is a content
  content:
    application/json:
      # example with a JSON object
      schema:
        type: object
        properties:
          username: { type: string }
          age: { type: integer }
```

##### To-do

* Definitions

</div></div>