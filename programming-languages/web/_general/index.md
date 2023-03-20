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

There is also 👑 **Full-Stack** 👑 which is both Front+Back-end, along Mobiles <small>(React Native...)</small> and Desktops <small>(Electron...)</small>.

<hr class="sep-both">

## Get started

<div class="row row-cols-md-2"><div>

Browsers are using the [HTTP](/_it/networking/protocols/index.md#-http---80-tcp) protocol to communicate with a webserver. The server is supposed to return an **HTML page**.

* 👉 If there are no routing, the URL is associated with a local path on the server, and the file is loaded if present.

* 👉 If there is no file in the URL, webservers may load `index.html`/`index.php`/... if present.

* 👉 Modern apps are usually using a router. This reduces securities issues. Every URL will be redirected to one file, and this file will determine which HTML page should be returned.
</div><div>

**What do you need?**

To develop simple HTML websites, you don't need anything, you can use the `file://` protocol <small>(drag and drop the HTML in your browser)</small>.

For more complex apps <small>(PHP, HTTPS...)</small>, you must install a webserver such as Apache, Nginx, Node, IIS...

➡️ To upload things on a remote server, see the [FTP protocol](/operating-systems/networking/knowledge/_protocols/file-transfer.md).

</div></div>

<hr class="sep-both">

## Webserver configuration notes

😵 *Due to some mistake on my side, these notes were not tested (nor complete) at all* 😵

<div class="row row-cols-md-2"><div>

Change the password of the user provided by the hosting provider.

```powershell
$ sudo passwd xxx
```

Upgrade packages.

```
$ sudo apt update
$ sudo apt upgrade
$ sudo apt-get dist-upgrade
```

Disable `ssh` login for root/..., and change the default port.

```powershell
$ sudo vim /etc/ssh/sshd_config
$ sudo systemctl restart sshd
```

Install a firewall.

```powershell
$ sudo apt install fail2ban
$ sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
$ sudo vim /etc/fail2ban/jail.local
```
</div><div>

Add a non-root user.

```powershell
$ sudo adduser yyy
```

Permissions for files/folders.

```powershell
# ➡️ If you're using public_html
$ chmod 711 ~
$ chmod 711 ~/public_html
# ➡️ The least permissions
$ chmod 700 file.php # for a .php
$ chmod 744 file.html # for a .html
$ chmod 711 folder # for a folder
```
</div></div>

<hr class="sep-both">

## HTTPS, and TLS/SSL

<div class="row row-cols-md-2"><div>

You can get free certificates using [Let's encrypt](https://letsencrypt.org/). If you want to have **https**://localhost, [follow this tutorial](https://web.dev/how-to-use-local-https/).

To install a certificate from Let's encrypt, we mainly use [certbot](https://certbot.eff.org/).

```powershell
$ sudo apt update
$ sudo apt install snapd
$ sudo snap install core
$ sudo snap refresh core
$ sudo snap install --classic certbot
$ sudo ln -s /snap/bin/certbot /usr/bin/certbot
```
</div><div>

Ex: To generate one certificate for two domains, on an apache server.

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

The devtools are tools for developer. You can open it using

* <kbd>F12</kbd> or <kbd>Left-click > Inspect</kbd> ✨
* <kbd>Settings > ... tools > development tools</kbd> 😅

The 4 most used tools are

* **Tools > elements** <span class="small">(<kbd>CTRL+SHIFT+I</kbd>)</span>**: see/edit the HTML/CSS
* **Tools > <i class="bi bi-box-arrow-in-up-left"></i>** <span class="small">(<kbd>CTRL+SHIFT+C</kbd>)</span>: select a element and see the correspond HTML code in the Element tab.
* **Tools > <i class="bi bi-window"></i>** <span class="small">(<kbd>CTRL+SHIFT+M</kbd>)</span>: preview the website on a phone...
* **Tools > Console**: execute some JavaScript, try: `41+1`
</div><div>

There are a lot more tools. If some are not available for you, you may have to enabled them <small>(see "+" in Edge, see "... > more tools" in Chrome...)</small>.

* **Tools > Sources** 🕵️: see the code source of the page
* **Tools > Application** 🪄: see the local storage, the cookies, etc.
* **Tools > Problems** 🧟: you can see problems using webhint
* **Tools > LightHouse** 🥇: you can see the evaluation of a page by LightHouse (Google)

➡️ There is also a color picker, allowing you to find which color was used somewhere on a website.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

**Apps**

* progressive web apps (PWA)

```
URL
* Scheme: (protocol) HTTP/HTTPS/...
* Username:Password@Domain:port/Path?query#Fragment_or_Hash
```
</div><div>

* [Postfix](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-postfix-as-a-send-only-smtp-server-on-debian-10) to send mails. See also DMarc, SPF, DKim, and [mail-tester.com](https://www.mail-tester.com/) <small>(wait XXX hours for DNS records changes)</small>.
* Awstats/[GoAccess](https://goaccess.io/) for stats
</div></div>