# Logs analyzers

<div class="row row-cols-lg-2"><div>

Logs analyzers can analyze [Apache logs](../apache/index.md) or other webservers and provide reports about stuff like:

* 💎 URLs with the most visits
* 🛣️ Referring URLs <small>(The URL a visitor was on before coming to your site)</small>
* 🌍 Visitor geography statistics <small>(IP geolocation...)</small>
* 🔥 HTTP response codes (e.g., 200, 404) for URLs
* 🕒 Time spent on pages
* 💻 Devices, browsers, and operating systems used by visitors
* 🚀 The fastest or 🐢 the slowest loading pages
* ...
</div><div>

**Some log analyzers**

* AWStats
* Webalizer
* [GoAccess](https://goaccess.io/)
* Splunk
* ...
</div></div>

<hr class="sep-both">

## AWStats

<div class="row row-cols-lg-2"><div>

[Advanced Web Statistics](https://github.com/eldy/awstats/) <small>(AWStats, 0.3k ⭐)</small> is an open-source log file analyzer supporting many log formats.

```shell!
$ sudo apt-get install htmldoc
$ wget https://prdownloads.sourceforge.net/awstats/awstats-7.8.tar.gz
$ sudo mkdir /usr/local/awstats
$ sudo mv awstats-7.8/* /usr/local/awstats
```

You need to generate config files:

```shell!
$ cd /usr/local/awstats/
$ # Possible answers:
$ # none, yes, website_URL_or_name, /etc/awstats
$ ./tools/awstats_configure.pl
$ cat /etc/awstats/awstats.website_URL_or_name.conf
```
</div><div>

Before generating a report, you need to update the database:

```shell!
$ sudo perl wwwroot/cgi-bin/awstats.pl -config=website_URL_or_name -update
```

To generate a report <small>(ex: for every month of 2020)</small>:

```shell!
$ sudo perl /usr/local/awstats/tools/awstats_buildstaticpages.pl -config=website_URL_or_name -month=all -year=2020 -dir=/tmp/ -buildpdf=/usr/bin/htmldoc
$ xdg-open /tmp/awstats.website_URL_or_name.pdf
```
</div></div>