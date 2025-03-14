# Drupal

[![attacking_common_applications](../../../../../cybersecurity/_badges/htb/attacking_common_applications.svg)](https://academy.hackthebox.com/course/preview/attacking-common-applications)

<div class="row row-cols-lg-2"><div>

Drupal is an open-source Content Management System (CMS) written in PHP. The version 11 is currently in development (2024).

* [GitHub](https://github.com/drupal/drupal) <small>(4.1k ⭐)</small>
* [Documentation](https://www.drupal.org/documentation) <small>(⛪)</small>

It supports MySQL, PostgreSQL, or sqlite.
</div><div>
</div></div>

<hr class="sep-both">

## Drupal Pentester Notes ☠️

[![attacking_common_applications](../../../../../cybersecurity/_badges/htb/attacking_common_applications.svg)](https://academy.hackthebox.com/course/preview/attacking-common-applications)

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

<br>

#### Foothold

We often want to get an account to exploit.

* The login page is at `/user/login`
</div><div>

#### Exploitation

Before version 8, as an admin, we could enable the "PHP filter" module to execute PHP code:

* Create a basic page with some PHP code
* Set the text format to `PHP code`
* Access the created node (`/node/<your_new_node_id>`)


Since version 8 and onwards, the module is not installed by default. We can download them from [here](https://www.drupal.org/project/project_module) (e.g. [php module](https://www.drupal.org/project/php/releases)) and install them at `Administration > Reports > Available updates`.

We could also upload an backdoored module, e.g., a  legitimate module in which we added our files. Use `/admin/modules/install` and access them at `/modules/<module_name>/<our_file>`.

<br>

#### Well-known CVEs

[CVE-2014-3704](https://nvd.nist.gov/vuln/detail/CVE-2014-3704) <small>(7.x)</small>, [CVE-2018-7600](https://nvd.nist.gov/vuln/detail/CVE-2018-7600) and [CVE-2018-7602](https://nvd.nist.gov/vuln/detail/CVE-2018-7602) <small>(7.x, 8.x)</small> are called Drupalgeddon and affect the core of Drupal.

We could exploit them using metasploit:

```shell!
msf6> exploit/multi/http/drupal_drupageddon
```
</div></div>