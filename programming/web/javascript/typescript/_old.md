# Typescript

<hr class="sl">

## My notes

This is a summary of things I used in TypeScript. Most of the things you will use are JavaScript features so I won't point them out.

```ts
// this variable may only take numbers
let a_number : number;
let a_string : string = "";
let a_string_too = ""; // implicit
let yet_another_string = `I'm using a variable: ${a_number} inside the string`;

// can take any kind of value, not a good idea
let any_kind : any;
// either undefined or null
let variable : undefined | null;

// if a is undefined/null then b=0 else b=a
let b = a ?? 0;

// suppress a warning
// @ts-ignore
// <the code raising a warning here>

// this enum is public, so it can be used in
// other files
export enum Name {
}

// import exported elements from a file.ts
// A/B can be a function, a class, an enum, ...
import { A , B } from "../files/file";

class Example {
    // contructor, only one per class
    constructor(){}
    
    // when declaring a function, you can add return
    // types
    static getString() : string | undefined { return ...; }

    // a getter
    get number() : number { return 10; };
    
    // a setter
    set number(n?: number) { /* code */ };
}

// usage
let example : Example = new Example();
example.number; // evaluates as 10
example.number = 5; // ok since we created a setter

// cast (explicit)
// we are asserting that b is a number of we can
// assign it to c. You only have to do that when
// typescript is not able to guess the type
let c : number = <number>b; 
```

Note that you can add a `?` after a variable name telling typescript that this parameter is optional (so it may be undefined).

<hr class="sr">

## CheatSheets

To be honest, I haven't read them yet for I looked for some links just in case someone didn't known about this kind of document

* <http://hoomanb.com/cs/quickref/typescript_cheatsheet.pdf>
* <https://codingcheats.io/typescript>
* <https://elfi-y.medium.com/a-reference-sheet-for-typescript-function-class-379578e776fb>

<hr class="sl">

## Sources

* <https://www.typescriptlang.org/docs/>
* <https://www.codevscolor.com/pages/typescript-tutorials>