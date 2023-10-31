# Web development

Web development is usually divided between two sides:

<div class="row row-cols-lg-2"><div>

👲 **Front-end** 👲

This is what is displayed to the user.

* HTML, CSS, JS
* Bootstrap, tailwindcss...
* Vue.js, React, Angular, Ionic
* ...
</div><div>

🌍 **Back-end** 🌍

The servers, the databases, and everything else.

* PHP, Django, Symfony, Laravel...
* SQL, NoSQL
* Node.js, Express.js, Nest.js...
* ...
</div></div>

There is also 👑 **Full-Stack** 👑 which is both the front-end and the back-end, along Mobiles <small>(React Native...)</small> and Desktops <small>(Electron...)</small>.

<hr class="sep-both">

## Get Started

<div class="row row-cols-lg-2"><div>

#### Client

A client is a browser that will be used to access a website. Most of the front-end languages can be used without a server:

* HTML
* CSS
* JavaScript

Simply drag-and-drop your HTML file inside your browser. Notice that the protocol is `file://` instead of `http://` or `https://`.
</div><div>

#### Server

Most apps use a client-server approach. A client will request pages of a website <small>(HTML, CSS, JS...)</small> to a webserver that can use a server-side technology to generate them.

It means that we need to set up a web server:

* We often use [Apache](/operating-systems/cloud/webservers/apache/index.md) or nginx for PHP apps.
* [Node.js](/programming-languages/web/node.js/_general/index.md) apps are usually creating a server  from the code.

➡️ See also: [Webserver Routing](/operating-systems/cloud/webservers/_knowledge/routing.md).

➡️ To upload files to a remote server, use: [SCP](/operating-systems/networking/protocols/scp.md), [FileZilla](/operating-systems/windows/developers/index.md#file-transfer-protocol-ftp), etc.
</div></div>

<hr class="sep-both">

## 😍 Developer tools (devtools) 😍

<div class="row row-cols-lg-2"><div>

The devtools are tools for developers. You can open it using

* <kbd>F12</kbd> or <kbd>Left-click > Inspect</kbd> ✨
* <kbd>Settings > ... tools > development tools</kbd> 😅

The 4 most used tools are

* **Tools > elements** <span class="small">(<kbd>CTRL+SHIFT+I</kbd>)</span>: see/edit the HTML/CSS
* **Tools > <i class="bi bi-box-arrow-in-up-left"></i>** <span class="small">(<kbd>CTRL+SHIFT+C</kbd>)</span>: select an element and see the corresponding HTML code in the Element tab.
* **Tools > <i class="bi bi-window"></i>** <span class="small">(<kbd>CTRL+SHIFT+M</kbd>)</span>: preview the website on a phone...
* **Tools > Console**: execute some JavaScript, try: `41+1`
</div><div>

There are a lot more tools. If some are not available for you, you may have to enable them <small>(see "+" in Edge, see "... > more tools" in Chrome...)</small>.

* **Tools > Sources** 🕵️: see the code source of the page
* **Tools > Application** 🪄: see the local storage, the cookies, etc.
* **Tools > Problems** 🧟: you can see problems using webhint
* **Tools > LightHouse** 🥇: you can see the evaluation of a page by LightHouse (Google)

➡️ There is also a color picker, allowing you to find which color was used somewhere on a website.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* Progressive Web Apps (PWA)
* [Server Side Includes](https://en.wikipedia.org/wiki/Server_Side_Includes) (SSI)
* WebAssembly
</div><div>

* [Heroku](https://www.heroku.com/home) / [Heroku (student)](https://www.heroku.com/students) (👻)
* [elm](https://elm-lang.org/)
* [vercel](https://vercel.com/)
* [Modern web](https://modern-web.dev/guides/)
* [Google Code Labs](https://codelabs.developers.google.com/)
* [Firebase](https://firebase.google.com/)
</div></div>