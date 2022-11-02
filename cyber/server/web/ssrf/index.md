# Server-Side Request Forgery

[![ssrfqi](../../../_badges/thmp/ssrfqi.svg)](https://tryhackme.com/room/ssrfqi)
[![testingforssrf](../../../_badges/owasp/testingforssrf.svg)](https://owasp.org/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/07-Input_Validation_Testing/19-Testing_for_Server-Side_Request_Forgery)

<div class="row row-cols-md-2"><div>

Server-Side Request Forgery (**SSRF**) is possible when a server A is making a request to a server B while creating the request using input that can be injected by the user.

It could be 

* a website using an internal/external API
* a website using resources located on another machine
* ...

There are two kind of SSRF

* **Regular SSRF**: the client will see the result
* **Blind SSRF**: nothing is returned to the client
  * You can use [Burp Collaborator client](https://portswigger.net/burp/documentation/desktop/tools/collaborator-client)
  * You can use [requestbin](https://requestbin.com/)
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

*See [PayloadsAllTheThings/SSRF](https://github.com/swisskyrepo/PayloadsAllTheThings/tree/master/Server%20Side%20Request%20Forgery)*

<div class="row row-cols-md-2"><div>

**a?api=path $\to$ b/path**

It's not very likely to see something like this, but in that case, you could guess that the first server A is mapping the value given to `api` to the server b. You may try to inject the path, and see if you can access other API routes.

**a?url=some_url $\to$ a?url=malicious_url**

An **open redirect** endpoint is redirecting every user to another URL. For instance, when receiving a mails, tools such as HubSpot, replace the original link in a mail, with another one that will redirect to the original one, but record that the user opened the link at XXX, so that the company will understand their users behaviors. Well, if a website doing this redirect do not check the URL the user is redirected to, then a hacker may be able to use a trusted website with an open direct, to redirect to a malicious website. **Usage: phishing** 🎣. 

</div><div>

**a?api=xxx&r=path $\to$ xxx.b/path**

It's not very likely again, but it's possible that the website is making requests to multiple APIs according to what the user wants. For instance, an API for Pokémon, and another for foods. Let's say, for food, the request will be made to `foods.thebestapi.com`, and for Pokémon, il will be `pokemon.thebestapi.com`. At first glance, the developer might think that's as we are always calling a subdomain of `thebestapi.com`, it's "safe". But, a hacker may use a trick like giving the following value `api=malicious_website.com&ignore=&r=path`. If so, the request will be made to `malicious_website.com?ignore=thebestapi.com/path`, as we gave the following value to `api`:`malicious_website.com&ignore=`. The goal of such redirect to another website is stealing the API keys stored in the headers.
</div></div>

<hr class="sr">

## Remediation

<div class="row row-cols-md-2"><div>

**Allow List**

It's usually the better way. But, if there is condition is something like `URL is starting with https://example.com`, then it can be easily bypassed with `https://example.com.malicious.website`
</div><div>

**Deny list**

You may allow every IP aside from some such as localhost (127.0.0.1), or 169.254.169.254 in cloud environment, but there is usually a lot of way to bypass such filters. For instance, `0`, `00`, `000[...]0`, `0.0.0.0`, `127.1` (IP shortening), `2130706433` (decimal), `017700000001` (octal) and many more such as [127.0.0.1.nip.io](http://127.0.0.1.nip.io)/[localtest.me](http://localtest.me) are all resolving to `127.0.0.1`.
</div></div>