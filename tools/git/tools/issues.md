# Issues

[Go back](..)

Users may find a ``bug`` in your project or
may want to ask for some ``support`` or request
a ``functionality``. That most likely
cases when issues are used.

Here some [github tutorial](https://guides.github.com/features/issues/)
.

You can define issues templates
using a file that needs to be created
in ``.github/ISSUE_TEMPLATE/config.yml``.

An example would be

```yaml
blank_issues_enabled: false
contact_links:
  - name: Legendary Games Studio Support
    url: https://lgs-games.com/
    about: you can also ask support on our website
```

Then you can create in the same folder files in ``markdown``,
each one will be proposed as an issue template when
creating an issue.