# SSL/TLS

<div class="row row-cols-md-2"><div>

SSL and TLS are cryptographic 🔒 protocols used to securely transfer data. They are used to secure many protocols such as HTTP <small>(HTTPS)</small>, SMTP <small>(SMTPS)</small>, FTP <small>(FTPS)</small>... that were sending data as plaintext 🔥.

SSL <small>(1.0, 2.0, and 3.0)</small> is deprecated over the more secure TLS. TLS versions 1.0, and 1.1 are deprecated too, while 1.2 is mostly used for backward-compatability, and 1.3 is the current recommended version.
</div><div>

**Cryptography** 🔑: SSL/TLS use an asymmetric algorithm to exchange a temporary symmetric key that they will use to exchange messages.

SSL/TLS use a certificate to ensure the authenticity of the other party. This certificate is issued by a third-party **Certificate Authority (CA)** trusted by the client.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [crt.sh](https://crt.sh/) to search for certificates
* CertDB
* SSLMate
* [SSLScan](https://github.com/rbsec/sslscan)
* [ct search](https://ui.ctsearch.entrust.com/ui/ctsearchui) same, can fetch old certificates
</div><div>


</div></div>