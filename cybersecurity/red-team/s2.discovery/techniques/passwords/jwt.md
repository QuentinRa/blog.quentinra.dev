# JSON Web Token (JWT)

[![hacking_jwt](../../../../_badges/hacktricks/hacking_jwt.svg)](https://book.hacktricks.xyz/pentesting-web/hacking-jwt-json-web-tokens)
[![jwt_introduction](../../../../_badges/rootme/web_server/jwt_introduction.svg)](https://www.root-me.org/en/Challenges/Web-Server/JWT-Introduction)
[![jwt_weak_secret](../../../../_badges/rootme/web_server/jwt_weak_secret.svg)](https://www.root-me.org/en/Challenges/Web-Server/JWT-Weak-secret)
[![jwt_header_injection](../../../../_badges/rootme/web_server/jwt_header_injection.svg)](https://www.root-me.org/en/Challenges/Web-Server/JWT-Header-Injection)

<div class="row row-cols-lg-2"><div>

JSON Web Token (JWT) are used to represent signed data. They are commonly used in for authentication and authorization.

The format is: `<algo>.<data>.<signature>`. Each part is base64 encoded, so the final string is URL-safe while it can be easily decoded.

The data is signed using a secret key. If the secret key is compromised, everyone can sign messages 🔏.

They can be transferred and found in:

* 📚 Headers (`Authorization: Bearer <JWT>`)
* 🍪 Cookies
* 📄 URL Parameters
* 💼 Request Body
* ...

To play around with a JWT cookie, you can use [jwt.io](https://jwt.io/).
</div><div>

You can also use [jwt-tools](https://github.com/ticarpi/jwt_tool) <small>(4.8k ⭐)</small>:

```shell!
$ cd /opt
$ sudo git clone https://github.com/ticarpi/jwt_tool
$ cd jwt_tool && pip3 install -r requirements.txt
$ sudo chmod +x /opt/jwt_tool/jwt_tool.py
$ sudo ln -s /opt/jwt_tool/jwt_tool.py /usr/bin/jwt_tool
$ jwt_tool -h
```

Common usages:

```ps
$ jwt_tool 'jwt'             # decode
$ jwt_tool 'jwt' -T          # encode
$ jwt_tool 'jwt' -T -X a     # attack 'algo=none'
$ jwt_tool 'jwt' -T -X i     # attack 'jwk header injection'
$ jwt_tool 'jwt' -T -p "key" # use secret key
$ jwt_tool 'jwt' -C -d /tmp/jwt.secrets.list # crack key
```

📚 A common handy wordlist is [jwt-secrets](https://github.com/wallarm/jwt-secrets).
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [PortSwigger JWT](https://portswigger.net/web-security/jwt)
* `hashcat -a 0 -m 16500`
* Attach algo=none means signature is ignored.
* [JWT](https://jwt.io/), (Bearer, encrypted token), modern alternative to (apache) HTTP basic auth? (from=35). HTB/170. [RFC](https://tools.ietf.org/html/rfc7617).
</div><div>
</div></div>