# Electron

<div class="row row-cols-md-2"><div>

[Electron](https://www.electronjs.org/) is a library to develop **cross-platform applications in JavaScript**. You can use it with frameworks such as Vue.js, React, Angular, or simply HTML+CSS.

Electron is running your application in a Chromium web browser. If enabled, you can open the devtools with **CTRL+SHIFT+I**.

Some applications made using electron are VSCode, Discord, GitHub Desktop, MongoDBCompass, and Microsoft Teams...

* [Documentation](https://www.electronjs.org/docs/latest/)
</div><div>

Electron is following a fast-moving development pace, so there are frequently releasing major releases 😥.

* [electron-quick-start](https://github.com/electron/electron-quick-start) (10.2k ⭐)
* [secure-electron-template](https://github.com/reZach/secure-electron-template) (1.4k ⭐) and [new-to-electron](https://github.com/reZach/secure-electron-template/blob/master/docs/newtoelectron.md)
* [electron-sample-apps](https://github.com/hokein/electron-sample-apps)  (3.8k ⭐)
* [examples-electron](https://github.com/akabekobeko/examples-electron) (0.2k ⭐)

Other interesting projects

* [electron-seamless-titlebar](https://github.com/binaryfunt/electron-seamless-titlebar-tutorial) (0.5k ⭐)
* [the-ultimate-electron-guid](https://www.debugandrelease.com/the-ultimate-electron-guide/)
* [awesome-electron](https://github.com/sindresorhus/awesome-electron) (24k ⭐)
</div></div>

<hr class="sep-both">

## ☄️ Electron ~v12 ☄️

<div class="row row-cols-md-2"><div>

Run electron in the current directory

```json
{
  "scripts": {
    "start": "electron ."
  }
}
```

Creating a Window

```js
mainWindow = new BrowserWindow({
    // some properties
    width: 1080, height: 720, icon: "...",
    webPreferences: {
        // ❌ loaded before each view
        // seems deprecated
        preload: path.join(__dirname, './src/preload.js'),
        // ❌ enable remote, deprecated
        // https://github.com/electron/remote
        // ipcRenderer should be used instead
        enableRemoteModule: true
    }
});
```
</div><div>

## Random notes

➡️Open devtools on start, or disable devtools

```js
// Open the DevTools.
mainWindow.webContents.openDevTools();

// Close the DevTools
mainWindow.webContents.on("devtools-opened", () => {
    mainWindow.webContents.closeDevTools();
});
```
</div></div>


<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [electron-build-service](https://github.com/electron-userland/electron-build-service)
* [electron-devtools-installer](https://github.com/MarshallOfSound/electron-devtools-installer)
* Auto-updating electron application
* Secure Electron Source ([article (2019)](https://www.akshaydeo.com/blog/2019/10/28/securing-electron-app-source-code/))
</div><div>

* [Getting started with electronjs](https://dev.to/milburngomes/getting-started-with-electronjs-ep9) (2020)

</div></div>