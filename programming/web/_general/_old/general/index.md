# Web programming

* You can set up a [(virtual) local server](../../apache/wamp.md)


Performance and best practices

* [Content delivery network (CDN)](cdn.md): they are making your website faster (because they are faster than loading local resources)
* you may use images .webp images instead of PNG/JPG
* [imagekit.io](https://imagekit.io/): proposing services to handle your images (optimization, etc.) for free up to 20Gb of bandwidth/month (not tested 😶)
* I'm not too familiar with this, but this article about [HTTP Cache](https://web.dev/http-cache/) is good

* [Structured Data](structured.md): give information about the content of your website

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