## My notes about electron

[Go back](../../../../../archives/info/very_old/node)

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