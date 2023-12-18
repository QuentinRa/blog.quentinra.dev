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
* 5 levels of access
</div></div>