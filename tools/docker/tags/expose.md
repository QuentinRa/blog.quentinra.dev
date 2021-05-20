# EXPOSE

[Go back](..)

> Expose a port of the container
> meaning that we will be able to bind
> or port of our machine with one of
> the image that will run.

Syntax is like

```none
EXPOSE port
or
EXPOSE port/protocole
```

* ``port`` : a port such as 80 for HTTP
* ``protocole`` : a protocole such as tcp, udp

**Exemples**

```dockerfile
EXPOSE 80
```