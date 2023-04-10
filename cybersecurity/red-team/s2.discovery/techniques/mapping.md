# Website mapping

[Go back](../index.md)

<div class="row row-cols-md-2"><div>

A penetration tester will have to list every feature of the website along their route. For instance,

* "list all products": `/products,`
* "list a product": `/products?id=x`

This is automatically done by tools such as [Burp](/cybersecurity/red-team/s3.exploitation/tools/burp.md) if you are redirecting requests through the proxy, even if you don't intercept them.
</div><div>

Anyway, it's a good practice to test the website features as a user before trying to look for vulnerabilities.

👉 Don't forget the 404 page! 
</div></div>