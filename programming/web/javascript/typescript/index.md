# TypeScript

<div class="row row-cols-md-2"><div>

[Typescript](https://www.typescriptlang.org/) is a **typed**, **compiled**, **generic**, and **enhanced** JavaScript.

* 👉 Compiling a `.ts` generates a `.js`
* 👉 The compiler <small>(and IDEs)</small> can detect errors/mistakes
* 👉 The code is cleaner <small>(enums...)</small>
* 👉 You can compile in any version of JavaScript

**Where to learn?**

* [TypeScript docs](https://www.typescriptlang.org/docs/)
</div><div>

➡️ Install <small>(don't use -g, be clean)</small>

```bash
$ npm install typescript
$ npx tsc --init # create a tsconfig.json
```

➡️ Compile

```bash
$ npx tsc --project tsconfig.json
$ npx tsc --project tsconfig.json -w # auto-compile
```

➡️ Creating/using a `tsconfig.json` ([doc](https://www.typescriptlang.org/tsconfig)) is optional.
</div></div>

<hr class="sep-both">

## 🔎 General overview 🔎

<div class="row row-cols-md-2"><div>

You need to specify the type of every **variable**, **parameter**... unless it's implicit.

```typescript
let n1 = 0; // implicit
let n2 : number = 0; // explicit
let n3 : number; // explicit
let str : string = "";
let xxx : string | undefined | null; // multiple types
// "?" after a parameter means "nullable" (null/undefined)
function f(list: number[], xxx?: boolean, yyy = false) {}
// add a return type
function f() : string | null {}
```

➡️ It's a bad practice, but you can use the type **any**, if you don't want to explicitly define the type of something.

➡️ If you know that something is not null, use `!!`

```typescript
// querySelector returns Element | null -> Element
const xxx : Element = document.querySelector("#xxx")!!
```

#### Disable a warning

You can do it by adding `@ts-ignore` before any unresolvable warning.

```javascript
// @ts-ignore
/* code generating a warning */ 
```

</div><div>

#### JavaScript syntax

These may have been added in newer versions of JavaScript.

```typescript
let x = y ?? 0 // if "y" is null/undefined, then x = 0

// cast to a more specific type
let random : any = 5
let fiveNumber : number = <number>random;

// enums
enum Enum { A, C = 2, D } // values are [0, 2, 3]
```

#### Export/Import

What was exported, can be imported into another file.

```typescript
// file.ts
export function xxx() {}
export class YYY {}
export enum ZZZ {}
```

```typescript
// xxx.ts
import { xxx, YYY, ZZZ } from "../files/file";
```
</div></div>

<hr class="sep-both">

## 🗃️ Classes 🗃️

<div class="row row-cols-md-2"><div>

The syntax is mostly the same as in JavaScript. Modifiers to change the visibility were added: **public**, **private**, and **protected**.

```typescript
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

#### Getter and setters

There is a new way to write getters/setters.

```typescript
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

```typescript
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

```json
{
  "name": "xxx-library",
  "version": "0.0.1"
}
```

You can install it from another project with

```bash!
$ npm i ../path/to/your/local/library
```
</div><div>

This will create a link to the library inside your project, so you don't need to update the library each time you changed something.

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
</div><div>

```typescript
declare module 'xxx' {
  export default function yyy(): ZZZ;
}
```
</div></div>