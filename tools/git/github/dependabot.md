# Dependabot

[Go back](..#advanced-concepts)

GitHub is providing a bot that will create pull requests when new updates for your dependencies are released. This can be easily enabled by creating `.github/dependabot.yml`.

You can go to Insights > Dependency graph > Dependabot to create a template file. Then you simply need to set the package-ecosystem. You got [a table here](https://docs.github.com/en/code-security/supply-chain-security/keeping-your-dependencies-updated-automatically/about-dependabot-version-updates#supported-repositories-and-ecosystems).

<hr class="sl">

## Example (gradle - JAVA)

```yaml
version: 2
updates:
  - package-ecosystem: "gradle"
    directory: "/"
    schedule:
      interval: "daily"
```

<hr class="sr">

## Example (npm - Node)

```yaml
version: 2
updates:
    - package-ecosystem: "npm"
      directory: "/"
      schedule:
        interval: "daily"
        time: "13:00"
      open-pull-requests-limit: "99"
      versioning-strategy: "increase"
```