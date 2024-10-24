# Website mapping

<div class="row row-cols-lg-2"><div>

A penetration tester will have to list every feature of the website along their route. For instance,

* "list all products": `/products,`
* "list a product": `/products?id=x`

This is automatically done by tools such as [Burp](/cybersecurity/red-team/tools/utilities/proxies/burp/index.md) if you are redirecting requests through the proxy, even if you don't intercept them.
</div><div>

Anyway, it's a good practice to test the website features as a user before trying to look for vulnerabilities.

👉 Don't forget the 404 page!

👉 Don't forget special pages, such as the password reset page.

📚 Don't forget to invoke `OPTIONS` on API routes.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

Try testing the page under different contexts <small>(logged or anonymous, correct cookies vs poisonous cookies, etc.).
</div><div>
</div></div>