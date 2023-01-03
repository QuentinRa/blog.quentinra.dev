# Web development

Web development is usually divided between two sides:

<div class="row row-cols-md-2"><div>

👲 **Front-end** 👲

What is displayed to the user.

* HTML, CSS, JS
* Bootstrap, tailwindcss...
* Vue.js, React, Angular, Ionic
* ...
</div><div>

🌍 **Back-end** 🌍

The servers, the databases, and basically everything else.

* PHP, Django, Symfony, Laravel...
* SQL, NoSQL
* Node.js, Express.js, Nest.js...
* ...
</div></div>

There is also 👑 **Full-Stack** 👑 which is both Front+Back-end, along Mobiles <small>(React Native...)</small> and Desktops <small>(Electron...)</small>

<hr class="sep-both">

## Get started

<div class="row row-cols-md-2"><div>

Browsers are using the [HTTP](/it/networking/protocols/index.md#-http---80-tcp) protocol to communicate with a webserver. The server is supposed to return an **HTML page**.

**No router - HTML**

By default, there is usually no router. It means that if the user enter the URL `https://example.com/folder/file.html`, the webserver will look for `folder/file.html` inside `/var/www/` <small>(according to the webserver configuration, the file may be somewhere else)</small>.

➡️ If the URL doesn't ends with a file, then if there is a file called `index.html` inside `/var/www/` <small>(...)</small>, then it will be loaded.
</div><div>

**No router - PHP**

Using PHP, the behavior is the same as HTML, except that PHP files are generating a HTML. We have the same behavior with `index.php` that we had with `index.html`.

➡️ Which one of `index.php` or `index.html` is loaded first, if both are present, is determined by your configuration.

**Router - Any**

Most websites are using a router. This reduces securities issues. Every URL will redirect to one same file, and this file will determine which HTML page should be returned.
</div></div>


<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet. [Old](_old/general/index.md) and [Pages](_old/pages.md).

<div class="row row-cols-md-2"><div>

**Random**

* Bootstrap icons/others
* color picker (console)
* free hosting (webhostapp, [kinsta](https://kinsta.com/)). See also, GitHub pages...

**Apps**

* CDNs ([keycdn](https://www.keycdn.com/))
* semantic web ([protege](https://protege.stanford.edu/))
* progressive web apps (PWA)
* [webhint](https://webhint.io/)
</div><div>

URLs

* `href=#`
* `href=#id`
* `mailto:email`
* `index.html` / how to load an HTML file

SEO

* [nitropack](https://nitropack.io/)
* [statshow](https://www.statshow.com/) (stats)

SSL (see [Let's encrypt](https://certbot.eff.org/lets-encrypt/debianbuster-apache))

```
sudo certbot --apache --cert-name xxx.com -d xxx.com -d www.xxx.com
sudo certbot --apache -d xxx.com -d www.xxx.com
sudo certbot renew --dry-run
```

* You can configure [Postfix](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-postfix-as-a-send-only-smtp-server-on-debian-10) to send mails. This is complex, and I read a lot of tutorials (DMarc, SPF, DKim, etc.). You may use [mail-tester.com](https://www.mail-tester.com/) to test your server (don't forget to wait for around 12h before checking again).

wamp

* <https://sourceforge.net/projects/wampserver/>
* Update
* Download addons

<details>
<summary>You generate reports from your Apache logs using <b>awstats</b></summary>

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

* [GoAccess](https://goaccess.io/)
</div></div>