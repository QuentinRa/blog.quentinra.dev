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

<div class="row row-cols-md-2 mt-4"><div>

#### Generate server-side code

To generate a server from a specification, you can use [OpenAPI Generator](https://github.com/OpenAPITools/openapi-generator) (14.3k ⭐). See [Install](https://openapi-generator.tech/docs/installation).

```
# ex: generate nodejs-express-server inside gen from xxx.yaml
$ java -jar openapi-generator-cli.jar generate -g nodejs-express-server -i xxx.yaml -o gen
```

> In **PHPStorm**, everything is already set up for you, you even got schema verification. See [OpenAPI](https://www.jetbrains.com/help/phpstorm/openapi.html).

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

##### Schema and Content

You will have two attributes that are coming back often: **schema** and **content**. A schema is the structure of something <small>(properties, types)</small>. In other languages, it's like defining a class. A content englobes content-types <small>(ex: json)</small> with their associated schema <small>(ex: PersonJSON)</small>.

Here we are defining that if the user requests a JSON, we return an Array of Strings.

```yaml
content:
  application/json: # could be XML... see supported formats.
    schema:
      type: array
      items: # the type of one item, this is a schema
        - type: string
      example: # optional example
        [ "toto", "tata" ]
```

Types are `string`, `array`, `object`, `boolean`, `integer`, `number`, and `null`.
</div><div>

##### Defining "classes" = schemas

You can actually create "classes". Add a block "components" <small>(ex: after the block "servers:")</small>. Here, we created a class **User**.

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