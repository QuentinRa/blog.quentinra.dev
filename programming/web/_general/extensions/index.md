# Browser plugins/extensions

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