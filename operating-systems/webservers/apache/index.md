# Apache2 webserver

😵 *Due to some mistake on my side, these notes were not tested (nor are complete) at all* 😵

<div class="row row-cols-md-2"><div>

**Apache** is a thread-per-request server, which is steadily being replaced by event-driven servers such as Nginx or Node.js.

```
$ sudo apt install apache2
```
</div><div>

👉 You may use an emulator instead of directly installing apache

* WAMP server <small>(Windows Apache MySQL PHP)</small> | [Notes](wamp.md) 🚀
* LAMP server <small>(Linux Apache MySQL PHP)</small>
* MAMP server <small>(macOS Apache MySQL PHP)</small>
* XAMPP <small>(Cross-platform Apache MySQL PHP Perl)</small>

**Where to learn**?

* [digitalocean](https://www.digitalocean.com/community/tags/apache) (🤗)
</div></div>

<hr class="sep-both">

## List of commands

<div class="row row-cols-md-2"><div>

You can use `systemctl` to handle the `apache2` service.

```
$ sudo systemctl stop apache2
$ sudo systemctl start apache2
$ sudo systemctl reload apache2
$ sudo systemctl restart apache2
$ sudo systemctl status apache2
# non-root
$ systemctl status apache2
```

Apache2 files are located in

```
$ cd /etc/apache2/conf-available/
$ cd /etc/apache2/conf-enabled/ # copies
$ cd /etc/apache2/sites-available/
$ cd /etc/apache2/sites-enabled/ # copies
$ tail /var/log/apache2/access.log
$ tail /var/log/apache2/error.log
```

Enable configs/virtual hosts

```
# create a conf for each website
$ cp 000-default.conf example.com.conf
$ sudo a2ensite example.com.conf
$ sudo a2dissite example.com.conf
$ sudo apache2ctl configtest
```
</div><div>

When installing a PHP module, you can enable its configuration, and the specific functions of the module using apache without having to edit each `php.ini`.

```
$ sudo apt install php-mbstring
$ sudo a2enconf php7.4-mbstring
$ sudo a2enmod php7.4-mbstring
```

Some modules

```
$ sudo a2enmod mod_headers
$ sudo a2enmod headers
$ sudo a2enmod ssl
$ sudo a2enmod rewrite
```

Create a folder `xxx` for a website, in `/var/www/` <small>(usual folder than www-data can read/edit)</small> for a non-root user `yyy`.

```
$ sudo mkdir -p /var/www/xxx/
$ sudo chown -R yyy:yyy /var/www/xxx/
$ sudo chmod -R 755 /var/www/xxx/
```

Sometimes, you may have permissions problems. You need to investigate the problem, but one way to fix it is to give `www-data` the ownership over a directory <small>(allowing they to create/edit files)</small>.

```
sudo chown -R www-data:www-data folder/
```
</div></div>

<hr class="sep-both">

## HTTP2

<div class="row row-cols-md-2"><div>

See also [http2.pro](https://http2.pro/doc/Apache).

First, you must indicate that your server supports HTTP2, or HTTP1.1 as fallback. You must add this in your virtual hosts `.conf`.

```apacheconf
Protocols h2 http/1.1
```

```
$ sudo a2enmod http2
$ sudo systemctl start apache2 # ❌ don't
```
</div><div>

If you tried to start the server, you will see an error in `error.log`.

```
$ sudo systemctl stop apache2
$ sudo apt install php7.1-fpm
$ sudo a2enmod proxy_fcgi setenvif
$ sudo a2enconf php7.1-fpm
$ sudo a2dismod php7.1
$ sudo a2dismod mpm_prefork
$ sudo a2enmod mpm_event
$ sudo systemctl start apache2
```
</div></div>

<hr class="sep-both">

## Apache .htaccess

<div class="row row-cols-md-2"><div>

This is a file used to edit the virtual host configuration locally. Simply create a file `.htaccess` with some instructions inside.

A `.htaccess` is applied to a directory and it's subdirectories. Every `.htaccess` in the path to the resource will be loaded. ➡️ In case of conflit, the nearest (latest) instruction is used.

➡️ See [htaccess cheatsheet](https://htaccesscheatsheet.com/).

#### Random instructions

<p></p>

```apacheconf
# Disable directory browsing
Options All -Indexes

# Redirect everything (aside from direct access)
# to index.php (when mod_rewrite is not installed)
<IfModule !mod_rewrite.c>
	ErrorDocument 404 index.php
</IfModule>

# Add a redirection
Redirect 301 /duck https://duckduckgo.com/

# Deny access to some directories/files
RewriteEngine on
RewriteRule ^/?(\.git|logs|temp|vendor - [F]
RewriteRule /?(README.*|.ht*)$ - [F]

# Limit the size of uploads
LimitRequestBody 512000
```
</div><div>

#### Example: block access to everyone aside from localhost

This could be used to only allow a website to access some files such as uploaded avatars. Only `127.0.0.1` can request a resource.

```apacheconf
order deny,allow
deny from all
allow from 127.0.0.1
```

<br>

#### Example: ask for basic authentication

The server will ask for a username, and a password.

```apacheconf
AuthUserFile /path/to/some/.htpasswd
AuthName "Protected Files"
AuthType Basic
# username allowed: xxx
Require user xxx
```

And you need an additional file: `/path/to/some/.htpasswd`

```apacheconf
# username:hashed_password (htpasswd command?)
xxx:$apr1$8KSS.TIW$qWKI88AFeMSl3iemCuUCk/
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* `apache2ctl restart`
* [Apache Security](https://www.tecmint.com/apache-security-tips/)

```apacheconf
AllowOverride All
```
</div><div>
</div></div>