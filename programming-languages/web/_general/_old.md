# Get started

<div class="row row-cols-md-2"><div>

Browsers use the [HTTP](/operating-systems/networking/protocols/http.md) protocol to communicate with a web server. The server responds with an **[HTML page](../html/index.md)**.

* 👉 If there is no routing, the [URL](random/url.md) is associated with a local path on the server, and the file is loaded if present.

```text!
URL: http://localhost/example/file.html
Possible path resolved: /var/www/example/file.html
```

* 👉 If there is no file in the URL, web servers may load `index.html`/`index.php`/... if present.

```text!
URL: http://localhost/example/
Possible path resolved: /var/www/example/index.html
```

* 👉 Modern apps are usually using a router. This reduces securities issues. Every URL will be redirected to a routing file which will determine which HTML page should be returned.

```text!
URL: http://localhost/example/
Request send to: some_router.php 
Possible path resolved: /var/www/file.html
```

</div><div>

**What do you need?**

To develop simple HTML websites, you don't need anything, you can use the `file://` protocol <small>(drag and drop the HTML in your browser)</small>.

For more complex apps <small>(PHP, HTTPS...)</small>, you must install a web server such as [Apache](/operating-systems/webservers/apache/index.md), Nginx, Node, IIS...

➡️ To upload files to a remote server, use secure variants of the [FTP](/operating-systems/networking/protocols/ftp.md) protocol such as [SCP](/operating-systems/networking/protocols/scp.md) or SFTP.

Permissions for files/folders.

```powershell
# ➡️ If you're using public_html
$ chmod 711 ~
$ chmod 711 ~/public_html
# ➡️ The least permissions
$ chmod 600 file.php # for a .php
$ chmod 644 file.html # for a .html
$ chmod 711 folder # for a folder
```
</div></div>

<hr class="sep-both">

## HTTPS, and TLS/SSL

<div class="row row-cols-md-2"><div>

You can get free certificates using [Let's encrypt](https://letsencrypt.org/). If you want to have **https**://localhost, [follow this tutorial](https://web.dev/how-to-use-local-https/).

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

Ex: To generate one certificate for two domains, on an Apache server.

```powershell
$ sudo certbot --apache --cert-name xxx.com -d xxx.com -d www.xxx.com
$ sudo certbot --apache -d xxx.com -d www.xxx.com
```

➡️ You can add as many domains as you want with `-d`.

For automatic renewal

```powershell
$ sudo certbot renew --dry-run
```
</div></div>

<hr class="sep-both">

## 😍 Developer tools (devtools) 😍

<div class="row row-cols-md-2"><div>

The devtools are tools for developers. You can open it using

* <kbd>F12</kbd> or <kbd>Left-click > Inspect</kbd> ✨
* <kbd>Settings > ... tools > development tools</kbd> 😅

The 4 most used tools are

* **Tools > elements** <span class="small">(<kbd>CTRL+SHIFT+I</kbd>)</span>: see/edit the HTML/CSS
* **Tools > <i class="bi bi-box-arrow-in-up-left"></i>** <span class="small">(<kbd>CTRL+SHIFT+C</kbd>)</span>: select an element and see the corresponding HTML code in the Element tab.
* **Tools > <i class="bi bi-window"></i>** <span class="small">(<kbd>CTRL+SHIFT+M</kbd>)</span>: preview the website on a phone...
* **Tools > Console**: execute some JavaScript, try: `41+1`
</div><div>

There are a lot more tools. If some are not available for you, you may have to enable them <small>(see "+" in Edge, see "... > more tools" in Chrome...)</small>.

* **Tools > Sources** 🕵️: see the code source of the page
* **Tools > Application** 🪄: see the local storage, the cookies, etc.
* **Tools > Problems** 🧟: you can see problems using webhint
* **Tools > LightHouse** 🥇: you can see the evaluation of a page by LightHouse (Google)

➡️ There is also a color picker, allowing you to find which color was used somewhere on a website.
</div></div>