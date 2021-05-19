# ENV

> Set environnement variable

Syntax is like

```none
ENV NAME VALUE
or
ENV NAME=VALUE
```

* ``NAME`` : a variable name
* ``VALUE`` : the value of the variable

**Exemples**

```dockerfile
# declare
ENV MY_HOME=/home

# USAGES

# WORKDIR /home
WORKDIR ${MY_HOME}
# same
WORKDIR $MY_HOME
# if MY_HOME not set then value is default
WORKDIR ${MY_HOME:-default}
# if MY_HOME is set then replace value with unset
WORKDIR ${MY_HOME:+unset}
```