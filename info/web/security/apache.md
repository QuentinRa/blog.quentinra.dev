# Secure Apache Server

[Go back](../index.md#websites-improvements-summary)

I'm not an expert in Security, but this is what I took note of. I learned a lot from [this article about apache-security-tips by tecmint](https://www.tecmint.com/apache-security-tips/).

<hr class="sl">

## Hide Apache server version

I was hiding my apache version in a .htaccess, but that's not nearly enough. On Debian, I did

```bash
sudo nano /etc/apache2/conf-enabled/security.conf
# ServerSignature Off
# ServerTokens Prod
sudo service apache2 restart
```

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
# you may allows localhost
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