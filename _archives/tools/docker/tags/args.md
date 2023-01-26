# ARGUMENTS

[Go back](..#most-used-instructions)

Arguments allow you, for instance, to create different builds according to a version. The syntax is

```dockerfile
ARG NAME=value
```

with

* `NAME`: the argument name
* `value`: the argument value

<hr class="sl">

## Example

```dockerfile
ARG CODE_VERSION=latest
FROM base:${CODE_VERSION}
# if you want to use it inside
# you must redeclare it
ARG CODE_VERSION
#...

FROM extras:${CODE_VERSION}
#...
```