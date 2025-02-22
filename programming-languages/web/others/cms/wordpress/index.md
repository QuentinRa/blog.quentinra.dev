# WordPress

[![hackingwordpress](../../../../../cybersecurity/_badges/htb/hackingwordpress.svg)](https://academy.hackthebox.com/course/preview/hacking-wordpress)
[![attacking_common_applications](../../../../../cybersecurity/_badges/htb/attacking_common_applications.svg)](https://academy.hackthebox.com/course/preview/attacking-common-applications)

<div class="row row-cols-lg-2"><div>

[WordPress](https://wordpress.com/) is a system that was created to build and manage blogs. It's now widely used for any kind of website.

* 📚 A theme is a template for a website. It includes styles and pre-designed pages, such as the product page for an online shop.

* 📦 A plugin is a bundle of code that extend WordPress to add a feature such as [Wordfence](https://www.wordfence.com/) for security mechanisms.

Many theme or plugins are paid. While it may be possible to illegally get a free version, you're likely to execute tampered code.
</div><div>

There are a few well-known files and folders.

* Themes are stored in `/wp-content/themes/<theme_name>/`.
* Plugin files are stored in `/wp-content/plugins/<plugin_name>/`.
* Uploaded files are stored in `/wp-content/uploads/`.
* Critical internal files are stored in `/wp-includes`.
* The WordPress base configuration is stored in `wp-config.php`.

✍️ Settings and data are stored in the database.
</div></div>

<hr class="sep-both">
<hr class="sep-both">
<hr class="sep-both">

<hr class="sep-both">

## WordPress Pentester Notes ☠️

[![hackingwordpress](../../../../../cybersecurity/_badges/htb/hackingwordpress.svg)](https://academy.hackthebox.com/course/preview/hacking-wordpress)
[![attacking_common_applications](../../../../../cybersecurity/_badges/htb/attacking_common_applications.svg)](https://academy.hackthebox.com/course/preview/attacking-common-applications)
[![webenumerationv2](../../../../../cybersecurity/_badges/thmp/webenumerationv2.svg)](https://tryhackme.com/room/webenumerationv2)
[![wordpress](../../../../../cybersecurity/_badges/hacktricks/wordpress.svg)](https://book.hacktricks.xyz/network-services-pentesting/pentesting-web/wordpress)

<div class="row row-cols-lg-2"><div>

#### WordPress Enumeration

[![cyberweek2021](../../../../../cybersecurity/_badges/thm/cyberweek2021.svg)](https://tryhackme.com/r/room/cyberweek2021)
[![allinonemj](../../../../../cybersecurity/_badges/thm-p/allinonemj.svg)](https://tryhackme.com/room/allinonemj)
[![wordpresscve202129447](../../../../../cybersecurity/_badges/thm-p/wordpresscve202129447.svg)](https://tryhackme.com/r/room/wordpresscve202129447)
[![techsupp0rt1](../../../../../cybersecurity/_badges/thm-p/techsupp0rt1.svg)](https://tryhackme.com/r/room/techsupp0rt1)
[![blog](../../../../../cybersecurity/_badges/thm-p/blog.svg)](https://tryhackme.com/r/room/blog)
[![blocky](../../../../../cybersecurity/_badges/htb-p/blocky.svg)](https://app.hackthebox.com/machines/Blocky)

You can enumerate [metadata](https://wpscan.com/wordpresses), [themes](https://wpscan.com/themes), [plugins](https://wpscan.com/plugins), and usernames.

* You can use [WPScan](_files/wpscan.md) to enumerate most of it

```ps
$ wpscan --url URL
$ wpscan --url URL -e u  # users
$ wpscan --url URL -e t  # themes (or 'vt')
$ wpscan --url URL -e ap # plugins (or 'p' or 'vp')
$ wpscan --url URL [...] --plugins-detection aggressive
```

* Manually explore `/wp-content/**/**` if directory listing is enabled

* WordPress version is in the source code or can be inferred from the default theme <small>(`<meta name="generator" content="WordPress X.Y.Z">`)</small>

* Plugin and theme names/versions are exposed within the website source code <small>(link/script)</small>. The URL may include the version.

* Look for links to user accounts, iterate `/?author=<id>`, or use `/wp-json/wp/v2/users` for versions before 4.7.1. While crawling the website, you may also find URLs such as `/author`.

```shell!
$ onectf crawl -u URL | grep author
```

* You can try to look in `/robots.txt` for something unexpected
</div><div>

#### WordPress FootHold

[![cyberweek2021](../../../../../cybersecurity/_badges/thm/cyberweek2021.svg)](https://tryhackme.com/r/room/cyberweek2021)
[![colddboxeasy](../../../../../cybersecurity/_badges/thm-p/colddboxeasy.svg)](https://tryhackme.com/room/colddboxeasy)
[![wordpresscve202129447](../../../../../cybersecurity/_badges/thm-p/wordpresscve202129447.svg)](https://tryhackme.com/r/room/wordpresscve202129447)
[![blog](../../../../../cybersecurity/_badges/thm-p/blog.svg)](https://tryhackme.com/r/room/blog)

* The password may be weak and vulnerable to [brute force](/cybersecurity/red-team/s2.discovery/techniques/network/auth.md):

```shell!
$ wpscan --url URL -P wordlist -U username # ", username2, etc."
$ hydra -l username -P wordlist domain http-form-post '/wp-login.php:log=^USER^&pwd=^PASS^&wp-submit=Log In&testcookie=1:S=Location' -V
$ hydra -l username -P wordlist domain http-form-post '/wp-login.php:log=^USER^&pwd=^PASS^&wp-submit=Log In&testcookie=1:F=is incorrect.' -V
```

While using `xmlrpc` is faster, it's not always 'enabled.' Ensure it's present and enabled before using it. WPScan automatically checks if it can, but this check is bypassed using `--password-attack xmlrpc`.

#### WordPress Exploitation

Refer to:

* [WordPress Core Exploitation](_files/wp-core.md)
* [WordPress Plugins Exploitation](_files/wp-plugins.md)
* [WordPress Admin RCE](_files/wp-rce.md)
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

WordPress Hardening

* Remove unused themes, and plugins
* Hide username
* Disable register
* Use security plugins <small>(change login page URL, ban IPs...)</small>
* Admins can write HTML in comments, it will be executed, but not normal users
* Deactivating plugins doesn't remove its files
* Auto-update? (themes and plugins too)
* Install only trusted themes/plugins
* sucuri-scanner, better-wp-security, wordfence

Configuration

* wp-config.php > can enable debug with "WP_DEBUG"
* set the main page > settings > reading > static page
* usually apache (`/var/www/html`) and mysql
</div><div>

Plugins

* Elementor
* JetPack

Stuff

* CMA, CDA
* WYSIWYG
* `/wp-admin/`, `login.php`, `wp-login.php`
* `xmlrpc.php` (XML API)
* `select user_login,user_pass from wp_users;`
* 10 levels of access, 5 (actually 6 with SA) roles
</div></div>