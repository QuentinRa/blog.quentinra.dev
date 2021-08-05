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