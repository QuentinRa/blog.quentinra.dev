# Profiles

[Go back](../index.md)

<div class="row row-cols-md-2"><div>

Each product has a folder `./products/<product_name>/profiles` with available profiles. They are YAML files with the extension `.profile`.

```yaml!
documentation_complete: true

title: '...'

description: |-
    ...

selections:
    - ...
```

Selections is a list of rules that are tested when selecting this profile.
</div><div>

#### controls

Controls are YAML files representing hardening guides. They are stored in `./controls`. Each control may execute multiple rules.

```yaml!
# ./controls/anssi.yml
  - id: R40
    title: User authentication running sudo
    levels:
    - minimal
    [...]
    rules:
    - sudo_remove_nopasswd
    - sudo_remove_no_authenticate
```

To load controls in a profile, you can use these:

```yaml!
selections:
    - anssi:R40         # one specific rule
    - anssi:all         # all rules
    - anssi:all:minimal # only keep if minimal in levels
```
</div></div>