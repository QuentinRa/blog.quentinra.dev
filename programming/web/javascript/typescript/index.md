# TypeScript

<div class="row row-cols-md-2"><div>

[Typescript](https://www.typescriptlang.org/) is a **typed**, **compiled**, **generic**, and **enhanced** JavaScript.

* 👉 Compiling a `.ts` generates a `.js`
* 👉 The compiler <small>(and IDEs)</small> can detect errors/mistakes
* 👉 The code is cleaner <small>(enums...)</small>
* 👉 You can compile in any version of JavaScript

**Where to learn?**

* [TypeScript handbook](https://www.typescriptlang.org/docs/handbook/typescript-from-scratch.html)
</div><div>

➡️ Install <small>(don't use -g, be clean)</small>

```bash
$ npm install typescript
$ npx tsc --init
```

➡️ Compile

```bash
$ npx tsc
# watch for changes, and compile
$ npx tsc -w
```
</div></div>

<hr class="sep-both">

## XXX

<div class="row row-cols-md-2"><div>

You need to specify the type of every **variables**, **parameters**... unless it's implicit.

```typescript
let n1 = 0; // implicit
let n2 : number = 0; // explicit
let n3 : number; // explicit
let str : string = "";
let xxx : string | undefined | null; // multiple types
// "?" after a parameter means "nullable" (null/undefined)
function f(x: number, y?: boolean) {}
```

➡️ It's a bad practice, but you can use the type **any**, if you don't want to explicitly define the type of something.

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

What was exported, can be imported in another file.

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

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [clean-code-typescript](https://github.com/labs42io/clean-code-typescript)
* [typescript-cheat-sheet](https://www.sitepen.com/blog/typescript-cheat-sheet)
* See TP2/...
</div><div>

```typescript
declare module 'xxx' {
  export default function yyy(): ZZZ;
}
```
</div></div>