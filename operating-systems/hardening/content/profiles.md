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

<br>

#### Selections

Selections is a list of rules IDs that are tested when selecting this profile. However, **it's not always enough to add a rule here**, you may have to edit the rule `prodtype` attribute too.

👉 See the [Rules#prodtype](rules.md#prodtype) attribute.

☠️ If the `prodtype` attribute is present, you'll either get an error during build <small>(unselects all groups)</small>, or the rule may be silently removed.
</div><div>

#### Find rules

To find rules, you can look at other profiles or controls files, or you can use `find linux_os -name *ftp* -type d 2> /dev/null` <small>(ex: for ftp rules)</small>.

#### controls

[Controls](https://complianceascode.readthedocs.io/en/latest/manual/developer/03_creating_content.html#controls) are YAML files representing hardening guides. They are stored in `./controls`. Each control may execute multiple rules.

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