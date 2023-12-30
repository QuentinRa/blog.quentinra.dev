# SSL/TLS

[![protocolsandservers2](../../../cybersecurity/_badges/thmp/protocolsandservers2.svg)](https://tryhackme.com/room/protocolsandservers2)
[![networksecurityprotocols](../../../cybersecurity/_badges/thmp/networksecurityprotocols.svg)](https://tryhackme.com/room/networksecurityprotocols)

<div class="row row-cols-lg-2"><div>

SSL and TLS are cryptographic 🔒 protocols used to securely transfer data. They are used to secure many protocols such as HTTP <small>(HTTPS)</small>, SMTP <small>(SMTPS)</small>, FTP <small>(FTPS)</small>... that were sending data as plaintext 🔥.

SSL <small>(1.0, 2.0, and 3.0)</small> is deprecated over the more secure TLS. TLS versions 1.0, and 1.1 are deprecated too, while 1.2 is mostly used for backward-compatability, and 1.3 is the current recommended version.

SSL is often used interchangeably with TLS, even if they are different.
</div><div>

**Cryptography** 🔑: SSL/TLS use an [asymmetric algorithm](/cybersecurity/cryptography/algorithms/asymmetric/index.md) to exchange a temporary [symmetric](/cybersecurity/cryptography/algorithms/symmetric/index.md) key that they will use to exchange messages.

SSL/TLS use a certificate allowing a client to ensure the authenticity of the other party. The other party will wrap their public key and some of their information in a **Certificate Signing Request** (CSR) 📝.

They will send the CSR to a **Certificate Authority (CA)** 🏢, which is a third-party trusted by the client, that will issue the certificate.

There are 3 categories of certificates: EV, OV, and DV. 
</div></div>

<hr class="sep-both">

## Tools

<div class="row row-cols-lg-2"><div>

#### Find certificates given a domain

* [crt.sh](https://crt.sh/) <small>(website)</small>
* [ctfr](https://github.com/UnaPibaGeek/ctfr) <small>(1.9k ⭐, script, 2020 🪦)</small>
* [ct search](https://ui.ctsearch.entrust.com/ui/ctsearchui) <small>(include expired certificates)</small>
* [censys](https://search.censys.io/)

#### Examinate SSL configuration

* [SSLLabs](https://www.ssllabs.com/) <small>(detect TLS/SSL versions enabled, cipherlists...)</small>
* [testssl.sh](https://testssl.sh/) ([GitHub](https://github.com/drwetter/testssl.sh)) <small>(similar, but local testing)</small>
* [sslshopper](https://www.sslshopper.com/ssl-checker.html) <small>(???)</small>
* [sslscan](https://github.com/rbsec/sslscan): invalid or null cipher suites...

```ps
$ sslscan URL
```
</div><div>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* CertDB
* SSLMate
* Monitor > Renew certificate > Avoid expired problems
* Let's encrypt notes in Web
* SSL decryption
* SSL hijacking
* HTTPS spoofing 
* SSL stripping
</div><div>

* [ssl-config](https://ssl-config.mozilla.org/)
* [cipherlist](https://syslink.pl/cipherlist/)
* Unique domain (all), wildcard (DV/OV), multi-domains (DV, OV, EV)
* [TLS attacks](https://en.wikipedia.org/wiki/Transport_Layer_Security#Attacks_against_TLS/SSL)
* [Server_Side_TLS](https://wiki.mozilla.org/Security/Server_Side_TLS)
</div></div>