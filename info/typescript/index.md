# Typescript

Typescript is a wonderful upgrade of Javascript, allowing
to write a ``.ts`` file an compile it in any version
of javascript creating a ``.js``. The advantages are

* more elements of syntax like enums or
  an advanced syntax
* you can add types to methods, attributes, ...
  to enable the syntax checker and using most
  of your IDE features
  
The official site is here
[typescriptlang](https://www.typescriptlang.org/)
if you want to check.

<hr class="sr">

## Starting

* install using ``npm install -g typescript``
* compile ``npx tsc``
* watch-mode (auto compile) ``npx tsc -w``

You may have to create a config file using ``npx tsc --init``
to define the Javascript version etc.

```json
{
  "compilerOptions": {
    "target": "ES2020",
    "module": "commonjs"
  }
}
```

You may read the official tutorial and start
learning from [here](https://www.typescriptlang.org/docs/handbook/typescript-in-5-minutes.html).