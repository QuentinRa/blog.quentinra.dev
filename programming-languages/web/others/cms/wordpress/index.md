# WordPress

[![hackingwordpress](../../../../../cybersecurity/_badges/htb/hackingwordpress.svg)](https://academy.hackthebox.com/course/preview/hacking-wordpress)

<div class="row row-cols-lg-2"><div>

[WordPress](https://wordpress.com/) is a system that was created to build and manage blogs. It's now widely used for any kind of website. There are **ton** of plugins making it fast and easy to create websites 🚀.

* **Learning websites**: search for "LMS" plugins
* **Manga websites**: search for "madara" or "MangaStream"
* ...

☠️ Note that most themes/plugins are paid.
</div><div>

**Useful links?**

* [wpgiz](https://wpgiz.com/) <small>(blog)</small>
* [themeforest](https://themeforest.net/category/wordpress) <small>(themes)</small> or [jojo-themes](https://www.jojo-themes.net/en/) <small>(themes)</small>
</div></div>

<hr class="sep-both">

## WordPress Pentester Notes ☠️

[![hackingwordpress](../../../../../cybersecurity/_badges/htb/hackingwordpress.svg)](https://academy.hackthebox.com/course/preview/hacking-wordpress)
[![webenumerationv2](../../../../../cybersecurity/_badges/thmp/webenumerationv2.svg)](https://tryhackme.com/room/webenumerationv2)
[![colddboxeasy](../../../../../cybersecurity/_badges/thm-p/colddboxeasy.svg)](https://tryhackme.com/room/colddboxeasy)
[![allinonemj](../../../../../cybersecurity/_badges/thm-p/allinonemj.svg)](https://tryhackme.com/room/allinonemj)
[![wordpress](../../../../../cybersecurity/_badges/hacktricks/wordpress.svg)](https://book.hacktricks.xyz/network-services-pentesting/pentesting-web/wordpress)

<div class="row row-cols-lg-2"><div>

There are two **paid** solutions to attack [WordPress](/programming-languages/web/others/cms/wordpress/index.md): [Jetpack](https://jetpack.com/) and [WPScan](https://wpscan.com/). WPScan is providing a CLI tool for **free** and for non-commercial use available [here](https://wpscan.com/wordpress-cli-scanner/) (8.0k ⭐).

```ps
# before every scan, update the local metadata database
$ wpscan --update # may be automatically performed
```

You can enumerate themes, plugins, and usernames. By default, without `-e`, it will scan using `-e vp,vt,tt,cb,dbe,u,m`.

```ps
# Look into the HTML, /wp-content/themes/... for themes
$ wpscan --url URL -e t
$ wpscan --url URL -e vt # vulnerable themes
# Look into /wp-content/plugins/pluginname/... for plugins
# Use the README in each plugin to find the version
$ wpscan --url URL -e ap # all plugins
$ wpscan --url URL -e p  # popular plugins
$ wpscan --url URL -e vp # vulnerable plugins
# Find users (look for ID in posts...)
$ wpscan --url URL -e u
$ wpscan --url URL --enumerate u # same
```

You may have to add `--random-user-agent` to by-pass a simple WAF:

```ps
$ wpscan [...] --random-user-agent
```

You can use WPScan/[hydra](/cybersecurity/red-team/tools/cracking/auth/hydra.md#form-brute-force)/... to bruteforce the login form. When using the tool, you may also use `xmlrpc` instead of the login page.

```shell!
$ wpscan --url URL -P wordlist -U username # ", username2, etc."
$ wpscan [...] --password-attack xmlrpc    # use xmlrpc, faster
$ hydra -l username -P wordlist domain http-form-post '/wp-login.php:log=^USER^&pwd=^PASS^&wp-submit=Log In&testcookie=1:S=Location' -V
$ hydra -l username -P wordlist domain http-form-post '/wp-login.php:log=^USER^&pwd=^PASS^&wp-submit=Log In&testcookie=1:F=is incorrect.' -V
```

⚠️ Don't use WordPress RPC API if you haven't tested that it works.
</div><div>

You can select a mode between aggressive/passive when scanning. Some results might not be visible according to the mode selected, so you should try both if you can.

```ps
$ wpscan --url URL -e t --plugins-detection aggressive
$ wpscan --url URL -e t --plugins-detection passive
```

You can increase the number of threads:

```ps
$ wpscan [...] -t 5 # default
```

The CLI can be unleashed with WPScan API that will retrieve vulnerabilities  when scanning. The limit is 25 requests per day. See [Optional: WordPress Vulnerability Database API](https://github.com/wpscanteam/wpscan/wiki/WPScan-User-Documentation#optional-wordpress-vulnerability-database-api). You can also browse vulnerabilities manually: [WordPress](https://wpscan.com/wordpresses), [Plugins](https://wpscan.com/plugins), and [Themes](https://wpscan.com/themes).

```ps
# To list vulnerabilities, add a "v" before the enumerated type
# ex: vulnerable plugins
$ wpscan --url URL -e vp
```

**To do it manually**

* WordPress version is in the source code (`<meta name="generator" content="WordPress X.Y.Z">`)
* Plugin and Theme names/versions are often loaded from the source code (link/script). The URL may include the version.
* Both WordPress, Plugins, and Themes may have a `readme.html`
* Look for links to user accounts, iterate `/?author=<id>`, or use `/wp-json/wp/v2/users` for versions before 4.7.1
* You can try to use `/xmlrpc.php` if available

**Exploit WordPress**

* [WordPress Plugins Exploitation](_files/wp-plugins.md).
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

Stuff

* CMA, CDA
* WYSIWYG
* `/wp-admin/`, `login.php`, `wp-login.php`
* `xmlrpc.php` (XML API)
* `wp-content/uploads/`, `wp-content/plugins/`, `wp-content/themes/`
* `wp-includes`
* `select user_login,user_pass from wp_users;`
* 5 levels of access
</div></div>