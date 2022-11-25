# ONBUILD

[Go back](..#most-used-instructions)

Called if this image is used by another one in a FROM. The syntax is

```dockerfile
ONBUILD instruction arg
```

with

* `instruction`: a command
* `arg`: a command argument