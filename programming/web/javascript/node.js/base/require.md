## Require

[Go back](../../../../../archives/info/very_old/node)

You can import a library (in the dependencies)
using ``require``

```js
const FileSystem = require('fs');
```

Then according to the documentation
for [FileSystem (fs)](https://nodejs.org/api/fs.html)
or [here (better)](https://nodejs.org/en/knowledge/file-system/how-to-read-files-in-nodejs/)
we can then call

```js
FileSystem.readFile('file', 'utf8', function (err, data) {
  if (err) throw err;
  console.log(data);
});

// or
const data = FileSystem.readFileSync('file', 'utf8')
```

So simply check the documentation according to your need,
it's well written and you have a lot of examples
on the web.