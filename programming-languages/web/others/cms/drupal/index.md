# Drupal

<div class="row row-cols-lg-2"><div>

Drupal is an open-source Content Management System (CMS) written in PHP. The version 5 is currently in development (2024).

* [GitHub](https://github.com/drupal/drupal) <small>(4.0k ⭐)</small>
* [Documentation](https://www.drupal.org/documentation) <small>(⛪)</small>

It supports MySQL, PostgreSQL, or sqlite.
</div><div>
</div></div>

<hr class="sep-both">

## Drupal Pentester Notes ☠️

<div class="row row-cols-lg-2"><div>

#### Enumeration

We may identify drupal and its version from:

* The tag `<meta name="generator" content="<here>">`
* The CHANGELOG may be exposed at `/CHANGELOG.txt`
* The CHANGELOG may be exposed at `/README.md`
* The robots.txt may be drupal-specific stuff at `/robots.txt`
* The `/node/<nodeid>` endpoint is specific to drupal

We may use [droopescan](/cybersecurity/red-team/tools/scanners/web/droopescan.md):

```ps
$ droopescan scan drupal -u URL
```

#### Foothold

We often want to get an account to exploit.

* The login page is at `/user/login`
</div><div>
</div></div>