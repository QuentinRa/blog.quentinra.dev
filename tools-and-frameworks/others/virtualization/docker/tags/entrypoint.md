# ENTRYPOINT

[Go back](../../../../_kmp/_archives/tools/docker#most-used-instructions)

Entrypoint is an alternative to CMD, or it seems. You can pass arguments from the command line to your docker image using it, so you might like it. The syntax is

```dockerfile
ENTRYPOINT command
# or
ENTRYPOINT ["command","arg1","arg2"]
```

With `command`, a command in the image's language.

<hr class="sl">

## Examples

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