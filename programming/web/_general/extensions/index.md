# Browser plugins/extensions

<div class="row row-cols-md-2 mb-3"><div>

You can add extensions/plugins to your browser, for instance, [DarkReader](https://darkreader.org/) or [uBlock](https://ublockorigin.com/). It's quite easy to write your own! 🚀

* 👉 You will use [JavaScript](/programming/web/javascript/_general/index.md), and access the [DOM](/programming/web/javascript/_general/dom.md)
* 👉️ You will use [HTML](/programming/web/html/index.md) if you want to show a popup with some buttons/... when the user clicks on your extension.
* 👉  There are new functions to access features like Bookmarks/...
</div><div>

**Where to learn?**

* [Chrome extensions](https://developer.chrome.com/docs/extensions/mv3/) + [API reference](https://developer.chrome.com/docs/extensions/reference/) + [Samples](https://github.com/GoogleChrome/chrome-extensions-samples)
* [Microsoft Edge extensions](https://learn.microsoft.com/en-us/microsoft-edge/extensions-chromium/) (👻)
* [Firefox extensions](https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions) + [Examples](https://github.com/mdn/webextensions-examples) (👻)

<br>

**Where to add/enable extensions?**

* **Edge**: Go to `edge://extensions/`, enable `Developer mode`, click on `Load unpacked`, and select the folder with your `manifest.json`.
* **Chrome**: Go to `chrome://extensions`, enable `Developer mode`, click on `Load unpacked`, and select the folder with your `manifest.json`.

</div></div>

<hr class="sep-both">

## Templates

<div class="row row-cols-md-2"><div>

Extension Templates can make working with extensions easier.

* ✨ These can preconfigure React/Typescript/...
* ✨ These can reload automatically the extension
* ...
</div><div>

#### chrome-extension-typescript-starter

[GitHub](https://github.com/chibat/chrome-extension-typescript-starter) (1.2k ✨, React, Typescript, Jest)

<details class="details-n">
<summary>See my notes</summary>

➡️ **Get started**

```bash
$ git clone https://github.com/chibat/chrome-extension-typescript-starter.git my-extension
$ cd .\my-extension\
$ npm install
$ npm update
$ npm run watch
```

The extension is automatically reloaded inside the browser.

➡️ **Bootstrap**

To load bootstrap, download it locally, and store it inside a directory in `public` (ex: lib/). Then in `popup.html`, use

```
<link href="lib/css/bootstrap.min.css" rel="stylesheet">
<script src="lib/js/bootstrap.bundle.min.js"></script>
```

➡️ **MANIFEST**

For JS files in the Manifest, `src/*.ts` will generate a file `js/*.js`.

```json!
"background": {
    "service_worker": "js/background.js"
},
```
</details>

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

## Reloading an extension

<div class="row row-cols-md-2"><div>

You need to **reload**  an extension, **manually**, each time you changed

* 👉️ The Manifest
* 👉️ Any script <small>(+ refresh the page)</small>

But, you don't need to if you only edited an HTML file.

* Go to your plugin page
* Use a `refresh`/`reload` button to reload your extension
</div><div>

Additional notes

* ➡️ You can also see plugin errors from the plugin page
* ➡️ Right-click on an extension in the toolbar, and use "Inspect" to open the console associated with `popup.html`

To reload your extension "automatically", you may

* Try [chrome-extensions-reloader](https://github.com/arikw/chrome-extensions-reloader) (👻)
* Call `chrome.runtime.reload()` <small>(not available in a content_script)</small>.
</div></div>

<hr class="sep-both">

## Manifest.json

[See Manifest.json](https://developer.chrome.com/docs/extensions/mv3/manifest/)

<div class="row row-cols-md-2"><div>

The version 2 is deprecated, make sure to use version 3. 🚀

```json!
  "manifest_version": 3
```

#### Metadata

The `name`, the `description`, and the `version` are up to you.

```json!
  "name": "Hello, World",
  "version": "0.0.1",
  "description": "Print \"Hello, World\" in the console",
```

The icon should be provided in multiple sizes: `16`, `32`, `48` and `128`.

```json!
  "icons": {
    "16": "icons/hello_world_16.png",
    "32": "icons/hello_world_32.png",
    "48": "icons/hello_world_48.png",
    "128": "icons/hello_world_128.png"
  }
```

#### Popup

To show a popup when the user clicks on the plugin icon, use `action/default_popup`.

```json!
  "action": {
    "default_popup": "popup/popup.html",
	"default_icon": "icons/hello_world_16.png"
  }
```

A simple `popup.html`.

```html!
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Hello, World</title>
</head>
<body>
<div>
    <p>Hello, World</p>
    <!-- load popup/popup.js -->
    <script src="popup.js"></script>
</div>
</body>
</html>
```

</div><div>

#### Content

If you want to load one or more scripts that **needs to interact with the DOM**, use **content_script**.

```json!
  "content_scripts": [
    {
      "matches": ["<all_urls>"],
      "js": ["scripts/main.js"]
    }
  ]
```

You can use `matches` to filter which URLs will execute the script.

```json!
  "content_scripts": [
    {
      "matches": ["https://example.com/*"],
      "js": ["scripts/main.js"]
    }
  ]
```

➡️ [See match patterns](https://developer.chrome.com/docs/extensions/mv3/match_patterns/).

#### Worker

If you want to load one or more scripts that **needs to access the browser features** <small>(bookmarks...)</small>, use **background**.

```json!
  "background": [
    {
      "matches": ["<all_urls>"],
      "js": ["scripts/bg.js"]
    }
  ]
```

#### web_accessible_resources

You can define inside that resource can be accessed from the browser. Use `chrome.runtime.getURL("???")` to get a resource.

```json!
  "web_accessible_resources": [
    {
      "resources": ["???"], 
      "matches": ["<all_urls>"]
    }
  ]
```

</div></div>

<hr class="sep-both">

## Scripts

<div class="row row-cols-md-2"><div>

A predefined variable will allow you to access the browser.

* 👉 On Chrome, the variable is called `chrome`
* 👉 On Firefox, the variable is called `browser`

➡️ The predefined variable for the browser **won't have** many attributes when used in `content_scripts`.

#### Tabs

Fetch a tab

```javascript
// ➡️ ex: popup.js
chrome.tabs.query({ active: true, currentWindow: true }, function(tabs) {
    const url = tabs[0].url;
    const title = tabs[0].title;
    const id = tabs[0].id
    // ...
})
chrome.tabs.query({ url: [] }, function (tabs) {})
```

Create, or update a tab

```javascript
// 🔐 "tabs"
await chrome.tabs.create({ url: "URL" })
await chrome.tabs.update(tab.id, { active: true });
await chrome.windows.update(tab.windowId, { focused: true });
```

Create/Update a group

```javascript
// 🔐 "tabGroups"
const group = await chrome.tabs.group({ tabIds });
await chrome.tabGroups.update(group, { title: "xxx" });
```
</div><div>

#### Messaging

<p></p>

```javascript
// ➡️ Sender - ex: popup.js
chrome.tabs.sendMessage(tabs[0].id,
    { /* custom data */ },
    function(response) { /* ... */}
);

// ➡️ Receiver - ex: a content script
chrome.runtime.onMessage.addListener(function(request, sender, sendResponse) {
    // ...
    sendResponse({ /* custom */ });
});
```

#### Scripting

<p></p>

```javascript
// 🔐 "scripting"
chrome.scripting.insertCSS({ files: ["focus-mode.css"], target: { tabId: tab.id },});
chrome.scripting.removeCSS({ files: ["focus-mode.css"], target: { tabId: tab.id },});
```

#### Badge

The page is the icon shown in the toolbar.

```javascript
// ➡️ Inside popup.*
badge.textContent = `XXX`;
// ➡️ Otherwise,
chrome.action.setBadgeText({ text: "xxx", });
chrome.action.setBadgeText({ tabId: tab.id, text: "yyy", });
chrome.action.getBadgeText({ tabId: tab.id });
```

```javascript
// ➡️ When users click on the badge
// ➡️ When users use the shortcut (if any)
chrome.browserAction.onClicked.addListener((tab) => {});
```

To add a shortcut opening the badge, use

```json
{
  "commands": {
    "_execute_action": {
      "suggested_key": {
        "default": "Ctrl+M",
        "mac": "Command+M"
      }
    }
  }
}
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [Polyfill](https://github.com/mozilla/webextension-polyfill)

```json
{
  "homepage_url": "XXX",
  "background": {
    "service_worker": "background.js"
  },
  "host_permissions": [ "://*" ],
  "permissions": ["activeTab"]
}
```

* `host_permissions`: root, but only on some websites
* [See permissions](https://developer.chrome.com/docs/extensions/mv3/declare_permissions/)
</div><div>

```javascript
chrome.runtime.onInstalled.addListener(() => {});

document.addEventListener("pageshow", xxx);

chrome.contextMenus.create({ id: "xxx", title: "xxx", contexts: ['selection'] });
chrome.contextMenus.onClicked.addListener(function(info, tab) {
    if (info.menuItemId == "xxx") {     
        const word = info.selectionText;
        // ...    
    }
});
```

* [plasmo](https://github.com/PlasmoHQ/plasmo) / [chrome-types](https://www.npmjs.com/package/chrome-types)
</div></div>