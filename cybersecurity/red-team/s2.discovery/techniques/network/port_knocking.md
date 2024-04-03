# Port Knocking

[![catpictures](../../../../_badges/thm-p/catpictures.svg)](https://tryhackme.com/r/room/catpictures)

<div class="row row-cols-lg-2"><div>

A niche practice mostly found during CTFs is called [port knocking](). Port knocking servers, such as [knockd](https://linux.die.net/man/1/knockd), while watch over every port and will run a command when ports are knocked in a given order.

For instance, if the sequence is `1111 5555 7777`, we could knock using:

```ps
$ sudo apt install -y knockd
$ knock IP -v 1111 5555 7777
```
</div><div>

We would also use netcat:

```ps
$ nc IP 1111
$ nc IP 5555
$ nc IP 7777
```

📚 It could be used to only show some ports to a user after they knocked the ports following the secret sequence.
</div></div>