# Manifest.json (V3)

<div class="row row-cols-md-2"><div>
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
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [Polyfill](https://github.com/mozilla/webextension-polyfill)
* [plasmo](https://github.com/PlasmoHQ/plasmo) / [chrome-types](https://www.npmjs.com/package/chrome-types)

* `browserAction` is now `action`

```diff
-chrome.browserAction.XXX
+chrome.action.XXX
```
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
</div></div>