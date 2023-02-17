# LABEL

[Go back](..#most-used-instructions)

Set the image properties that are shown when using the command `docker image inspect image_name_here`. The syntax is

```dockerfile
LABEL "property"="value"
```

with

* `property`: a property, see examples
* `value`: a value

<hr class="sl">

## Examples

```dockerfile
LABEL name="image name"
LABEL version="image version"
LABEL maintainer="maintener"
LABEL vendor="vendor"
LABEL environment=dev
LABEL description="image description"
```