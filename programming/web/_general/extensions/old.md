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

## Manifest.json (V3)

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
  "background": {
    "service_worker": "background.js"
  },
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
chrome.action.onClicked.addListener((tab) => {});
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
  "host_permissions": [ "://*" ],
  "permissions": ["activeTab"]
}
```

* `host_permissions`: root, but only on some websites
* [See permissions](https://developer.chrome.com/docs/extensions/mv3/declare_permissions/)
</div><div>

* `browserAction` is now `action`

```diff
-chrome.browserAction.XXX
+chrome.action.XXX
```

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