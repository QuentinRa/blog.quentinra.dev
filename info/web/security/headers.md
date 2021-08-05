# Headers

[Go back](../index.md#websites-improvements-summary)

You should check your headers with websites like

* <https://observatory.mozilla.org/>
* <https://securityheaders.com/>
* <https://gf.dev/secure-headers-test>

You got a good example [here](https://securityheaders.com/?q=scotthelme.co.uk&followRedirects=on)
on the "good" header values.

In PHP, you could do

```php
header("Cross-Origin-Resource-Policy: same-site");
header("Referrer-Policy: strict-origin-when-cross-origin");
header("X-XSS-Protection: 1; mode=block");
header("Permissions-Policy: accelerometer=(), camera=(), geolocation=(), gyroscope=(), magnetometer=(), microphone=(), payment=(), usb=()");
```

Look at the headers documentations, security headers
and mozilla are giving examples and a lot of explanations.
You should take the best fitting headers for your website.