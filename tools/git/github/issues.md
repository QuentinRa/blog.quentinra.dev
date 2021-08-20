# Issues

[Go back](../index.md#advanced-github-concepts)

Users may find a ``bug`` in your project or may want to ask for some ``support`` or request a ``functionality``. That is the most likely case when issues are used. Here is the official [GitHub tutorial](https://guides.github.com/features/issues/).

You can define **issues templates** using a file that needs to be created in ``.github/ISSUE_TEMPLATE/config.yml``.

An example would be

```yaml
blank_issues_enabled: false
contact_links:
  - name: Legendary Games Studio Support
    url: https://lgs-games.com/
    about: you can also ask support on our website
```

Once you created this file, go to your repository's settings, in Options > Features > Issues, click on "set up templates" and pick or create templates.