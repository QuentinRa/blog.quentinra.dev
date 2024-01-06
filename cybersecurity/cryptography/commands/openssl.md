# OpenSSL

<div class="row row-cols-lg-2"><div>

The [openssl](https://www.openssl.org/) tool is a command for general-purpose cryptography and secure communication, primarily using [SSL/TLS](/operating-systems/networking/protocols/ssl-tls.md) certificates.

* Securely connect to a remote host

```ps
$ openssl s_client -connect IP:port
$ openssl s_client -connect IP:protocol
$ openssl s_client -connect IP:port -starttls protocol
```
</div><div>

* Encryption and Decryption

```ps
$ openssl enc -pbkdf2 -in plaintext -out ciphertext
$ openssl enc -d -pbkdf2 -in ciphertext -out plaintext
```

* Password Hashes

```ps
$ echo -n "toto" | openssl md4 # MD4 Hash
$ echo -n "toto" | openssl dgst -md4 # same
$ openssl passwd toto # for usage in /etc/passwd
```

* Generate a SSL/TLS certificate

```ps
$ openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365
$ openssl req -x509 -newkey rsa:4096 -nodes -keyout key.pem -out cert.pem -days 365
$ openssl req -x509 -newkey rsa:2048 -nodes -keyout server.pem -out cert.pem -sha256 -subj '/CN=xxx'
$ openssl x509 -in cert.pem -text -noout
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

[![weak_rsa](../../../cybersecurity/_badges/htb-c/weak_rsa.svg)](https://app.hackthebox.com/challenges/Weak%20RSA)

```ps
# display Exponent and Modulus
$ openssl rsa -pubin -inform PEM -text -noout < key.pub
# decrypt (deprecated)
$ openssl rsautl -decrypt -inkey key.priv -in flag.enc
# decrypt (new)
$ openssl pkeyutl -decrypt -inkey key.priv -in flag.enc
```
</div><div>
</div></div>