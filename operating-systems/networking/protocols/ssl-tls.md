# SSL/TLS

<div class="row row-cols-md-2"><div>

SSL and TLS are cryptographic 🔒 protocols used to securely transfer data. They are used to secure many protocols such as HTTP <small>(HTTPS)</small>, SMTP <small>(SMTPS)</small>, FTP <small>(FTPS)</small>... that were sending data as plaintext 🔥.

SSL <small>(1.0, 2.0, and 3.0)</small> is deprecated over the more secure TLS. TLS versions 1.0, and 1.1 are deprecated too, while 1.2 is mostly used for backward-compatability, and 1.3 is the current recommended version.
</div><div>

**Cryptography** 🔑: SSL/TLS use an [asymmetric algorithm](/cybersecurity/cryptography/algorithms/asymmetric/index.md) to exchange a temporary [symmetric](/cybersecurity/cryptography/algorithms/symmetric/index.md) key that they will use to exchange messages.

SSL/TLS use a certificate allowing a client to ensure the authenticity of the other party. The other party will wrap their public key and some of their information in a **Certificate Signing Request** (CSR) 📝.

They will send the CSR to a **Certificate Authority (CA)** 🏢, which is a third-party trusted by the client, that will issue the certificate.
</div></div>

<hr class="sep-both">

## Tools

<div class="row row-cols-md-2"><div>

#### Find certificates given a domain

* [crt.sh](https://crt.sh/)
* [ct search](https://ui.ctsearch.entrust.com/ui/ctsearchui) <small>(include expired certificates)</small>

#### Examinate SSL configuration

* [SSLLabs](https://www.ssllabs.com/) <small>(detect TLS/SSL versions enabled, cipherlists...)</small>
</div><div>

...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* CertDB
* SSLMate
* [SSLScan](https://github.com/rbsec/sslscan)
* Monitor > Renew certificate > Avoid expired problems
* Let's encrypt notes in Web
</div><div>

* [ssl-config](https://ssl-config.mozilla.org/)
* [cipherlist](https://syslink.pl/cipherlist/)
* Validation levels
    * EV (extended)
    * OV (organization)
    * DV (domain)
* Unique domain (all), wildcard (DV/OV), multi-domains (DV, OV, EV)
</div></div>