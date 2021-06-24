## Errors

[Go back](index.md)

You should add on this page errors that you got
and were not as easily solvable as looking at
StackOverflow or the documentation.

<hr class="sr">

## Handshake failure / JPackage / Modules

I was making HTTP/HTTPS requests and I was having an "SSL
handshake failure" and since I was only happening with
the .exe generated with JPackage it was quite hard
to fix. The error was that an algorithm was
missing in the module-info

```java
requires jdk.crypto.cryptoki;
```

* <https://stackoverflow.com/questions/9299133/why-doesnt-java-send-the-client-certificate-during-ssl-handshake>
* <https://stackoverflow.com/questions/9249158/why-do-i-get-a-handshake-failure-java-ssl>
* <https://stackoverflow.com/questions/63932217/java-ssl-handshake-failure-if-app-built-with-jpackage>
* <https://stackoverflow.com/questions/62238883/java-security-nosuchalgorithmexception-algorithm-x25519-not-available>
* <https://dzone.com/articles/ssl-handshake-failed-error-how-to-solve>
* <http://tpscash.github.io/2017/06/29/ssl-handshake-failure-jdk8/>
* <https://blogs.oracle.com/java-platform-group/diagnosing-tls,-ssl,-and-https>