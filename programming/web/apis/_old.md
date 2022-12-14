# Introduction

**[Updates notes](index.md)**

There are two parts when dealing with an API

* creation (if you are not using an existing one)
* utilization (simply read the documentation and use it)

An API is available (=served) at an URL like [https://api.github.com/](https://api.github.com/). This URL is called **base endpoint** and is represented by `/` (root) in the API documentation).

You can view an endpoint as a sort of seller specialized in one kind of request. For instance, you may have an endpoint `/users` handling all requests related to the users. This endpoint can delegate some requests to other sellers (endpoints) like `/user/followers` (get user followers) or `/user/following` (get user following).

*Disclaimer*: I'm using Github as an example because I'm using Github API for this website.

<hr class="sl">

## Endpoint response

The result/response of the request is, in most cases, in

* JSON (`{ key: "value" }`)
* or, in XML (`<?xml version="1.0" encoding="UTF-8"?>`, then some HTML kind of syntax with tags)

<hr class="sr">

## Reading an URL

You need to be able to read an URL like `https://api.github.com/search/code?q=test+in:file+language:md+repo:lgs-games/memorize`

* Main endpoint: `https://api.github.com/`
* Endpoint: `/search/code` ("Search inside the code")
* Parameters: `?q=test+in:file+language:md+repo:lgs-games/memorize`,
  * We only have one here: `q` (query).
  * They are separated by `&`
  * And the format is `name=value`
  * The arguments are given after a `?` at the end of the URL.

This is a typical example of a GET request (arguments inside the URL) and you want to get something.

If you want to submit data (like creating a Github file), then you will have to make a PUT/POST request (check how you can do that in your language).

<hr class="sl">

## Making API requests

Let's says you got an API and you need to make requests. You could write some code in your language (like JavaScript, Go, PHP, Python, ...) like

* creating/using some code to handle HTTP/HTTPS requests
* then making the requests to the API
* wait for the result
* then process the result

But since a lot of people may have been using the API, you should look if there are drivers available like a query on DuckDuckGo/Google/... "Github API PHP" gave my [this driver](https://github.com/KnpLabs/php-github-api).

But you may also use tools if you want to test the requests before actually starting to code. The most famous tool is

* [PostMan](https://www.postman.com/)
* but I'm using [Jetbrains Requests tools](jetbrains.md)

<hr class="sl">

## HTTP headers and responses codes

When making a request, sometimes you may have to provide headers to your request.

```php
// this is an example if YOU ARE MAKING AN API
// of headers, but you won't use the same values
header("Access-Control-Allow-Origin: http://localhost/");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
```

As a client, you should care the most about the server response code. **Remember them**

* `200 OK` - Everything is fine
* `400 Bad Request` - Your request don't make any sense to us
* `404 Not Found` - Trying to use something that doesn't exist (file or URL)
* `405 Method Not Allowed` - You are trying to do something you can't do this way
* `429 Too Many Requests` - ...
* `500 Internal Server Error` - Our server had a problem

<hr class="sl">

## Documentation

You may use these to document your API.

* [apiary](https://apiary.io/) (reader can test your API from the documentation, can be linked with github)
* [redoc](https://github.com/Redocly/redoc)
* [stoplight](https://stoplight.io/)