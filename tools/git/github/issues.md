# Issues

[Go back](../index.md#advanced-concepts)

Users may find a `bug` (🐛) in your project or may want to ask for some `support` or request a `functionality`. They will most likely use issues to report/ask something. Here is the official [GitHub tutorial](https://guides.github.com/features/issues/).

You can define **issues templates** using a file that needs to be created in `.github/ISSUE_TEMPLATE/config.yml`. This got quite simplified now

* go to your repository's settings
* in Options > Features > Issues
* click on "set up templates" and pick or create templates.

But, you may add this file, if you want to add contact_links or disable blank issues.

```yaml
blank_issues_enabled: false
contact_links:
  - name: Legendary Games Studio Support
    url: https://lgs-games.com/
    about: you can also ask support on our website
```