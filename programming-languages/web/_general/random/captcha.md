# Captcha

<div class="row row-cols-md-2"><div>

Captcha are used in forms to prevent attacks such as brute forcing a login form or a reset password form. It used to try to determine or ensure the requester is human "**I'm not a robot**" 🤖.

The most used solution is [**ReCaptcha**](https://developers.google.com/recaptcha/intro) by Google. The most known if the one prompting us to solve a challenge (**v2**) while there is a version in which the captcha is silently analyzing the user behavior and may prompt them to do a captcha (**v3**).

The most well-known alternative is [**hcaptcha**](https://www.hcaptcha.com/). It can be significantly harder to solve that reCaptcha. 
</div><div>

⚠️ Before implementing a captcha, you should consider the best way to add it to avoid tiring users, and question if it's really required.

✅ For instance, you can only add a captcha after 1-2 failed tries.
</div></div>

<hr class="sep-both">

## ReCaptchaV2

<div class="row row-cols-md-2"><div>

First, you need to create a [site key](https://developers.google.com/recaptcha/intro) and allow your website domain. Then, add a reCaptcha `div` where you want to see the captcha.

```xml!
...
<div class="g-recaptcha" data-sitekey=""></div>
...
```
</div><div>

You have to send the captcha data that was submitted by the user to [Google API](https://www.google.com/recaptcha/api/siteverify) for verification. They will check it, and tell you if the captcha is valid or not.
</div></div>