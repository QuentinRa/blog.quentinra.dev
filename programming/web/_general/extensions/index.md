# Browser plugins/extensions

<div class="row row-cols-md-2 mb-3"><div>

You can add extensions/plugins to your browser, for instance, [DarkReader](https://darkreader.org/) or [uBlock](https://ublockorigin.com/). It's quite easy to write your own! 🚀

* 👉 You will use [JavaScript](/programming/web/javascript/_general/index.md), and access the [DOM](/programming/web/javascript/_general/dom.md)
* 👉️ You will use [HTML](/programming/web/html/index.md) if you want to show a popup with some buttons/... when the user clicks on your extension.
* 👉  There are new functions to access features like Bookmarks/...
</div><div>

**Where to add/enable extensions?**

* **Edge**: Go to `edge://extensions/`, enable `Developer mode`, click on `Load unpacked`, and select the folder with your `manifest.json`.
* ...

</div></div>

<hr class="sep-both">

## Introduction: Hello, World

Description: this extension prints `"Hello, World"` inside the console of every page you visit.

<div class="row row-cols-md-2"><div>

* Create `manifest.json`

```json
{
  "name": "Hello, World",
  "version": "0.0.1",
  "manifest_version": 3,
  "description": "Print \"Hello, World\" in the console",
  "icons": {
    "128": "icons/hello_world.png"
  },
  "content_scripts": [
    {
      "matches": ["<all_urls>"],
      "js": ["scripts/main.js"]
    }
  ]
}
```
</div><div>

* Create `scripts/main.js`

```javascript
console.log("Hello, World")
```

* Add an icon `hello_world.png` in `icons`. You can use any name you want, but you must edit the `manifest.json` accordingly.

* Add, and enable, the extension inside your browser

* Open a new page, and the devtools console

* You should see `"Hello, World!"`

<br>

**Additional notes**

* ➡️ Tested in Microsoft Edge.
</div></div>

<hr class="sep-both">

### Manifest.json

<div class="row row-cols-md-2"><div>

The version 2 is deprecated, make sure to use version 3. 🚀

```json
{ "manifest_version": 3 }
```

#### Metadata

The `name`, the `description`, and the `version` are up to you.

```
{
  "name": "Hello, World",
  "version": "0.0.1",
  "description": "Print \"Hello, World\" in the console",
}
```

The icon should be provided in multiple sizes: `16`, `32`, `48` and `128`.

```json
{
  "icons": {
    "16": "icons/hello_world_16.png",
    "32": "icons/hello_world_32.png",
    "48": "icons/hello_world_48.png",
    "128": "icons/hello_world_128.png"
  }
}
```

#### Popup

To show a popup when the user clicks on the plugin icon, use `action/default_popup`.

```json
{
  "action": {
    "default_popup": "html/popup.html"
  }
}
```

<details class="details-n">
<summary><code>html/popup.html</code></summary>

A simple, empty, `popup.html`.

```html
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Hello, World</title>
</head>
<body>
<div>
    <p>Hello, World</p>
</div>
</body>
</html>
```
</details>

</div><div>

#### Content

If you want to load one or more scripts that **needs to interact with the DOM**, use **content_script**.

```json
{
  "content_scripts": [
    {
      "matches": ["<all_urls>"],
      "js": ["scripts/main.js"]
    }
  ]
}
```

You can use `matches` to filter which URLs will execute the script.

```json
{
  "content_scripts": [
    {
      "matches": ["https://example.com/*"],
      "js": ["scripts/main.js"]
    }
  ]
}
```

#### Worker

If you want to load one or more scripts that **needs to access the browser features** <small>(bookmarks...)</small>, use **background**.

```json
{
  "background": [
    {
      "matches": ["<all_urls>"],
      "js": ["scripts/bg.js"]
    }
  ]
}
```

A predefined variable will allow you to access the browser

* 👉 On Chrome, the variable is called `chrome`
* 👉 On Firefox, the variable is called `browser`
</div></div>
<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* ⚠️ Chromium based browsers are using the variable `chrome`, while Firefox is using the variable `browser`. Be careful.️

* ➡️ You need to **reload**  an extension, **manually**, each time you changed something. See also [chrome-extensions-reloader](https://github.com/arikw/chrome-extensions-reloader) (👻).

```
"homepage_url": "XXX",
```
</div><div>

```
chrome.browserAction.onClicked.addListener((tab) => {
  chrome.runtime.reload();
});
```
</div></div>