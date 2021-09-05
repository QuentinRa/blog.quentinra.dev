# SSL practices

[Go back](../index.md#security)

It would be pretty useless to use HTTP, if someone can decrypt your communications, right? When a client is connecting to the server, both are agreeing on the way of encrypting the data, among a list that you defined.

The problems? You may have allowed **protocols** that have poor security practices, and you may have allowed poor **encrypting in your list**.

First, you can **check your website** [ssllabs tools: ssltest](https://dev.ssllabs.com/ssltest/index.html) or with [testssl.sh](https://testssl.sh/) ([GitHub](https://github.com/drwetter/testssl.sh)).

<hr class="sl">

## Disable bad protocols

You should **disable** any version of **TLS lesser than 2**, and **any version of SSL**, as they have a lot of [well-known vulnerabilities](https://en.wikipedia.org/wiki/Transport_Layer_Security#Attacks_against_TLS/SSL). You can do that with this code, disabling everything aside TLS v1.2 and TLS v1.3.

Some are enabling everything, and disabling the bad protocols, but I unsure if this is really secure 🙄 (note: this for older versions of apache/openssl, so no).

<hr class="sr">

## Disable bad encryption algorithms

Disabling algorithm (=removing them from the CipherList), can make your website unavailable for the old versions of some browsers, but you can see that with ssllabs tool, and you got [Mozilla recommendation for Intermediate compatibility (recommended)](https://wiki.mozilla.org/Security/Server_Side_TLS) to help you.