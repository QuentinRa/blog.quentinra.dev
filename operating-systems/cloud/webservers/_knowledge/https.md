# HTTPS Server

<div class="row row-cols-lg-2"><div>

You can get free SSL/TLS certificates using [Let's encrypt](https://letsencrypt.org/). If you want to have **https**://localhost, [follow this tutorial](https://web.dev/how-to-use-local-https/).

To install a certificate from Let's encrypt, we mostly use [certbot](https://certbot.eff.org/).

```powershell
$ sudo apt update
$ sudo apt install snapd
$ sudo snap install core
$ sudo snap refresh core
$ sudo snap install --classic certbot
$ sudo ln -s /snap/bin/certbot /usr/bin/certbot
```
</div><div>

Ex: To generate one certificate for two domains, on an [Apache](../apache/index.md) server.

```powershell
$ sudo certbot --apache --cert-name xxx.com -d xxx.com -d www.xxx.com
$ sudo certbot --apache -d xxx.com -d www.xxx.com
```

➡️ You can add as many domains as you want with `-d`.

For automatic renewal:

```powershell
$ sudo certbot renew --dry-run
```
</div></div>