# ENV

[Go back](..#most-used-instructions)

Set environment variable

```dockerfile
ENV NAME VALUE
# or
ENV NAME=VALUE
```

with

* `NAME`: a variable name
* `VALUE`: the value of the variable

<hr class="sl">

## Examples

```dockerfile
# declare
ENV MY_HOME=/home

# USAGES

# WORKDIR /home
WORKDIR ${MY_HOME}
# same
WORKDIR $MY_HOME
# if MY_HOME isn't set then the value is default
WORKDIR ${MY_HOME:-default}
# if MY_HOME is set then replace the value with unset
WORKDIR ${MY_HOME:+unset}
```