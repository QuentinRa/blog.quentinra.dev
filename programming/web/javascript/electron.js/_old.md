## Electron

**[Updated notes](index.md)**

electron is a js framework allowing you to write a desktop
app in html/css/js (even typescript, react, boostrap, ...).
In fact, electron is loading your code in a
chromium browser so you can use features like
``CTRL-SHIFT-I`` to open the console.

Applications like discord or MongoDBCompass were
made using electron.

There are a lot of release so electron is changing
quite a lot, when I made my app I was in electron
12 but I didn't use any of the latest security practices.
You should check these before you start

* [my project](https://github.com/lgs-games/prim/tree/master/version_js), I may not
  be secure and I'm using a lot of deprecated things but the project is not intended
  to be secure (for now at least) and the code is quite easy to understand
  if you are starting learning electron
* [secure electron template](https://github.com/reZach/secure-electron-template)
* [simple electron template](https://github.com/electron/electron-quick-start)
* [examples](https://github.com/hokein/electron-sample-apps)
* [4 examples](https://github.com/akabekobeko/examples-electron)

If i were to do something clean, I would start using
the secure electron template, removing everything
that I won't use (such as react because I'm a boostrap
enjoyer for now). Once I'm done, then I would actually
start coding, starting with making
[this](https://github.com/binaryfunt/electron-seamless-titlebar-tutorial)
working in the template.

<hr class="sep-both">

## Notes

Starting the app

```json
"scripts": {
    "start": "electron ."
}
```

Creating a window

```js
mainWindow = new BrowserWindow({
    // some properties
    width: ???, height: ???, icon: ???,
    webPreferences: {
        // loaded before each view
        // seems deprecated
        preload: path.join(__dirname, './src/preload.js'),
        // enable remote, deprecated
        // https://github.com/electron/remote
        // ipcRenderer should be used instead
        enableRemoteModule: true
    }
});
```

Enable or disabled ``CTRL-SHIFT-I``

```js
// Open the DevTools.
mainWindow.webContents.openDevTools();

// Close the DevTools
mainWindow.webContents.on("devtools-opened", () => {
    mainWindow.webContents.closeDevTools();
});
```

<hr class="sep-both">

## References

* <https://medium.com/@johndyer24/creating-and-deploying-an-auto-updating-electron-app-for-mac-and-windows-using-electron-builder-6a3982c0cee6>
* <https://dev.to/milburngomes/getting-started-with-electronjs-ep9>
* <https://www.akshaydeo.com/blog/2019/10/28/securing-electron-app-source-code/>
* <https://sectigo.com/ssl-certificates-tls/code-signing>
* <https://interactiveknowledge.com/insights/how-code-sign-electron-app-windows>
* <https://www.electronjs.org/docs/tutorial/code-signing>
* <https://www.geeksforgeeks.org/keyboard-events-in-electronjs/>
* <https://developer.mozilla.org/fr/docs/Web/API/KeyboardEvent/key#key_values>
* <https://www.electronjs.org/docs/tutorial/keyboard-shortcuts>
* <https://github.com/jcubic/jquery.terminal>
* <https://caniuse.com/urlsearchparams>
* <https://stackoverflow.com/questions/901115/how-can-i-get-query-string-values-in-javascript>
* <https://github.com/binaryfunt/electron-seamless-titlebar-tutorial>
* <https://github.com/hokein/electron-sample-apps>
* <https://github.com/akabekobeko/examples-electron>
* <https://github.com/DPr00f/electron-music-player-tutorial>
* <https://stackoverflow.com/questions/12543237/play-audio-with-node-js>
* <https://github.com/reZach/secure-electron-template/blob/master/app/electron/main.js>
* <https://www.i18next.com/overview/getting-started>
* <https://github.com/hokein/electron-sample-apps/tree/master/frameless-window>
* <https://buddy.works/tutorials/building-a-desktop-app-with-electron-and-angular>
* <https://stackoverflow.com/questions/57807459/how-to-use-preload-js-properly-in-electron>
* <https://stackoverflow.com/questions/37884130/electron-remote-is-undefined/63612780#63612780>
* <https://stackoverflow.com/questions/30682121/including-an-html-file-into-another-html-file-using-handlebars-js>
* <https://stackoverflow.com/questions/45310489/is-it-safe-to-build-a-game-with-javascript-electron-three-js>
* <https://github.com/nklayman/electron-multipage-example>
* <https://stackoverflow.com/questions/59498415/navigating-through-multiple-pages-in-an-electron-app>
* <https://stackoverflow.com/questions/33599908/electron-app-multiple-html-files>
* <https://dev.to/milburngomes/getting-started-with-electronjs-ep9>
* <https://stackoverflow.com/questions/63866077/electron-js-desktop-app-not-showing-even-after-calling-show-function-on-new-wi>