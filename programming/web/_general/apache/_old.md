# Apache server

**[Updated notes](index.md)**

I'm not an expert in setting up an Apache Server. I'm quite fond of [Digital ocean tutorials](https://www.digitalocean.com/community/tutorials/how-to-install-the-apache-web-server-on-debian-10) (or [this one for MariaDB+PHP](https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mariadb-php-lamp-stack-on-debian-10)).

My notes

* You may enable .htaccess with `AllowOverride All`.
* You can add SSL certificates with [Let's encrypt](https://certbot.eff.org/lets-encrypt/debianbuster-apache)
* The logs are inside `/var/log/apache2` (default)
* You can configure [Postfix](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-postfix-as-a-send-only-smtp-server-on-debian-10) to send mails. This is complex, and I read a lot of tutorials (DMarc, SPF, DKim, etc.). You may use [mail-tester.com](https://www.mail-tester.com/) to test your server (don't forget to wait for around 12h before checking again).

Some commands you may use

```bash
# create a conf for each website
cp /etc/apache2/sites-available/000-default.conf  /etc/apache2/sites-available/example.com.conf
# complete it (add *:443, redirect www to without www)
# enable SSL, add Protocols, etc.
vim /etc/apache2/sites-available/example.com.conf
# once you're done, enable the conf
sudo a2ensite example.com.conf
# test config
sudo apachectl configtest
# restart
sudo systemctl reload apache2
```

<hr class="sl">

## HTTP2.0

You should have a line like this in your conf: `Protocols h2 http/1.1` (if not, add it, in VirtualHost). If not, then add it. It means that if h2 is available, then it will be used, otherwise, http/1.1 will be used. Then, server-side, you should use these commands to enable HTT2 (short version of this [complete guide](https://http2.pro/doc/Apache)).

```bash
# you will have to add sudo/use root
a2enmod http2
apachectl restart

apachectl stop
# if needed
apt-get install php7.1-fpm
a2enmod proxy_fcgi setenvif
a2enconf php7.1-fpm
# it won't really disable php7.1
a2dismod php7.1
a2dismod mpm_prefork
a2enmod mpm_event
apachectl start
```

<hr class="sr">

## Reports/Website stats

<details>
<summary>You generate reports from your Apache logs using <b>awstats</b>. It was used by OVH, but they moved to their own-made tool in late 2020. I used it with the command line, like this</summary>

```bash
sudo apt-get install htmldoc
wget https://prdownloads.sourceforge.net/awstats/awstats-7.8.tar.gz
sudo mkdir /usr/local/awstats
sudo mv awstats-7.8/* /usr/local/awstats

# generate (once)
cd /usr/local/awstats/
./tools/awstats_configure.pl
# -----> Check for web server install
# > none
# -----> Need to create a new config file ?
# ... file (required if first install) [y/N] ? y
# -----> Define config file name to create
# > website_url_or_name
# -----> Define config file path
# > /etc/awstats
# result:
cat /etc/awstats/awstats.website_url_or_name.conf

# update
sudo perl wwwroot/cgi-bin/awstats.pl -config=website_url_or_name -update
# generate
sudo perl /usr/local/awstats/tools/awstats_buildstaticpages.pl -config=website_url_or_name -month=all -year=2020 -dir=/tmp/folder/ -buildpdf=/usr/bin/htmldoc
# PDF file is 'awstats.website_url_or_name.pdf'
ls -la /tmp/folder/awstats.website_url_or_name.pdf
```
</details>

You can also check [goaccess](https://goaccess.io/).