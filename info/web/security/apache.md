# Secure Apache Server

[Go back](../index.md#security)

This page's purpose is to list notes that can't be put into a topic-specific page such as SSL, or headers. I learned a lot from [this article about apache-security-tips by tecmint](https://www.tecmint.com/apache-security-tips/). Note that you can "generate" a secure configuration [using the Mozilla Generator](https://ssl-config.mozilla.org/#server=apache) and you may check [these configurations](https://syslink.pl/cipherlist/).

<hr class="sl">

## Use .htaccess

Once you enabled them, as I explained in the setup, you will be able to use `.htaccess`, meaning you will be able to override the configuration of the server in a repository and its sub-directories. You may [enjoy this cheatsheet](https://htaccesscheatsheet.com/).

**Some samples of code**

```apacheconf
# Disable directory browsing
Options All -Indexes

# Redirect everything (aside direct access)
# to index.php (when mod_rewrite is not installed)
<IfModule !mod_rewrite.c>
	ErrorDocument 404 index.php
</IfModule>

# deny access to every file (be it direct or not)
# you may allow localhost
order deny,allow
deny from all
# allow localhost
allow from 127.0.0.1

# create a redirect
Redirect 301 /duck https://duckduckgo.com/

# deny some directories
RewriteRule ^/?(\.git|logs|temp|vendor - [F]
# deny some files
RewriteRule /?(README.*|.ht*)$ - [F]

# limit size for uploads
LimitRequestBody 512000
```

Here is an example: **you want to deny everyone** to your folder **uploads**, aside from your website, and add a limit size for the file uploaded of 100ko. We are putting in `upload`, the `.htaccess`

```apacheconf
order deny,allow
deny from all
allow from 127.0.0.1
LimitRequestBody 102400
```