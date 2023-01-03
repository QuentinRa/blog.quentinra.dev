# XSS injections

[Go back](../../index.md#security)

CrossSiteScripting injections, also called **XSS** injections are one of the most well-known and easy ways to inject some code on a website. When you are making a form taking a username, the user can also write **JavaScript** inside the field. Once submitted, nothing happens, but once someone will go on the page where the username is displayed, then some script may be executed.

Setting your **Content-Security-Policy** (CSP) header will usually prevent most of the scripts from running, as you should have only allowed trusted websites to do cross-site requests.

<hr class="sl">

## Stored XSS

The easiest example is to test with this username

```html
<!-- use this as your username -->
<script>alert('test')</script>
<!-- or maybe add some tag after your username -->
<span onload="alert('virus')">Calistro</span>
```

**Solution**

* in a chat, you may use [strip_tags](https://www.php.net/manual/en/function.strip-tags.php) (PHP)
* if you want to escape the HTML
  * use [htmlentities](https://www.php.net/manual/fr/function.htmlentities.php) (ex: `echo htmlentities($username)`)
  * do **not** use [htmlspecialchars](https://www.php.net/manual/fr/function.htmlspecialchars.php) as this is escaping everything <small>(and for French people, this means that you will have problems with special characters not being properly rendered because they are escaped twice)</small>

You need to **serialize the data**, either **before reading it**, or **before storing it and reading it**.

<hr class="sr">

## Reflected XSS

Sometimes, you also got JavaScript inside URLs. Let's say someone hidden a link inside another/or simply the link was too long so you didn't check, you may have clicked on this

```bash
# of course this URL won't work
https://site.com/?id=<script>code...</script>
```

To summarize, a hacker is sending you a link to a website with a vulnerability with some code inside the link to exploit the vulnerability and hack you.