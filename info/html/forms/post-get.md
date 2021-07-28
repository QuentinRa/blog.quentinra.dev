# Learning about POST and GET

[Go back](..)

<blockquote class="blockquote">
<p class="">
POST means that
the data will be hidden, GET means that the data will be shown in the URL.
</p>
<footer class="blockquote-footer"><cite title="Source Title">me</cite>, in the previous page</footer>
</blockquote>

Well not really, at least that not how I would properly
explain POST and GET so let's phrase it better.

POST, GET, PUT, ... are HTTP methods. The usage of such
methods of the HTTP protocol are described in
[rfc2616](https://datatracker.ietf.org/doc/html/rfc2616)
but let's summarize

* GET: retrieve something
* POST: change the state of the server

So if you are making a form, you might want to send a message
using a contact form, login, logout, ... You are changing the state
of the server so you **MUST** use POST.

If you are making a search bar or a profile page changing
according to the selected user then you should use **GET**
since you are only changing what you get in your
browser.

<hr class="sr">

Okay, let's take an example

Here I made a research on duckduckgo: ``https://duckduckgo.com/?q=hello&atb=v230-1&ia=web``,
could you notice something?
* you got ``q=hello``, the form got submitted as `GET`
* so anyone using this URL will see the same query

If you don't want something like this, then use POST.