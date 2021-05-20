# LABEL

[Go back](..)

> Set image properties that are show
> when using command ``docker image inspect image_name_here``

Syntax is like

```none
LABEL "property"="value"
```

* ``property`` : a property, see examples
* ``value`` : a value

**Exemples**

```dockerfile
LABEL name="image name"
LABEL version="image version"
LABEL maintainer="maintener"
LABEL vendor="vendor"
LABEL environment=dev
LABEL description="image description"
```