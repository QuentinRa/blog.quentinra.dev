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
$ cd /etc/apache2/conf-enabled/
$ cd /etc/apache2/conf-available/
$ tail /var/log/apache2/error.log
```
</div><div>

Enable configs/websites

```
$ sudo a2ensite test.conf
$ sudo a2dissite test.conf
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
</div></div>


<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

</div><div>

**[Old notes](_old.md)**

</div></div>