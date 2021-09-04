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

You are using the HTTP protocol, when your browser is requesting something from a server. For instance, when you request `https://duckduckgo.com/`, you are asking the server to GET the page for this URL. We are currently in **HTTP2.0** ([caniuse](https://caniuse.com/http2), [article](https://www.digitalocean.com/community/tutorials/http-1-1-vs-http-2-what-s-the-difference)), but a lot of persons are still using **HTTP1.1** (and some HTTP1.0).

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
* `PATCH URL`: same as PUT, but can't create a new resource
* `DELETE URL`: delete a resource on the server <small>(ex: delete account)</small>
</details>

Why did we learn this? Well, you will use this a lot (HTML forms, WEB APIs, etc.). In HTML, you will make forms (search, create users, etc.). You **need to know whether they are GET** (search, ...) **or POST** (create user). For Web APIs, this is usually written in the documentation, but you should be able to guess too.

Usually, in APIs, you got a route such as `/user/{id}` such (ex:`/user/5`) and according to if you are using the method GET/PUT/DELETE/..., the server will expect data (or not) and do something different.

<hr class="sr">

## WebServer

As you will read in the HTMl course, you don't need a server an use the file protocol (same for CSS/JS), but for PHP, you will need a server. You may also use it in HTML, as this may be easy to set up.

* You can set up a [(virtual) local server](setup/wamp.md)
* You can set up a [apache server on linux](setup/apache.md)

Sometimes some students don't want to set up a server and directly work on the remote server. You will need to upload using the FTP protocol (or scp) your files **everytime** you changed something. Some IDEs such as [PHPStorm](../../tools/jetbrains/index.md#phpstorm) or [VSCode](https://code.visualstudio.com/docs/remote/ssh) that are **automatically updating the files on a remote server** when you changed something. Anyways, I think **you should work in local, for security-related purposes**.

<details>
<summary>You will use the <b>FTP protocol</b> (or the command <code>scp</code>) to send files on a remote server. I'm using a software on Windows, called <a href="https://filezilla-project.org/" target="_blank" rel="noopener noreferrer">FileZilla</a>.</summary>
<br>

* once started, go to File > Site Manager
* New site (give it a name in the left column)
  * SFTP (use ssh credentials to login)
  * host (ex: `pedago-etu.ensiie.fr`, server url)
  * check ask for password
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
* **Tools > Sources**: see the code source of the page
* **Tools > Application**: see the localStorage (JS), the cookies (PHP), etc.
* **Tools > Problems**: you can see problems using webhint
* **Tools > LightHouse**: you can see the evaluation of a page by LightHouse (Google)

> **Note**: you may not have every menu that I listed here. Some are available after you enabled them (the + in edge, the "... > more tools" in chrome etc.).

<hr class="sr">

## Security

I'm still learning, but here is my list

* [Captcha](security/captcha.md): if you want to make sure that your users are real humans (ReCaptcha/hCaptcha)
* [Front-End code exposed](security/code.md): your code is running in someone else browser, so they can do what they want with it

<hr class="sl">

## Accessibility

* [Apple touch icon](accessibility/apple-touch.md): something for Apple's users
* [robots.txt](accessibility/robots.md): for robots
* [humans.txt](accessibility/humans.md): for humans

<hr class="sr">

## Performance and best practices

...

<hr class="sl">

## Search Engine Optimization (SEO)

...

<hr class="sr">

## Sources

...