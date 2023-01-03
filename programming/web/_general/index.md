# Web development

...

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