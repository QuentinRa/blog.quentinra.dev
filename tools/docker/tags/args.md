# ARGUMENTS

[Go back](..)

> They allow you for instance
> to create different build according
> to a version

Syntax is like

```none
ARG NAME=value
```

* ``NAME`` : argument name
* ``value`` : argument value

**Exemples**

```dockerfile
# latest is the default value
# but just for the example
ARG CODE_VERSION=latest
FROM base:${CODE_VERSION}
# if you want to use it inside
# you must redeclare it
ARG CODE_VERSION
#...

FROM extras:${CODE_VERSION}
#...

```