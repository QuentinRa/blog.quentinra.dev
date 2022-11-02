# Server-Side Request Forgery

[![ssrfqi](../../../_badges/ssrfqi.svg)](https://tryhackme.com/room/ssrfqi)

<div class="row row-cols-md-2"><div>

Server-Side Request Forgery (**SSRF**) is possible when a server A is making a request to a server B while creating the request using input that can be injected by the user.

It could be 

* a website using an internal/external API
* a website using resources located on another machine
* ...

There are two kind of SSRF

* **Regular SSRF**: the client will see the result
* **Blind SSRF**: nothing is returned to the client
</div><div>

It uses for a hacker are

* mapping an internal network (port open/...)
* stealing API credentials
* ...

A vulnerable entrypoint to this attack could be

* the URL <small>(is there a route/path/partial path looking like an API call?)</small>
* a form <small>(a normal field such as a form in which we need to pick an avatar in a list of images, an hidden field...)</small>
* ...
</div></div>

<hr class="sl">

## Some examples

<div class="row row-cols-md-2"><div>

**a?api=path $\to$ b/path**

It's not very likely to see something like this, but in that case, you could guess that the first server A is mapping the value given to `api` to the server b. You may try to inject the path, and see if you can access other API routes.

**a?url=some_url $\to$ a?url=malicious_url**

An **open redirect** endpoint is redirecting every user to another URL. For instance, when receiving a mails, tools such as HubSpot, replace the original link in a mail, with another one that will redirect to the original one, but record that the user opened the link at XXX, so that the company will understand their users behaviors. Well, if a website doing this redirect do not check the URL the user is redirected to, then a hacker may be able to use a trusted website with an open direct, to redirect to a malicious website. **Usage: phishing** 🎣. 

</div><div>

**a?api=xxx&r=path $\to$ xxx.b/path**

It's not very likely again, but it's possible that the website is making requests to multiple APIs according to what the user wants. For instance, an API for Pokémon, and another for foods. Let's say, for food, the request will be made to `foods.thebestapi.com`, and for Pokémon, il will be `pokemon.thebestapi.com`. At first glance, the developer might think that's as we are always calling a subdomain of `thebestapi.com`, it's "safe". But, a hacker may use a trick like giving the following value `api=malicious_website.com&ignore=&r=path`. If so, the request will be made to `malicious_website.com?ignore=thebestapi.com/path`, as we gave the following value to `api`:`malicious_website.com&ignore=`. The goal of such redirect to another website is stealing the API keys stored in the headers.
</div></div>