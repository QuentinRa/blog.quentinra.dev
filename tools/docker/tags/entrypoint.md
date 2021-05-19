# ENTRYPOINT

> Entrypoint is an alternative to CMD
> or it's seems but you can pass arguments
> from docker command line to your docker
> image using it so you might like it.

Syntax is like

```none
ENTRYPOINT command
or
ENTRYPOINT ["command","arg1","arg2"]
```

* ``command`` : a command

**Exemples**

```bash
docker build -t image .
# send some args to ENTRYPOINT
docker run image "arg1" "arg2"
```

```dockerfile
# If no args then call
# echo "Hello world"
# else
# call echo on args
FROM ubuntu:latest
ENTRYPOINT ["echo"]
CMD ["Hello", "world"]
```