# Introduction

An application programming interface (API) is an interface 
allowing an user to use someone else services without
digging into the code.

The most well-know usage of API are "bank API" that
are allowing a website to process payments. They do
not know how the API is internal working but they
are calling some functions and now they can add
payments to their websites. The advantage is that
the API is developed and maintained by someone else
so they are the ones responsible to fix anything related
to the API.

Developers are also developing API because it's
easier to code this way like once you created your
API for your website, you can create a mobile app,
a desktop app, ... without having to rewrite
the code to access the database (for instance)
and if you found a bug, then you only need to patch
the API.

* [Github API](https://docs.github.com/en/rest/guides/getting-started-with-the-rest-api)
* [Musicbrainz API](https://musicbrainz.org/doc/MusicBrainz_API) (musics)
* [myanimelist API](https://myanimelist.net/apiconfig/references/api/v2) (mangas, anime, ...) or [jikan](https://jikan.moe/) (unofficial MAL API)
* [pokemon API](https://pokeapi.co/)
* [Stripe](https://stripe.com/docs/api) (payments), [Paypal API](https://developer.paypal.com/docs/api/overview/) (same)
* [Mangadex API](https://api.mangadex.org/docs.html) (manga reader)
* ...

<hr class="sr">

## Presentation

There are two parts when dealing with an API

* creation (if you are not using an existing one)
* utilisation (simply read the documentation and use it)

An API available at an URL like [https://api.github.com/](https://api.github.com/).
This URL is called **base endpoint** and is represented by ``/`` (root)
in the API documentation).

You can view an endpoint as a sort of seller specialised
in one kind of requests. For instance, you may have
an endpoint ``/users`` handling all requests related
to the users. This endpoint can delegate some requests
to other sellers (endpoints) like ``/user/followers``
(get user followers) or ``/user/following`` (get user following).

*An API well made will use a good endpoint structure
but that's not always the case.*

*Disclaimer*: I'm using Github as an example because
I'm using Github API in this website.

<hr class="sl">

## Endpoint response

The result/response of the request is, in most cases, in

* JSON (`{ key: "value" }`)
* or, in XML (`<?xml version="1.0" encoding="UTF-8"?>`, then some HTML kind of syntax with tags)

<hr class="sr">

## Reading an URL

You need to be able to read
an URL like ``https://api.github.com/search/code?q=test+in:file+language:md+repo:lgs-games/memorize``

* main endpoint: ``https://api.github.com/``
* endpoint: ``/search/code`` ("Search inside the code")
* parameters: ``?q=test+in:file+language:md+repo:lgs-games/memorize``,
  we only have one here: ``q`` (query).
  They are separated by `&`
  and the format is ``name=value``
  The arguments are given after a `?` at
  the end of the URL.

This is a typical example of a GET request (arguments
inside the URL) but if you want to submit data (like
creating a Github file), then you will have to made
of POST request (check how you can do that in your
language).

<hr class="sl">

## Making API requests

Let's says you got an API and you need to make requests.
You could write some code in your language
(like JavaScript, Go, PHP, Python, ...) like

* creating/using some code to handle HTTP/HTTPS requests
* then making the requests to the API
* wait for the result
* then process the result

But since a lot of people may have been using the API,
you should look if there are drivers available like
a query on DuckDuckGo/Google/... "Github API PHP"
gave my [this driver](https://github.com/KnpLabs/php-github-api).

But you may also use tools, if you want to test
the requests before actually starting to code.
The most famous tool is

* [PostMan](https://www.postman.com/)
* but I'm using [Jetbrains Requests tools](jetbrains.md)