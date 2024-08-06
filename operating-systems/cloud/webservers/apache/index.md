# Apache2 web server

<div class="row row-cols-lg-2"><div>

**Apache** is a thread-per-request server, that is steadily being replaced by event-driven servers such as Nginx or Node.js.

```ps
$ sudo apt install apache2
```

Apache's configuration is found at `/etc/apache2/apache2.conf`.
</div><div>

👉 You may use an emulator instead of directly installing Apache

* WAMP server <small>(Windows Apache MySQL PHP)</small> | [Notes](wamp.md) 🚀
* LAMP server <small>(Linux Apache MySQL PHP)</small>
* MAMP server <small>(macOS Apache MySQL PHP)</small> | [Notes](mamp.md) ☠️
* XAMPP <small>(Cross-platform Apache MySQL PHP Perl)</small>

**Where to learn**?

* [digitalocean](https://www.digitalocean.com/community/tags/apache) (🤗)
</div></div>

<hr class="sep-both">

## List of commands

<div class="row row-cols-lg-2"><div>

You can use `systemctl` to handle the `apache2` service.

```shell!
$ sudo systemctl stop apache2
$ sudo systemctl start apache2
$ sudo systemctl reload apache2
$ sudo systemctl restart apache2
$ systemctl status apache2
```

Apache2 files are located in

```shell!
$ cd /etc/apache2/conf-available/  # configurations
$ cd /etc/apache2/conf-enabled/    # copies
$ cd /etc/apache2/sites-available/ # websites
$ cd /etc/apache2/sites-enabled/   # copies
$ tail /var/log/apache2/access.log
$ tail /var/log/apache2/error.log
```

Enable a website

```shell!
$ cp 000-default.conf example.com.conf # one per website
$ sudo a2ensite example.com.conf
$ sudo a2dissite example.com.conf
$ sudo apache2ctl configtest
```

Enable a configuration

```shell!
$ sudo a2enconf some_header.conf
```
</div><div>

Some modules

```shell!
$ sudo a2enmod http2
$ sudo a2enmod headers
$ sudo a2enmod ssl
$ sudo a2enmod rewrite
```

Create a folder `xxx` for a website, in `/var/www/` <small>(usual folder that www-data can read/edit)</small> for a non-root user `yyy`.

```shell!
$ sudo mkdir -p /var/www/xxx/
$ sudo chown -R yyy:yyy /var/www/xxx/
$ sudo chmod -R 755 /var/www/xxx/
```

Sometimes, you may have permission problems. You need to investigate the problem, but one way to fix it is to give `www-data` the ownership over a directory <small>(allowing them to create/edit files)</small>.

```shell!
$ sudo chown -R www-data:www-data folder/
```
</div></div>

<hr class="sep-both">

## HTTP2

<div class="row row-cols-lg-2"><div>

See also [http2.pro](https://http2.pro/doc/Apache).

First, you must indicate that your server supports HTTP2, or HTTP1.1 as a fallback. You must add this to your virtual hosts `.conf`.

```apacheconf!
Protocols h2 http/1.1
```

```shell!
$ sudo a2enmod http2
$ sudo systemctl start apache2 # ❌ don't
```
</div><div>

If you try to start the server, you will see an error in `error.log`.

```shell!
$ version=7.1
$ sudo apt install php-fpm
$ sudo a2enmod proxy_fcgi setenvif
$ sudo a2enconf php${version}-fpm
$ sudo a2dismod php${version}
$ sudo a2dismod mpm_prefork
$ sudo a2enmod mpm_event
$ sudo systemctl restart apache2
```
</div></div>

<hr class="sep-both">

## Apache .htaccess

<div class="row row-cols-lg-2"><div>

This is a file used to edit the virtual host configuration locally. Simply create a file `.htaccess` with some instructions inside.

```apacheconf!
<Directory "/var/www/html">
    # Specific categories like AuthConfig, FileInfo, Indexes, Limit, Options, Redirect, etc.
    AllowOverride All
    AllowOverride None
    AllowOverride FileInfo Indexes
</Directory>
```

A `.htaccess` is applied to a directory and its subdirectories. Every `.htaccess` in the path to the resource will be loaded. ➡️ In cases of conflict, the nearest (latest) instruction is used.

➡️ See [htaccess cheatsheet](https://htaccesscheatsheet.com/).

#### Example: block access to everyone aside from localhost

This could be used to only allow a website to access some files such as uploaded avatars. Only `127.0.0.1` can request a resource.

```apacheconf!
# Required For Apache 2.4+
Require all granted
# Deny/Allow IPs
order deny,allow
deny from all
allow from 127.0.0.1
```

<br>

#### Example: prompt for basic authentication

The server shows a popup asking for a username, and a password.

```apacheconf!
AuthUserFile /path/to/some/.htpasswd
AuthName "Protected Files"
AuthType Basic
# username allowed: xxx
Require user xxx
```

And you need an additional file: `/path/to/some/.htpasswd`

```apacheconf!
# username:hashed_password (htpasswd command?)
xxx:$apr1$8KSS.TIW$qWKI88AFeMSl3iemCuUCk/
```
</div><div>

#### Examples: Redirections And URL Rewrite

You can define the 404 Page, perform redirections, define forbidden pages, etc. You can even perform routing such as with `/toto` that internally loads `dummy.php`.

```apacheconf!
# Redirect everything (aside from direct access)
# to index.php (when mod_rewrite is not installed)
<IfModule !mod_rewrite.c>
	ErrorDocument 404 ./index.php
</IfModule>

# Add a redirection
Redirect 301 /duck https://example.com/duck

# Deny access to some directories/files
RewriteEngine on
RewriteRule ^/?(\.git|logs|temp|vendor - [F]
RewriteRule /?(README.*|.ht*)$ - [F]
RewriteRule ^toto$ dummy.php [L]
```

#### Random instructions

<p></p>

```apacheconf!
# Disable directory browsing
Options All -Indexes

# Limit the size of uploads
LimitRequestBody 512000
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* `/etc/apache2/envvars`
* `apache2ctl restart`
* [Apache Security](https://www.tecmint.com/apache-security-tips/)

```apacheconf!
AllowOverride All
```

* Disable all ssl aside from TLS 1.2+

```apacheconf!
# edit /etc/apache2/sites-available/some_config.conf
# Protocols: TLS 1.2, TLS 1.3
SSLProtocol -all +TLSv1.3 +TLSv1.2
# restart: sudo service apache2 restart
```

```apacheconf!
# edit /etc/apache2/sites-available/some_config.conf
# append either 1) 2), 3) or sometime else
# don't forget to restart when you're done
# sudo service apache2 restart
SSLCipherSuite SOME_ALGS_HERE
SSLHonorCipherOrder on
```

Headers

```bash!
sudo nano /etc/apache2/conf-enabled/security.conf
# ServerSignature Off
# ServerTokens Prod
```

```shell!
$ sudo a2query -m
$ sudo a2enconf # select a conf
$ sudo a2enmod  # select a mod
```
</div><div>

OCSP Stapling

```apacheconf!
# use either 1) or 2), don't forget to restart
# restart: sudo service apache2 restart

# Proposition 1)
# edit /etc/apache2/sites-available/some_config.conf
# near the end
SSLUseStapling On
SSLStaplingCache "shmcb:logs/ssl_stapling(32768)"

# Proposition 2)
# in /etc/apache2/mods-available/ssl.conf
# near the end
SSLUseStapling On
SSLStaplingCache shmcb:${APACHE_RUN_DIR}/ssl_stapling(32768)
```

* [SSLCompression](https://httpd.apache.org/docs/trunk/mod/mod_ssl.html#sslcompression) disabled by default, should stay disabled to prevent attacks such as [CRIME](https://en.wikipedia.org/wiki/CRIME).

* [SSLSessionTickets](https://httpd.apache.org/docs/trunk/mod/mod_ssl.html#sslsessiontickets): **MUST BE DISABLED** (enabled by default) if you are not restarting your server periodically

```apacheconf
SSLSessionTickets off
```

Permissions for files/folders.

```powershell
# ➡️ If you're using public_html
$ chmod 711 ~
$ chmod 711 ~/public_html
# ➡️ The least permissions
$ chmod 600 file.php # for a .php
$ chmod 644 file.html # for a .html
$ chmod 711 folder # for a folder
```
</div></div>