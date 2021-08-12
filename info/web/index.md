# Introduction

When you write some URL in your browser, 
you requested a page to a server. 
The server returns to you a make page, written in **HTML**.
When making a website, you got two sides to handle

* the client-side, Front-End: what's the client will see
* the server-side, Back-End: how you will handle the client request

The languages used in Web are

* **HTML**: making a page
* **CSS**: adding CSS animations, style, ...
* **JS**: adding JS animations, scripts, ...
* **PHP** (+SQL): the server-side logic
* **Node.js**: an alternative to PHP
* **TypeScript**: "JavaScript with a compiler"

The most well-known website to learn web development
is [W3School](https://www.w3schools.com/) but most of the
developers learn the basics the look at
stack overflow issues when they got a problem.

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
PHP, you will have a part about SQL injections. 

Aside from that, you will have advices in the CyberSecurity 
course, "web" section. You may look at the next part too.

<hr class="sr">

## Websites' improvements summary

I'm stacking here, every thing I learned as to
improve my websites. You should inspect your website
using online checkers

* you should known about <https://validator.w3.org/>
* but you should look at <https://webhint.io/> (better)

**Accessibility**

* [Apple touch icon](accessibility/apple-touch.md)
* [Sitemap](accessibility/sitemap.md)

**SEO (Search Engine Optimization)**

* [Titles](seo/titles.md)
* [robots.txt](seo/robots.md)
* [Scanners and SEO's tools](seo/scanners.md)

**Security**

* [Hide Apache server version](security/apache.md)
* [add rel attribute to external links](security/links.md)
* [Website headers](security/headers.md)
* [Subresource Integrity](security/sri.md)

**Others**

* you may use images .webp images instead of PNG/JPG
* you may use async/defer to delay the loading of your scripts