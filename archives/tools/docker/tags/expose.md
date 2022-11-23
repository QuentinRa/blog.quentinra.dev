# EXPOSE

[Go back](..#most-used-instructions)

Expose a port of the container, meaning that we will be able to bind or port of our machine with one of the images that will run. The syntax is

```dockerfile
EXPOSE port
# or
EXPOSE port/protocol
```

with

* `port` : a port such as 80 for HTTP
* `protocol` : a protocol such as tcp, udp

<hr class="sl">

## Example

```dockerfile
EXPOSE 80
```