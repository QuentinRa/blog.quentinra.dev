# Apache server

[Go back](..)

...

<hr class="sr">

## Awstats

You generate reports from your apache logs using
**awstats**. It was used by OVH but they moved
to their own-made tool in the late 2020.

I used this with the command line, like this

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

Sources

* <https://www.maketecheasier.com/set-up-awstats-ubuntu/>
* <https://developers.bloomreach.com/blog/2012/Generating+Reports+from+Web+Logs+with+AWStats.html>
* <https://www.netadmintools.com/art511.html>