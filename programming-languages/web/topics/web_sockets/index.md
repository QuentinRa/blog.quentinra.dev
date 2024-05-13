# WebSockets

[![modern_web_exploitation_techniques](../../../../cybersecurity/_badges/htb/modern_web_exploitation_techniques.svg)](https://academy.hackthebox.com/course/preview/modern-web-exploitation-techniques)

<div class="row row-cols-lg-2"><div>

WebSockets are natively integrated within most web browsers. They allow real-time communication between a server and a client.

The [socket.io](/programming-languages/web/javascript/libraries/socket.io/index.md) library is a well-known library built on web sockets, while adding a lot of convenient features for real world apps.

For simple applications, we can directly use the WebSocket [API](https://developer.mozilla.org/en-US/docs/Web/API/WebSockets_API):

```js!
const socket = new WebSocket('ws://IP:port/test'); // or "wss://" for secure communication
socket.onmessage = message => console.log("Received: " + message.data);
socket.send('test');
```

You can explore the websocket traffic from the network tab.
</div><div>

Depending on how services are integrated with websockets, [XSS](/cybersecurity/red-team/s3.exploitation/vulns/web/xss.md)/[CSRF](/cybersecurity/red-team/s3.exploitation/vulns/web/csrf.md) and [SQLi](/cybersecurity/red-team/s3.exploitation/vulns/injection/sqli.md) attacks might be possible.

</div></div>