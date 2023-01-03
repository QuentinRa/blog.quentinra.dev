# Headers

[Go back](../../../programming/web/_general/_old/general/index.md#security)

This is often overlooked, but settings the headers that your server is sending when it replies to a request, will prevent some well-known attacks, or any leak of information.

<hr class="sl">

## Hide Apache server version

You mustn't send your Apache version in the request.

```bash
sudo nano /etc/apache2/conf-enabled/security.conf
# ServerSignature Off
# ServerTokens Prod
sudo service apache2 restart
```

<hr class="sr">

## Common headers

<table class="table table-bordered table-striped border-dark">
<thead><tr><th>Header</th><th>Notes</th></tr></thead>
<tbody>
<tr>
<th scope="row">X-Frame-Options header</th>
<td>Prevent anyone to open your website inside an iframe, to avoid the Clickjacking attack.

**Value**: `deny`, `sameorigin`, or/and you may allow only some domains with `allow-from: DOMAIN`.
</td>
</tr>
<tr>
<th scope="row">Strict-Transport-Security</th>
<td>
<b>HTTP Strict Transport Security (HSTS)</b>

> According to [this article](https://raymii.org/s/tutorials/HTTP_Strict_Transport_Security_for_Apache_NGINX_and_Lighttpd.html): The server is asking the client to remember that it should never use HTTP for this website (for a period of time), to prevent attacks such as the MITM attack (protocol downgrade attacks and cookie hijacking).

**Value**: you can use `"max-age=63072000"`or `"max-age=63072000;includeSubDomains;"`
</td>
</tr>
<tr>
<th scope="row">X-Powered-By</th>
<td>Do not show the PHP version (or the one answering the request) in the request.

**Value**: instead of "set header_name value", use "unset header".
</td>
</tr>
<tr>
<th scope="row">X-XSS-Protection</th>
<td>

Prevent the page from loading, if an XSS attack was detected (**deprecated and removed**, use CSP, you may [read MDN notes](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-XSS-Protection).

**Value**: `"1; mode=block"`. **Now**, we are settings this to "0".
</td>
</tr>
<tr>
<th scope="row">X-Content-Type-Options</th>
<td>The browser shouldn't interpret the content differently than what's in the "Content-Type" header.

**Value**: `"nosniff"`
</td>
</tr>
<tr>
<th scope="row">Content-Security-Policy (CSP)</th>
<td>Tell, which domain can load CSS, JavaScript, Images, Medias, Fonts, etc.

The best practice would be to disable inline CSS and JavaScript, aside from that, everything is good as long as you are aware of whom you gave access to.

You may check this website header for a short example of allowing inline CSS/JavaScript (🤮, bad, 'unsafe-inline') and allowing some URLs. If you start using this header with your values, you will see errors in the console, letting you know which domains/URLs you will have to add or remove.

You can [learn more here](https://infosec.mozilla.org/guidelines/web_security#content-security-policy), [examine yours here](https://csp-evaluator.withgoogle.com/?csp=https://duckduckgo.com), and [generate one here](https://addons.mozilla.org/en-US/firefox/addon/laboratory-by-mozilla/).

</td>
</tr>
<tr>
<th scope="row">Referrer-Policy</th>
<td>The referrer is a header telling another website, which website the user is coming from. Internally, this is telling you which page the user is coming from.

You should read [this page by MDN](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Referrer-Policy#examples) to pick your value, the examples are helping.
</td>
</tr>
<tr>
<th scope="row">Cross-Origin-Resource-Policy</th>
<td>Tell who can read resources (img, scripts).

<b>Values</b>: `same-site`, `same-origin`, or `cross-origin`. You [can learn more here](https://resourcepolicy.fyi/).
</td>
</tr>
<tr>
<th scope="row">Permissions-Policy</th>
<td>

You can enable or disable features that your website might use (accelerometer, camera, ...). The usual behavior is to disable everything.

The simple version would be `accelerometer=(), camera=(), geolocation=(), gyroscope=(), magnetometer=(), microphone=(), payment=(), usb=()`. You can check on the Web if you need explanations about [each option](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Feature-Policy#directives).
</td>
</tr>
</tbody>
</table>

<details class="details-e">
<summary>Some code</summary>

```apacheconf
<VirtualHost *:443>
    # ...
    Header always set Strict-Transport-Security "max-age=63072000"
    Header always unset X-Powered-By
    Header always set X-Frame-Options "deny"
    # set to 0
    # Header always set X-XSS-Protection "1; mode=block"
    Header always set X-XSS-Protection "0"
    Header always set X-Content-Type-Options "nosniff"

    # DO NOT FORGET TO SET Content-Security-Policy (CSP)
    # you must adapt this (add the host that your website can use)
    # here is some code, but don't use this code, make yours
    Header always set Content-Security-Policy "default-src 'none';script-src 'self';style-src 'self';img-src 'self' some_domain_here;"

    Header always set Referrer-Policy "strict-origin-when-cross-origin"
    Header always set Cross-Origin-Resource-Policy "same-site"
    Header always set Permissions-Policy "accelerometer=(),autoplay=(),camera=(),display-capture=(),document-domain=(),encrypted-media=(),fullscreen=(),geolocation=(),gyroscope=(),magnetometer=(),microphone=(),midi=(),payment=(),picture-in-picture=(),publickey-credentials-get=(),screen-wake-lock=(),sync-xhr=(self),usb=(),web-share=(),xr-spatial-tracking=()"
</VirtualHost>
```
</details>

<hr class="sl">

## Best security practices

You can test your headers

* [Mozilla Observatory](https://observatory.mozilla.org/)
* [Security Headers](https://securityheaders.com/)
* [gf.dev](https://gf.dev/secure-headers-test)
* [Venom](https://github.com/ovh/venom) (test internal website, read [this gist](https://gist.github.com/righettod/f63548ebd96bed82269dcc3dfea27056#gistcomment-3630811))
* [Postman](https://www.postman.com/) (software)
* `curl -I https://memorize.be/` (😎, but no advice like others have 😶)

What values should I give to my headers?

* either check [the headers of the top websites](https://owasp.org/www-project-secure-headers/#div-top) (enter the command on your PC, the result changed)
* or read [OWASP proposal](https://owasp.org/www-project-secure-headers/#div-bestpractices) (the page seems a bit old)

**And**, you can read [OWASP guide](https://owasp.org/www-project-secure-headers/) about secure headers, as I did to make this page <small>(through, I discovered their guide after doing my headers 😭)</small>. You got a [quick reference here too](https://web.dev/security-headers/) by **Google**.

<hr class="sr">

## Headers in PHP

You can set your headers in PHP

```php
header("Cross-Origin-Resource-Policy: same-site");
header("Referrer-Policy: strict-origin-when-cross-origin");
header("X-XSS-Protection: 1; mode=block");
header("Permissions-Policy: accelerometer=(), camera=(), geolocation=(), gyroscope=(), magnetometer=(), microphone=(), payment=(), usb=()");
```