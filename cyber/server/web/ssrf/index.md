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