## Errors

[Go back](../index.md)

You should add on this page errors that you got and were not as easily solvable as looking at Stack Overflow or the documentation.

<hr class="sr">

## Handshake failure / JPackage / Modules

I was making HTTP/HTTPS requests and I was having an "SSL handshake failure" and since I was only happening with the .exe generated with JPackage it was quite hard to fix. The error was that an algorithm was missing in the module-info

```java
requires jdk.crypto.cryptoki;
```