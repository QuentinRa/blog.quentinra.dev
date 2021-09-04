# Captcha

[Go back](../index.md#security)

In some cases, you should use a captcha ("**I'm not a robot**"). Someone may write a script trying to bruteforce your login form. You can add a captcha and check on your server that the captcha got submitted before processing the login form.

The most-well know solution is **ReCaptcha** (v2 / v3), proposed bt Google. In v3, you won't have to process a captcha but Google will watch what you are doing (mouse, ...), and may request you to submit a captcha if your (human) score is too low. Check their [tutorial here](https://developers.google.com/recaptcha/intro).

You may consider [hcaptcha](https://www.hcaptcha.com/) as an **alternative to ReCaptcha**. But it had quite a lot of criticism for being hard to solve (<s>or maybe their where Google employees 🤣</s>). From my point of view, it indeed sometimes hard to solve, and even TryHackMe, the ones that made me discover hcaptcha, moved to ReCaptcha (v2).

Adding a captcha should not be an easy choice. It may not be a good idea.

* You can start first by limiting the number the number of request per ip and hour/...
* You can add a captcha if an user failed to login once

What you need to remember is that, **if almost every person filling your captcha are human**, then you should **really consider an alternative**, to improve their **user experience (UX)**. On top of that, bots can also bypass a captcha <small>(at least it seems so, but I didn't try)</small>.

<hr class="sl">

## For ReCaptchaV2, my notes

* (v2) put a html tag looking like that `<div class="g-recaptcha" data-sitekey=""></div>`
* (v2) in your PHP

```php
$post_data = array('secret' => 'your-secret-key', 'response' => 'data-site-key');
// send post request (look for code/library on the WEB)
// ...
// to https://www.google.com/recaptcha/api/siteverify
// and check the result
```

To put words to it, Google will add a key to the form, which need to be verified using their API (PHP). You need to provide your secret and the submitted key, and you will get to know if it's valid or not.