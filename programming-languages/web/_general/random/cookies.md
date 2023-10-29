# Cookies 🍪

<div class="row row-cols-lg-2"><div>

[![authenticationbypass](../../../../cybersecurity/_badges/thmp/authenticationbypass.svg)](https://tryhackme.com/room/authenticationbypass)

Cookies are defined in an [HTTP header](/operating-systems/networking/protocols/http.md). They are used by a server to store data inside a client's browser.

**Server**: the server first requests the browser to create a cookie. It's done by using the header `Set-Cookie` <small>(one per cookie)</small>.

**Client**: the client will send the cookies and their current value in every following request, in the header `Cookie`.

🔥 Cookies can be created, edited, and deleted by the client from the section  "Cookies" in "Application > Storage" of the [devtools](../index.md#-developer-tools-devtools-).
</div><div>

Cookies can be used

* 📦 to store data in the client browser
  * Ex: language
  * Ex: the mode (dark/light)
  * ...
* 👑 to store a session ID

☠️️ Some cookies may have an encoded value which is mostly in [base64](/tools-and-frameworks/knowledge/encoding/index.md#base64---). They may contain sensitive information once decoded.
</div></div>

<hr class="sep-both">

## Session cookies 🐲

<div class="row row-cols-lg-2"><div>

Session cookies are used to store data on the server, associated with someone visiting the website. 

Once the session is started server-side, a file will be created on the server with an **id** such as `f71dbe52628a3f83a77ab494817525c6`. The programmer can store inside stuff like:

* 🧑 is the user connected?
* 🔑 the user information such as the client's ID...
* ...
</div><div>

A session is available on every page server-side, so programmers use it to adapt the page according to what we know about the user <small>(for instance, if they are not logged in, they are redirected to the login page)</small>.

The server will send the **session ID in a cookie**, and the client will send it back in every request <small>(like a normal cookie)</small>, so that the session manager will load the right session file on the server.

👉 Unlike normal cookies, the client only has the session ID in their browser, so they can't edit the content of the session.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* Session Hijacking
* Cookie Stealing
* Cookie Scrapping
* MangaDex 2020
</div><div>


</div></div>