# Headers

[Go back](../index.md#security)

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
<td>Prevent anyone to open your website inside a iframe, to avoid the Clickjacking attack.

**Value**: `deny`, `sameorigin`, or/and you may allows only some domains with `allow-from: DOMAIN`.
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

Prevent the page from loading, if a XSS attack was detected (**deprecated and removed**, use CSP, you may [read MDN notes](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-XSS-Protection).

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

The best practice would be to disable inline CSS and JavaScript, aside from that, everything is good as long as you are aware of who you gave access to.

This is a short examples of allowing inline CSS/JavaScript (🤮, bad, 'unsafe-inline') and allowing some URLs. You will see errors in the console, letting you pick which domains/URLs you want to add or not (self=your website, none=none 😆). **There are no newlines** in the real file.

```none
default-src 'none';
script-src 'self' 'unsafe-inline' cdnjs.cloudflare.com/ajax/libs/mathjax/; 
style-src 'self' 'report-sample' 'unsafe-inline' cdnjs.cloudflare.com/ajax/libs/highlight.js/; 
img-src 'self' data: raw.githubusercontent.com/lgs-games/memorize/;
font-src 'self' cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/;
```

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

You can enable or disable features that you website might use (accelerometer, camera, ...). The usual behavior is to disable everything.

The simple version would be `accelerometer=(), camera=(), geolocation=(), gyroscope=(), magnetometer=(), microphone=(), payment=(), usb=()`. You can check on the Web if you need explanations about [each option](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Feature-Policy#directives).
</td>
</tr>
</tbody>
</table>

**Some code**

```apacheconf
<VirtualHost *:443>
    # ...
    Header always set Strict-Transport-Security "max-age=63072000"
    Header always unset X-Powered-By
    Header always set X-Frame-Options "deny"
    # set to 0
    # Header always set X-XSS-Protection "1; mode=block"
    Header always X-XSS-Protection 0
    Header always set X-Content-Type-Options "nosniff"

    # DO NOT FORGET TO SET Content-Security-Policy (CSP)
    # you must adapt this (add the host that your website can use)
    Header always Content-Security-Policy "default-src 'none';script-src 'self';style-src 'self';img-src 'self';"

    Header always Referrer-Policy "strict-origin-when-cross-origin"
    Header always Cross-Origin-Resource-Policy "same-siteé"
    Header always Permissions-Policy: accelerometer=(),autoplay=(),camera=(),display-capture=(),document-domain=(),encrypted-media=(),fullscreen=(),geolocation=(),gyroscope=(),magnetometer=(),microphone=(),midi=(),payment=(),picture-in-picture=(),publickey-credentials-get=(),screen-wake-lock=(),sync-xhr=(self),usb=(),web-share=(),xr-spatial-tracking=()
</VirtualHost>
```