# WordPress

[![hackingwordpress](../../../../../cybersecurity/_badges/htb/hackingwordpress.svg)](https://academy.hackthebox.com/course/preview/hacking-wordpress)
[![attacking_common_applications](../../../../../cybersecurity/_badges/htb/attacking_common_applications.svg)](https://academy.hackthebox.com/course/preview/attacking-common-applications)

<div class="row row-cols-lg-2"><div>

[WordPress](https://wordpress.com/) is a system that was created to build and manage blogs. It's now widely used for any kind of website.

* 📚 A theme is a template for a website. It includes styles and pre-designed pages, such as the product page for an online shop.

* 📦 A plugin is a bundle of code that extend WordPress to add a feature such as [Wordfence](https://www.wordfence.com/) for security mechanisms.

Many theme or plugins are paid. While it may be possible to illegally get a "free" version, you're likely to execute malicious code.
</div><div>

There are a few well-known files and folders.

* Themes are stored in `/wp-content/themes/<theme_name>/`.
* Plugin files are stored in `/wp-content/plugins/<plugin_name>/`.
* Uploaded files are stored in `/wp-content/uploads/`.
* Critical internal files are stored in `/wp-includes`.
* The API is available using `/wp-json/` or `/xmlrpc.php` <small>(old)</small>.
* The WordPress base configuration is stored in `wp-config.php`.

✍️ Settings and data are stored in the database.
</div></div>

<hr class="sep-both">

## WordPress — Website Discovery

<div class="row row-cols-lg-2"><div>

#### WordPress Discovery — Forced Browsing

WordPress can be really annoying to crawl as it redirects the user to the most likely page. All of these redirections are resulting in a status code of `302` and a header `X-Redirect-By: WordPress`.

* [ ] Discover [themes](https://github.com/projectdiscovery/nuclei-templates/blob/main/http/fuzzing/wordpress-themes-detect.yaml) 
* [ ] Discover [plugins](https://github.com/projectdiscovery/nuclei-templates/blob/main/http/fuzzing/wordpress-plugins-detect.yaml)
* [x] Check if `/emergency.php` was added and not removed
* [x] Check if `/wp-config.php` or a backup is exposed
* [x] Check if `/wp-content/debug.log` is exposed <small>(WP_DEBUG+WP_DEBUG_LOG)</small>
* [x] Check if `/wp-admin/maint/repair.php` is exposed and enabled

#### WordPress Discovery — Mapping

* [x] Directory listing may be enabled in `/wp-content/**/*`
* [x] Browse `/wp-json/wp/` or `/?rest_route=/wp/`
* [x] Browse `/xmlrpc.php`, `/xmlrpc/`, or `/xmlrpc/pingback`
* [x] Browse `/feed/` or `?feed=rss2`
* [x] Check if `wp-login.php` and `wp-signup.php` are available
* [x] Check if `?gf_page=randomstring` redirects to the login page

#### WordPress Discovery — Core Fingerprint

* [x] Cookie starting with `wordpress_`
* [x] Meta tag `<meta name="generator" content="WordPress 6.7.2"/>`
* [x] Rdf generator tag `https://wordpress.org/?v=6.7.2` <small>(URL in tags)</small>
* [x] Query parameter `style.min.css?ver=6.7.2` <small>(many CSS/JS files)</small>
</div><div>

#### WordPress Discovery — Theme/Plugin Fingerprint

* [x] Passive theme and plugin detection
* [ ] Plugins versions in query parameters?
* [ ] Plugins versions in README (`/readme.txt`, etc.)

#### WordPress Discovery — Exposed Usernames

* [x] Enumerate users with `?author=1`
* [x] Enumerate users with `/author-sitemap.xml` <small>(Yoast SEO plugin)</small>
* [x] Enumerate users with `/wp/v2/users/` API route
* [x] Enumerate users with `/rdf` or `/feed/rdf` appended to any route.

🛡️ [Wordfence](https://wordpress.org/plugins/wordfence/) or [Stop User Enumeration](https://wordpress.org/plugins/stop-user-enumeration/) can be used to block most of them. We can also use `.htaccess` rules or [WPS Hide Login](https://wordpress.org/plugins/wps-hide-login/).
</div></div>

<hr class="sep-both">

## WordPress — Website Exploitation

<div class="row row-cols-lg-2"><div>

#### WordPress Exploitation — Developer Files

* [x] Exposed /readme.html <small>(no use)</small>
* [x] Exposed /license.txt <small>(no use)</small>

#### WordPress Exploitation — XML RPC

XML RPC can be used to perform brute force attacks, SSRF attacks, and other attacks according to the enabled APIs.

* [x] Check if we can use `system.listMethods`
* [x] Check if we can use the method `system.multicall`
* [x] Check if we can use the method `pingback.ping` for SSRF
* [ ] Check if we can use the method `wp.getUsersBlogs` to brute force accounts. Refer to this [template](https://github.com/projectdiscovery/nuclei-templates/blob/main/http/vulnerabilities/wordpress/wp-xmlrpc-brute-force.yaml).

🛡️ [Wordfence](https://wordpress.org/plugins/wordfence/) can block brute force attempts for XML RPC. Otherwise, unused methods can be disabled using PHP code.

#### WordPress Exploitation — WP JSON

WordPress JSON API isn't interesting by default.

* [x] Check if there are new endpoints (`/wp/v2/`)
* [x] Check if there is a SSRF with Oembed <small>(misconfigured plugins)</small>
* [x] CORS may be enabled on `/wp-json/`  <small>(limited use)</small>

🛡️ Keep up-to-date plugins. Limit access to wp-json.
</div><div>

#### WordPress Exploitation — WP CRON

The [WP Cron](http://wp.sec2/wp-cron.php) module may have been enabled. We will never know unless we can see the website configuration enabling it. Hackers can attempt to use [doser](https://github.com/Quitten/doser.go) to DoS a website.

📚 We do not check for this vulnerability anymore.

#### WordPress Exploitation — Exposed Login Page

The `wp-login.php` page may be available. If so, we can:

* [x] The Login page has a different message if user exists
* [x] The Reset password page has a different message if user exists

The `wp-signup.php` page may be available. If so, we can:

* [x] Enumerate existing accounts
* [x] Get a foothold on the platform

🛡️ Hide the login page such as with [WPS Hide Login](https://wordpress.org/plugins/wps-hide-login/). Disable register.
</div></div>

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

* Plugin and theme names/versions are exposed within the website source code <small>(link/script)</small>. The URL may include the version.
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
* Admins can write HTML in comments, it will be executed, but not normal users
* Deactivating plugins doesn't remove its files
* Auto-update? (themes and plugins too)
* Install only trusted themes/plugins
* sucuri-scanner, better-wp-security

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
* `select user_login,user_pass from wp_users;`
* 10 levels of access, 5 (actually 6 with SA) roles
</div></div>