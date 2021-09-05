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

**Value**: DENY, SAMEORIGIN, or/and you may allows only some domains.
</td>
</tr>
<tr>
<th scope="row">Strict-Transport-Security</th>
<td>
<b>HTTP Strict Transport Security (HSTS)</b>

> According to [this article](https://raymii.org/s/tutorials/HTTP_Strict_Transport_Security_for_Apache_NGINX_and_Lighttpd.html): The server is asking the client to remember that it should never use HTTP for this website (for a period of time), to prevent attacks such as the MITM attack.

**Value**: you can use `"max-age=63072000"`
</td>
</tr>
<tr>
<th scope="row">X-Powered-By</th>
<td>Do not show the PHP version (or the one answering the request) in the request.

Instead of "set header_name value", use "unset X-Powered-By".
</td>
</tr>
<tr>
<th scope="row">X-XSS-Protection</th>
<td>Prevent the page from loading, if a XSS attack was detected.</td>
</tr>
<tr>
<th>X-Content-Type-Options</th>
<td>... "nosniff"</td>
</tr>
</tbody>
</table>

**Some code**

```apacheconf
<VirtualHost *:443>
    # ...
    Header always set Strict-Transport-Security "max-age=63072000"
    Header always unset X-Powered-By
    Header always set X-Frame-Options DENY
    Header always set X-XSS-Protection "1; mode=block"
    Header always set X-Content-Type-Options nosniff
</VirtualHost>
```