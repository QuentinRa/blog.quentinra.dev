# SSL practices

[Go back](../index.md#security)

It would be pretty useless to use HTTP, if someone can decrypt your communications, right? When a client is connecting to the server, both are agreeing on the way of encrypting the data, among a list that you defined.

The problems? You may have allowed **protocols** that have poor security practices, and you may have allowed poor **encrypting in your list**.

First, you can **check your website** [ssllabs tools: ssltest](https://dev.ssllabs.com/ssltest/index.html) or with [testssl.sh](https://testssl.sh/) ([GitHub](https://github.com/drwetter/testssl.sh)).

<hr class="sl">

## Disable bad protocols

You should **disable** any version of **TLS lesser than 2**, and **any version of SSL**, as they have a lot of [well-known vulnerabilities](https://en.wikipedia.org/wiki/Transport_Layer_Security#Attacks_against_TLS/SSL). You can do that with this code, disabling everything aside from TLS v1.2 and TLS v1.3.

Some are enabling everything and disabling the bad protocols, but I'm unsure if this is really secure 🙄.

```apacheconf
# edit /etc/apache2/sites-available/some_config.conf
# Protocols: TLS 1.2, TLS 1.3
SSLProtocol -all +TLSv1.3 +TLSv1.2
# restart: sudo service apache2 restart
```

<hr class="sr">

## Disable bad encryption algorithms

Disabling algorithm (=removing them from the CipherList), can make your website unavailable for the old versions of some browsers, but you can see that with the ssllabs tool, and you got [Mozilla recommendation for Intermediate compatibility (recommended)](https://wiki.mozilla.org/Security/Server_Side_TLS) to help you.

<details class="details-e">
<summary>Some examples</summary>

```apacheconf
# edit /etc/apache2/sites-available/some_config.conf
# add, at the end, either 1) 2), 3) or sometime else
# don't forget to restart when you're done
# sudo service apache2 restart

#
# Proposition 1)
#
SSLHonorCipherOrder on
SSLCipherSuite EECDH+AESGCM:EDH+AESGCM:AES256+EECDH:ECDHE-RSA-AES128-SHA:DHE-RSA-AES128-GCM-SHA256:AES256+EDH:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-SHA384:ECDHE-RSA-AES128-SHA256:ECDHE-RSA-AES256-SHA:DHE-RSA-AES256-SHA256:DHE-RSA-AES128-SHA256:DHE-RSA-AES256-SHA:DHE-RSA-AES128-SHA:ECDHE-RSA-DES-CBC3-SHA:EDH-RSA-DES-CBC3-SHA:AES256-GCM-SHA384:AES128-GCM-SHA256:AES256-SHA256:AES128-SHA256:AES256-SHA:AES128-SHA:DES-CBC3-SHA:HIGH:!aNULL:!eNULL:!EXPORT:!DES:!MD5:!PSK:!RC4

#
# Proposition 2)
#
SSLCipherSuite ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA256
SSLHonorCipherOrder on

#
# Proposition 3)
# Mozilla intermediate
#
SSLCipherSuite ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384
# hard algorithms, so we let the client pick
SSLHonorCipherOrder off
```
</details>

<hr class="sr">

## OCSP Stapling

> As this [page is explaining](https://cwiki.apache.org/confluence/display/httpd/OCSPStapling), this allows your clients to <q>efficiently check that your server certificate has not been revoked</q>. [Another good article](https://raymii.org/s/tutorials/OCSP_Stapling_on_Apache2.html).

<details class="details-e">
<summary>Some code</summary>

```apacheconf
# use either 1) or 2), don't forget to restart
# restart: sudo service apache2 restart

# Proposition 1)
# edit /etc/apache2/sites-available/some_config.conf
# near the end
SSLUseStapling On
SSLStaplingCache "shmcb:logs/ssl_stapling(32768)"

# Proposition 2)
# in /etc/apache2/mods-available/ssl.conf
# near the end
SSLUseStapling On
SSLStaplingCache shmcb:${APACHE_RUN_DIR}/ssl_stapling(32768)
```
</details>

<hr class="sl">

## Other notes for Apache

* [SSLCompression](https://httpd.apache.org/docs/trunk/mod/mod_ssl.html#sslcompression) disabled by default, should stay disabled to prevent attacks such as [CRIME](https://en.wikipedia.org/wiki/CRIME).

* [SSLSessionTickets](https://httpd.apache.org/docs/trunk/mod/mod_ssl.html#sslsessiontickets): **MUST BE DISABLED** (enabled by default) if you are not restarting your server periodically

```apacheconf
SSLSessionTickets off
```