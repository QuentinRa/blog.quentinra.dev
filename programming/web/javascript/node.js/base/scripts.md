# Scripts

[Go back](../../../../../archives/info/very_old/node)

In the package.json, we got

```json
{
  "scripts": {
    "start": "node index.js"
  }
}
```

That's a script running the command
``node index.js``. The person using your project
won't need to check this command, this person
will use ``npm start`` so don't forget to write
a **start** script.

> Note that ``node index.js`` is the command to
> run a script using Node, with index.js the path to the
> script.