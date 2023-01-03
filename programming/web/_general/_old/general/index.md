# Web programming

* You can set up a [(virtual) local server](setup/wamp.md)
* Your root URL is `http://localhost`, but in some rare cases <small>(HTTP is enough in development)</small>, you may  [want to have https://localhost](https://web.dev/how-to-use-local-https/) (HTTPS)

<hr class="sr">

## Security

I'm still learning, but here is my list

* [Captcha](security/captcha.md): if you want to make sure that your users are real humans (ReCaptcha/hCaptcha)
* [Front-End code exposed](security/code.md): your code is running in someone else browser, so they can do what they want with it
* [Secure Apache server](security/apache.md)
* [Subresource Integrity (SRI)](security/sri.md): it's good to use CDN, but did you know that there are risks?
* [SSL practices](security/ssl.md): some notes about SSL (SSL+TLS, secure protocols for HTTPS)
* [Headers](security/headers.md): often overlooked, but the headers send with your page will increase the security, and prevent some well-known attacks
* [add rel attribute to external links](security/links.md): it seems unneeded as of 2021
* [forbidden usernames](security/usernames.md): do not let users take "root", "admin", ... as their username
* [FORM (GET, POST) and URLs](security/url.md): for beginners, some note about "/user/{id}"

**Injections**

* [XSS injections](security/injections/xss.md)
* [PHP injections](security/injections/php.md)

You will get more notes in the Cybersecurity course.

<hr class="sl">

## Accessibility

* [Apple touch icon](accessibility/apple-touch.md): something for Apple's users
* [robots.txt](accessibility/robots.md): for robots
* [humans.txt](accessibility/humans.md): for humans
* [OG/twitter meta](seo/og-twitter.md): improve the short card shown for your website on Facebook, Twitter, and many applications using OpenGraph such as Discord

<hr class="sr">

## Performance and best practices

* [Content delivery network (CDN)](performance/cdn.md): they are making your website faster (because they are faster than loading local resources)
* you may use images .webp images instead of PNG/JPG
* [imagekit.io](https://imagekit.io/): proposing services to handle your images (optimization, etc.) for free up to 20Gb of bandwidth/month (not tested 😶)
* I'm not too familiar with this, but this article about [HTTP Cache](https://web.dev/http-cache/) is good

<hr class="sl">

## Search Engine Optimization (SEO)

* [Titles](seo/titles.md)
* [Descriptions](seo/descriptions.md)
* Do not use META KEYWORDS
* [Sitemap](seo/sitemap.md): give the page search engines may index
* [Structured Data](seo/structured.md): give information about the content of your website
* [Canonical URL](seo/canonical.md): as `/` and `/index.html` are the same page, what URL should I pick?

<hr class="sr">

## Bunch of tools

It's better when everything is automated, right? Here is my list of links that may provide tools (mostly free 🤑, <s>as you are the product</s>)

**Make more than one kind of check on a page/the whole website**

* [WebHint](https://webhint.io/) (security, accessibility, compatibility, performance) - **edit 01/11/2021, the online scanner was removed 😬**
* [ionos](https://www.ionos.com/tools/website-checker) (general, SEO, performance, secure)
* [sitechecker](https://sitechecker.pro/) (**whole site, up to 150 pages**, general, SEO, HTML, but you **can't see where** without starting a trial)
* [Google's pagespeed](https://developers.google.com/speed/pagespeed/insights/) (performance)
* [Google's Lighthouse](https://web.dev/measure/) (performance, accessibility, SEO, best practices, **do not forget to click on view report**)
* [SEO site checkup](https://seositecheckup.com/analysis) (SEO, security), you can [test every tool individually](https://seositecheckup.com/tools) (limited to 1/day)
* [webpagetest](https://www.webpagetest.org/) (😍 the best, SEO, performance, security)

**SEO-only**

* [biq.cloud](https://biq.cloud/rank-intelligence/) (see your website ranking for a keyword, **need to register**)
* [siteliner](https://www.siteliner.com/) (**whole site, up to 250 pages**, SEO)
* [SEO tools](https://www.sanderheilbron.nl/) (SEO peek is quite handy 😍)
* [stats about a domain](https://www.gositestat.com/)
* [SEO tools: speed, CDN, headers](https://www.uptrends.com/tools)

**Security-only**

* [Snyk](https://snyk.io/website-scanner/) (my buddy 😏)

**Others**

* [Find broken links](https://www.drlinkcheck.com/) or write some code to crawl the links on your website and use [httpstatus](https://httpstatus.io/)
* [Check robots.txt, sitemap, compress images, etc.](https://www.websiteplanet.com/webtools/)
* [search/generate domain name](https://instantdomainsearch.com)