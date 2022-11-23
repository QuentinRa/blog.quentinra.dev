# ENV

[Go back](..#most-used-instructions)

You can use ENV to set environment variables with `NAME`: a variable name, and `VALUE`: the value of the variable.

```dockerfile
ENV NAME VALUE
# or
ENV NAME=VALUE
```

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