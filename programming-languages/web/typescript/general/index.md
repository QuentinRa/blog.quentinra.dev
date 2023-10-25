# TypeScript

<div class="row row-cols-md-2"><div>

[TypeScript](https://www.typescriptlang.org/) is a **typed**, **compiled**, **generic**, and **enhanced** JavaScript.

* 👉 Compiling a `.ts` generates a `.js`
* 👉 The compiler <small>(and IDEs)</small> can detect errors/mistakes
* 👉 The code is cleaner <small>(enums...)</small>
* 👉 You can compile into any version of JavaScript

**Where to learn?**

* [TypeScript docs](https://www.typescriptlang.org/docs/)
</div><div>

➡️ Install <small>(don't use -g, be clean)</small>

```shell!
$ npm install typescript
$ npx tsc --init # create a tsconfig.json
```

➡️ Compile

```shell!
$ npx tsc --project tsconfig.json
$ npx tsc --project tsconfig.json -w # auto-compile
```

➡️ Creating/using a `tsconfig.json` ([doc](https://www.typescriptlang.org/tsconfig)) is optional.
</div></div>

<hr class="sep-both">

## 🔎 General overview 🔎

<div class="row row-cols-md-2"><div>

You need to specify the type of every **variable**, **parameter**... unless it's implicit, e.g., it can be deduced by the compiler.

**Some types**

```typescript!
// 👉 Basics
let aaa : any = ""; // ❌ bad/too generic
let bbb : number = 0;
let ccc : string = "xxx";
let ddd : boolean = true;
// 👉 a variable can have multiple types
let eee : string | undefined | null = undefined;
// 👉 Object
let fff : object = {};
let ggg : { x: string } = { x: "xxx" };
let hhh : (v: string) => string = ((v) => v);
let iii : number[] = [5, 10];
let jjj : [string, string] = ["xxx", "yyy"];
// 👉 Special
let kkk : Promise<string> = (async () => ("xxx"))();
```

If you know that something is not null, use `!!`

```typescript!
// querySelector returns Element | null -> Element
const xxx : Element = document.querySelector("#xxx")!!
```

You can create aliases for types:

```typescript!
type XXX = Record<string, string>
let xxx : XXX = {};
```

➡️ See also Classes, Interfaces, and Records.
</div><div>

#### Functions

Inside a function, instead of `x: type | undefined | null`, you can use `x?: type` which is the same.

```typescript!
// 👉 A function parameters
function f(list: number[], xxx?: boolean, yyy = false) {}
// 👉 A return type
function f() : string | null {}
```

#### Disable a warning

You can do it by adding `@ts-ignore` before any unresolvable warning.

```javascript!
// @ts-ignore
load(xxx); // code generating a warning 
```

#### JavaScript syntax

These may have been added in newer versions of JavaScript.

```typescript!
let x = y ?? 0 // if "y" is null/undefined, then x = 0

// cast to a more specific type
let random : any = 5
let fiveNumber : number = <number>random;

// enums
enum Enum { A, C = 2, D } // values are [0, 2, 3]
```

#### Export/Import

What was exported, can be imported into another file.

```typescript!
// file.ts
export function xxx() {}
export class YYY {}
export enum ZZZ {}
```

```typescript!
// xxx.ts
import { xxx, YYY, ZZZ } from "../files/file";
```
</div></div>

<hr class="sep-both">

## 🗃️ Classes 🗃️

<div class="row row-cols-md-2"><div>

The syntax is mostly the same as in JavaScript. Modifiers to change the visibility were added: **public**, **private**, and **protected**.

```typescript!
class Example {
    // ➡️ ex: private static constant
    private static SELECT_KEY = 'match_id';

    // ➡️ attributes
    xxx?: boolean // public, nullable
    public yyy: string = ""

    // ➡️ ex: constructor + private attribute
    constructor(private Id: number) {}

    // ➡️ ex: public static function
    public static getString() : string | undefined {
        return this.SELECT_KEY;
    }

    // ➡️ ex: protected function
    protected doXXX() : number {
        return this.Id
    }
}
```

#### Interfaces

Interfaces are used to declare a Type.

```typescript!
interface XXX {
  xxx?: boolean
  yyy: {
    title: string,
    url: string
  }
}
```
</div><div>

#### Records

Records are objects with dynamic keys.

```typescript!
const x : Record<string, number> = {}
x.five = 5
```

<br>

#### Getters and setters

There is a new way to write getters/setters.

```typescript!
class Example {
    get number() : number { return 10; };
    set number(n?: number) { /* code */ };
}

// usage
let example : Example = new Example();
example.number; // call "get"
example.number = 5; // call "set"
```

<br>

#### Inheritance

It's the same syntax as in JavaScript.

```typescript!
class A {}
class B extends A {
    constructor() {
        super()
    }
}
```
</div></div>

<hr class="sep-both">

## 🥊 Create a TypeScript library 🥊

<div class="row row-cols-md-2"><div>

If you want to create a library, and use it in another local project, you must at least provide a name and a version inside your package.json.

```json!
{
  "name": "xxx-library",
  "version": "0.0.1"
}
```

You can install it inside another project with:

```shell!
$ npm i ../path/to/your/local/library
```
</div><div>

This will create a link to the library inside your project, so you don't need to update the library each time you change something.

You may also update your `tsconfig.json` to use `ESNext`

```json!
{
  "target": "ESNext",
  "module": "ESNext",
  "moduleResolution": "node",
  // ...
}
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [clean-code-typescript](https://github.com/labs42io/clean-code-typescript)
* [typescript-cheat-sheet](https://www.sitepen.com/blog/typescript-cheat-sheet) and [hoomanb](http://hoomanb.com/cs/quickref/typescript_cheatsheet.pdf)
* `never`
* [1loc](https://1loc.dev/)
* tsup

```json!
"module": "ESNext",
"target": "es2021",
"module": "commonjs",
```
</div><div>

```typescript!
declare module 'xxx' {
  export default function yyy(): ZZZ;
}

/** @type {import('xxx').xxx} */
// ...
```
</div></div>