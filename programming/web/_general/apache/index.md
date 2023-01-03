# Apache2 webserver

😵 *Due to some mistake on my side, these notes were not tested at all* 😵

<div class="row row-cols-md-2"><div>

**Apache** is a thread-per-request server, which is steadily being replaced by event-driven servers such as Nginx or Node.js.

```
$ sudo apt install apache2
```
</div><div>

🌍 You may use an emulator instead of directly installing apache

* WAMP server <small>(Windows Apache MySQL PHP)</small>
* LAMP server <small>(Linux Apache MySQL PHP)</small>
* MAMP server <small>(macOS Apache MySQL PHP)</small>
* XAMPP <small>(Cross-platform Apache MySQL PHP Perl)</small>

**Where to learn**?

* [digitalocean](https://www.digitalocean.com/community/tags/apache) (🤗)
</div></div>

<hr class="sep-both">

## Optional (for online servers)

<div class="row row-cols-md-2"><div>

Change the default password of the provided user.

```
$ sudo passwd xxx
```

Upgrade packages.

```
$ sudo apt update
$ sudo apt upgrade
$ sudo apt-get dist-upgrade
```

Disable `ssh` login for root/..., and change the default port.

```
$ sudo vim /etc/ssh/sshd_config
$ sudo systemctl restart sshd
```
</div><div>

Install a firewall.

```
$ sudo apt install fail2ban
$ sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
$ sudo vim /etc/fail2ban/jail.local
```

Add a non-root user.

```
$ sudo adduser yyy
```
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
</div><div>

Enable configs/websites

```
# create a conf for each website
$ cp 000-default.conf example.com.conf
$ sudo a2ensite example.com.conf
$ sudo a2dissite example.com.conf
$ sudo apache2ctl configtest
```

Some modules

```
$ sudo a2enmod http2
$ sudo a2enmod mod_headers
$ sudo a2enmod headers
$ sudo a2enmod ssl
$ sudo a2enmod rewrite
```

Create a website in `var` for a non-root user `yyy`.

```
$ sudo mkdir -p /var/www/xxx/
$ sudo chown -R yyy:yyy /var/www/xxx/
$ sudo chmod -R 755 /var/www/xxx/
```
</div></div>

<hr class="sep-both">

## HTTP2.0 (old)

<div class="row row-cols-md-2"><div>

First, you must indicate that your server supports HTTP2, or HTTP1.1 as fallback. You must add this in your virtual hosts `.conf`.

```
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

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

```
AllowOverride All
```
</div><div>

* `apache2ctl restart`

</div></div>