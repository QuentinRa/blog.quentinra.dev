# Web programming

There is a lot of knowledge and things that would not be relevant if they were added in a language-specific (security, adaptability, tools, SEO, the HTTP protocol, the developers' tools, the FTP protocol, setting up a server, etc.), hence they will be explained here. Web programming can be viewed from 3 perspectives

<hr class="sl">

## The HTTP protocol

You are using the HTTP protocol, when your browser is requesting something from a server. For instance, when you request `https://duckduckgo.com/`, you are asking the server to GET the page for this URL. We are currently in **HTTP2.0** ([caniuse](https://caniuse.com/http2), [article](https://www.digitalocean.com/community/tutorials/http-1-1-vs-http-2-what-s-the-difference)), but a lot of persons are still using **HTTP1.1** (and some HTTP1.0).

<details class="details-e">
<summary>Webserver root and root URL</summary>

* when settings up a server, you will make a folder available at a URL. Let's say you made it like this
  * **webserver root**: `/path/to/www/`
  * **base/root URL**: `https://myurl.com/`
* As you could guess, this is working like a path, so you could write `https://myurl.com/folder/my_file.html` for `/path/to/www/folder/my_file.html`
  * A lot of programmers are using routers, so this won't always be the case <small>(ex: this website)</small>
  * By default, if you don't write a file in the URL, then `index.html` <small>(or php, or index.extension, according to the list in your configuration)</small> will be loaded <small>(if you got one in the folder associated with the current URL)</small>

For instance, `https://duckduckgo.com/` is the same as `https://duckduckgo.com/index.html`.
</details>

<details class="details-e" open>
<summary>The HTTP protocol (or HTTPS for HTTP Secure) API is allowing us to use</summary>

* `GET URL`: get a resource from the SERVER  <small>(ex: see a page, make a search)</small>
* `POST URL`: create a resource on the server <small>(ex: create an account)</small>
* `PUT URL`: modify a resource on the server <small>(ex: update user's data, or add it, if it didn't have it)</small>
* `PATCH URL`: same as PUT, but can't create a new resource, up to 1 field
* `DELETE URL`: delete a resource on the server <small>(ex: delete account)</small>
</details>

Why did we learn this? Well, you will use this a lot (HTML forms, WEB APIs, etc.). In HTML, you will make **forms** (search, create users, etc.). You **need to know whether they are GET** (search, ...) **or POST** (create user, update user 🙄, delete user 🙄, etc.).

For Web APIs, this is usually written in the documentation, but you should be able to guess too. For instance, you got a route `/user/{id}` (ex:`/user/5`), according to if you are using the method GET/PUT/DELETE/..., the server will expect data (or not) and do something different.

<details class="details-e">
<summary>Note about GET</summary>

When requesting a webpage, you are calling `GET URL`. But you can add parameters. Let's say you are searching something, you can tell us when requesting the page, what's the user is searching for using this syntax `?name=value&another=value&...` such as `GET URL?q=hello%20World` (encoded version of "Hello{space}World"). Anyone can share this URL, and it will open the same page, because the query is inside the URL.
</details>

<hr class="sr">

## WebServer

As you will read in the HTML course, you don't need a server, and you may use the file protocol (same for CSS/JS), but for PHP, you **will need** a server. You may also use it in HTML, as this may be easy to set up.

* You can set up a [(virtual) local server](setup/wamp.md)
* Your root URL is `http://localhost`, but in some rare cases <small>(HTTP is enough in development)</small>, you may  [want to have https://localhost](https://web.dev/how-to-use-local-https/) (HTTPS)
* For Linux users, read this section about [public_html and permissions](setup/perms.md)

Sometimes some students don't want to set up a server and directly work on the remote server. You will need to upload using the FTP protocol (or SCP) your files **every time** you changed something. Some IDEs such as [PHPStorm](../../../archives/tools/jetbrains/index.md#phpstorm) or [VSCode](https://code.visualstudio.com/docs/remote/ssh) that are **automatically updating the files on a remote server** when you changed something. Anyway, I think **you should work on local, for security-related purposes**.

<details class="details-e">
<summary>You will use the <b>FTP protocol</b> (or the command <code>SCP</code>) to send files to a remote server. I'm using a software on Windows, called <a href="https://filezilla-project.org/" target="_blank" rel="noopener noreferrer">FileZilla</a>.</summary>

* once started, go to File > Site Manager
* New site (give it a name in the left column)
  * SFTP (use ssh credentials to login)
  * host (ex: `pedago-etu.ensiie.fr`, the server's URL)
  * check "ask for password"
  * user (ex: `firstname.lastname`)
  * ok and close
* Then now that the config is saved,

Then every time you want to upload files

* click on the right arrow near the logo below "File"
* click on the configuration name
* connect, click on "yes" (if this is the first connection)
* then you should be able to browser, open, send/get files on your remote server
</details>

<hr class="sr">

## Developers' tools (or Devs Tools) 😍

This is most likely the most important thing. Either by pressing **F12** (sometimes), **{Left-click} > Inspect**, or **Settings > ... tools > development tools**, or one of the shortcuts below, you can open it.

* **Tools > elements** or **CTRL+SHIFT+I**: see the **HTML** code of the page, you can edit it, and you can see the **CSS**
* **Tools > <i class="bi bi-box-arrow-in-up-left"></i>** or **CTRL+SHIFT+C**: easily find the code of something, by clicking on it after the mode was triggered
* **Tools > <i class="bi bi-window"></i>** or **CTRL+SHIFT+M**: you can preview the appearance of your website on a phone/tablet/... (**responsive design in CSS**)
* **Tools > Console**: you can execute some **JavaScript**, try `5+5`.
* **Tools > Sources**: see the code source of the page (and at  the bottom of **Tools > Application**)
* **Tools > Application**: see the localStorage (JS), the cookies (PHP), etc.
* **Tools > Problems**: you can see problems using webhint
* **Tools > LightHouse**: you can see the evaluation of a page by LightHouse (Google)

> **Note**: you may not have every menu that I listed here. Some are available after you enabled them (the + in edge, the "... > more tools" in chrome, etc.).

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

**Code-only**

* [W3C validator (HTML)](https://validator.w3.org/) (HTML)
* [W3C Validator](https://jigsaw.w3.org/css-validator/) (CSS)

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

<hr class="sl">

## Sources

* <https://github.com/RaymiiOrg/raymiiorg.github.io>
* [web.dev](https://web.dev/blog/): Google 😬, but there are quite a lot of good articles