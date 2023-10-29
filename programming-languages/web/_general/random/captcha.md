# Captcha

<div class="row row-cols-lg-2"><div>

A captcha is used in forms to prevent attacks such as brute forcing a login form or a reset password form. It is used to try to determine or ensure the requester is human "**I'm not a robot**" 🤖.

The most used solution is [**reCAPTCHA**](https://developers.google.com/recaptcha/intro) by Google. The most known version is the one prompting us to solve a challenge (**v2**) while there is a version in which the captcha is silently analyzing the user behavior and may prompt them to do a captcha (**v3**).

The most well-known alternative is [**hcaptcha**](https://www.hcaptcha.com/). It can be significantly harder to solve than reCAPTCHA. 
</div><div>

⚠️ Before implementing a captcha, you should consider the best way to add it to avoid tiring users, and question if it's required.

✅ For instance, you can only add a captcha after 1-2 failed tries.
</div></div>

<hr class="sep-both">

## reCAPTCHAV2

<div class="row row-cols-lg-2"><div>

First, you need to create a [site key](https://developers.google.com/recaptcha/intro) and allow your website domain. Then, add a reCAPTCHA `div` where you want to see the captcha.

```xml!
...
<div class="g-recaptcha" data-sitekey=""></div>
...
```
</div><div>

Once the form is submitted, you will get some reCAPTCHA data. You'll have to query [Google API](https://www.google.com/recaptcha/api/siteverify) with the data for verification. They will reply back with the result of the test.
</div></div>