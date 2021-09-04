# Web programming

There are a lot of knowledge and things that would not be relevant if they were added in a language-specific (security, adaptability, tools, seo, the HTTP protocol, the developers' tools, the FTP protocol, setting up a server, etc). Web programming is including a lot

* the client-side, **Front-End**: interface between the back-end and the client
  * **HTML**: the code of the page
  * **CSS**: the design/style, you may use CSS frameworks (ex: Bootstrap)
  * **JS**: adding scripts
* the server-side, **Back-End**: how the request of the client is handled
  * **PHP**: the code generating the HTML? Provide an API to your services? You may look for PHP Frameworks <small>(Symfony, Laravel, etc.)</small>
  * **SQL**: or NoSQL/..., the data of your application
  * **Node.js**: an alternative to PHP
* **Full-Stack**: handling both Front and Back-End
  * React native (mobile)
  * Electron (desktop)

<hr class="sl">

## The HTTP protocol

You are using the HTTP protocol, when your browser is requesting something from a server. For instance, when you request `https://duckduckgo.com/`, you are asking the server to GET the page for this URL. We are currently in **HTTP2.0**, but a lot of persons are still using **HTTP1.1** (and some HTTP1.0).

<details class="details-border">
<summary>Webserver root and root URL</summary>

* when settings up a server, you will make a folder available at an URL. Let's say you made it like this
  * **webserver root**: `/path/to/www/`
  * **base/root url**: `https://myurl.com/`
* As you could guess, this is working like a path, so you could write `https://myurl.com/folder/my_file.html` for `/path/to/www/folder/my_file.html`
  * A lot of programmers are using routers, so this won't always be the case <small>(ex: this website)</small>
  * By default, if you don't write a file in the URL, then `index.html` <small>(or php, or index.extension, according to your configuration)</small> will be loaded <small>(if you got one)</small>
</details>

<details class="details-border" open>
<summary>The HTTP protocol (or HTTPS for HTTP secure) API is allowing us to use</summary>
<br>

* `GET URL`: get a resource from the SERVER
* `POST URL`: create a resource on the server <small>(ex: create an account)</small>
* `PUT URL`: modify a resource on the server <small>(ex: update an user's email, or add it if it didn't have one)</small>
* `PATCH`: same as PUT, but can't create a new resource
* `DELETE URL`: delete a resource on the server <small>(ex: delete account)</small>
</details>

Why did we learn this? Well, you will use this a lot (HTML forms, WEB APIs, etc.). In HTML, you will make forms (search, create users, etc.). You **need to know whether they are GET** (search, ...) **or POST** (create user). For Web APIs, this is usually written in the documentation, but you should be able to guess too.

Usually, in APIs, you got a route such as `/user/{id}` such (ex:`/user/5`) and according to if you are using the method GET/PUT/DELETE/..., the server will expect data (or not) and do something different.

<hr class="sl">

## Using the console

* press ``CTRL-SHIFT-I``
* or right click then inspect
* or ... > ... tools > development tools

In the console,

* in ``elements``, you can check out the
tags used inside the page.
* in ``console``, you can look for the javascript logs
and errors.
* in ``problems`` (+ > problems), you can look for ways
to improve your website

By pressing ``CTRL-SHIFT-C``, you can find the tag
in the HTML by simply moving your mouse.

<hr class="sr">

## Captcha

In some cases, you should use a captcha ("I'm not a robot").
Someone may write a script trying
to bruteforce your login form. You can add a captcha
and check on your server that the captcha got submitted
before processing the login form.

The most-well know solution is ReCaptcha (v2 / v3)
of google. In v3, you won't have to process a captcha
but google will watch what you are doing (mouse, ...)
and may request you to submit a captcha if your
(human) score is too low. Check their
tutorial [here](https://developers.google.com/recaptcha/intro)

* (v2) put a html tag looking like that `` <div class="g-recaptcha" data-sitekey=""></div>``
* (v2) in your PHP

```php
$post_data = array('secret' => 'your-secret-key', 'response' => 'data-site-key');
// send post request
// ...
// to https://www.google.com/recaptcha/api/siteverify
// and check the result
```

You may consider [hcaptcha](https://www.hcaptcha.com/) as
an alternative to ReCaptcha.

Adding a captcha should not be an easy choice. It may
not be a good idea.

* You can start first by limiting the number the number of request per ip and hour/...
* You can add a captcha if an user failed to login once
* or you can use something like ReCaptchaV3

What you need to remember is that, if most of the times
you have humans filling the captcha, then you should
really consider an alternative. On top of that, bots
can also bypass a captcha (at least it seems so but I
didn't try).

<hr class="sr">

## FileTransferProtocol (FTP)

You may have a remote server where your website
is hosted and you want to upload your files on it?
Well you may use the command ``scp`` but you may also
use the software [FileZilla](https://filezilla-project.org/).

* once started,
* File > Site Manager
* New site (give it a name in the left column)
  * SFTP (use ssh credentials to login)
  * host (ex: `pedago-etu.ensiie.fr`, server url)
  * ask for password
  * user (ex: `firstname.lastname`)
  * ok and close
* Then now that the config is saved,
* click on the right arrow near the logo below "File"
* click on the configuration name
* connect, click on "yes" (if first connection)
* then you should be able to browser, open, send/get
files on your remote server

Some IDE (integrated development environment) like
PHPStorm (Jetbrains) or VSCode allows you to directly code on the
server (if needed), you may have a course for them
in "tools".

<hr class="sl">

## SECURITY

Did you notice? I used UPPERCASE letters because it's important.
In HTML/CSS/JS, you can't do much since the user can
see and modify your code (console > sources) but well in
PHP, you will have to handle SQL injections (and many more). 

Aside from that, you will have advices in the CyberSecurity 
course, "web" section. You may look at the next part too.

<hr class="sr">

## Websites' improvements summary

I'm stacking here, everything that I learned to improve my websites. You should inspect first your website using online checkers

* you should known about <https://validator.w3.org/>
* but, you should look at <https://webhint.io/> too

**Accessibility**

* [Apple touch icon](accessibility/apple-touch.md)
* [Sitemap](accessibility/sitemap.md)

**SEO (Search Engine Optimization)**

* [Titles](seo/titles.md)
* [Descriptions](seo/descriptions.md)
* [OG/twitter meta](seo/og-twitter.md)
* [robots.txt](seo/robots.md)
* [human.txt](seo/human.txt.md)
* [Structured Data](seo/structured.md)
* [Scanners and SEO's tools](seo/tools.md)

**Security**

* [Hide Apache server version](security/apache.md)
* [add rel attribute to external links](security/links.md)
* [Website headers](security/headers.md)
* [Subresource Integrity](security/sri.md)

**Others**

* you may use images .webp images instead of PNG/JPG
* you may use [CDN](seo/cdn.md)
* you may use async/defer to delay the loading of your scripts